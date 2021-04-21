class HomeController < ApplicationController
  before_action :set_response, only: %i[update destroyCheckBox]
  before_action :set_rating, only: %i[updateMoodRating]
  before_action :set_displayed_question, only: %i[destroy]
  
  def index
    @displayed_questions = DisplayedQuestion.all()
    @member_responses = MemberResponse.all()
    @members = Member.all()
    @displayed_questions = DisplayedQuestion.all()
    @mood_ratings = MoodRating.all()
    @all_comments = Comment.all()

    @slider_pictures = SliderPicture.all()

    if @slider_pictures.first.nil?
      @most_recent_slider = ''
    else
      @most_recent_slider = SliderPicture.find(@slider_pictures.maximum(:id)).image_link 
    end
    
    if @desired_date != Date.today.to_s
      @desired_date = params[:desired_date]
    end

    if current_member.id == :uid
      @referenced_member = current_member
    else
      @referenced_member = Member.find(params[:uid])
    end
    
    @cmts = []

    @all_comments.each do |c|
      if c.recipient_ID == @referenced_member.id && c.comment_date.to_date.to_s == @desired_date
        @cmts.append(c)
      end
    end
  end

  def newQuestion
    @displayed_question = DisplayedQuestion.new
  end


  def createQuestion
    @displayed_question = DisplayedQuestion.new(displayed_question_params)

    respond_to do |format|
      if @displayed_question.save
        format.html { redirect_to home_index_path(uid: current_member.id, desired_date: @displayed_question.question_date.to_date.to_s), notice: 'New Question was successfully saved.' }
        format.json { render :show, status: :created, location: @displayed_questions }
      else
        format.html { render :new }
        format.json { render json: @displayed_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @questionDate = @displayed_question.question_date.to_date.to_s
    @displayed_question.destroy
    redirect_to home_index_path(uid: current_member.id, desired_date: @questionDate)
  end

  def set_displayed_question
    @displayed_question = DisplayedQuestion.find(params[:id])
  end

  def createSliderPicture
    @slider_picture = SliderPicture.new(slider_picture_params)

    respond_to do |format|
      if @slider_picture.save
        format.html { redirect_to home_index_path(uid: current_member.id, desired_date: Date.today.to_s), notice: 'New Picture was successfully saved.' }
        format.json { render :show, status: :created, location: @slider_picture }
      else
        format.html { render :new }
        format.json { render json: @slider_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def newMoodRating
    @mood_rating = MoodRating.new
  end

  def createMoodRating
    @mood_rating = MoodRating.new(mood_rating_params)

    respond_to do |format|
      if @mood_rating.save
        format.html { redirect_to home_index_path(uid: current_member.id, desired_date: Date.today.to_s), notice: 'Mood successfully saved.' }
        format.json { render :show, status: :created, location: @mood_rating }
      else
        format.html { render :new }
        format.json { render json: @mood_rating.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def mood_rating_params
    params.permit(:member_id, :rating, :morning)
  end

  def displayed_question_params
    params.permit(:question, :question_type, :question_date)
  end


  def new
    @member_response = MemberResponse.new
  end

  def edit
  end
  #POST /home or /home.json
  def create
    @member_response = MemberResponse.new(member_response_params)

    respond_to do |format|
      if @member_response.save
        format.html { redirect_to home_index_path(uid: current_member.id, desired_date: Date.today.to_s), notice: 'Response was successfully saved.' }
        format.json { render :show, status: :created, location: @member_responses }
      else
        format.html { render :new }
        format.json { render json: @member_response.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member_response.update_attributes(member_response_params)
        format.html { redirect_to home_index_path(uid: current_member.id, desired_date: Date.today.to_s), notice: "Response was successfully updated." }
        format.json { render :show, status: :ok, location: @member_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member_response.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroyCheckBox
    @member_response.destroy 
    redirect_to home_index_path(uid: current_member.id, desired_date: Date.today.to_s)
  end

  private

  def set_response
      @member_response = MemberResponse.find(params[:id])
  end

  def set_rating
      @mood_rating = MoodRating.find(params[:id])
  end

  def member_response_params
    params.permit(:id, :member_id, :question_asked, :response_type, :response_date, :response, :checked_off)
  end

  def slider_picture_params
    params.permit(:id, :image_link)
  end

end