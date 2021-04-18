class HomeController < ApplicationController
  before_action :set_response, only: %i[update]
  before_action :set_rating, only: %i[updateMoodRating]
  before_action :set_displayed_question, only: %i[destroy]
  
  def index
    @displayed_questions = DisplayedQuestion.all()
    @comments = Comment.all()
    @user_responses = UserResponse.all()
    @displayed_questions = DisplayedQuestion.all()
    @mood_ratings = MoodRating.all()
    @slider_pictures = SliderPicture.all()

    if @slider_pictures.first.nil?
      @most_recent_slider = ''
    else
      @most_recent_slider = SliderPicture.find(@slider_pictures.maximum(:id)).image_link 
    end
    
    if @desired_date != Date.today.to_s
      @desired_date = params[:desired_date]
    end

    if current_user.id == :uid
      @referenced_user = current_user
    else
      @referenced_user = User.find(params[:uid])
    end
  end

  def newQuestion
    @displayed_question = DisplayedQuestion.new
  end


  def createQuestion
    @displayed_question = DisplayedQuestion.new(displayed_question_params)

    respond_to do |format|
      if @displayed_question.save
        format.html { redirect_to home_index_path(uid: current_user.id, desired_date: Date.today.to_s), notice: 'New Question was successfully saved.' }
        format.json { render :show, status: :created, location: @displayed_questions }
      else
        format.html { render :new }
        format.json { render json: @displayed_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @displayed_question.destroy
    redirect_to home_index_path(uid: current_user.id, desired_date: Date.today.to_s)
  end

  def set_displayed_question
    @displayed_question = DisplayedQuestion.find(params[:id])
  end

  def createSliderPicture
    @slider_picture = SliderPicture.new(slider_picture_params)

    respond_to do |format|
      if @slider_picture.save
        format.html { redirect_to home_index_path(uid: current_user.id, desired_date: Date.today.to_s), notice: 'New Picture was successfully saved.' }
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
        format.html { redirect_to home_index_path(uid: current_user.id, desired_date: Date.today.to_s), notice: 'Mood successfully saved.' }
        format.json { render :show, status: :created, location: @mood_rating }
      else
        format.html { render :new }
        format.json { render json: @mood_rating.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def mood_rating_params
      params.permit(:user_id, :rating, :morning)
  end

  def displayed_question_params
    params.permit(:question, :question_type)
  end


  def new
    @user_response = UserResponse.new
  end

  def edit
  end
  #POST /home or /home.json
  def create
    @user_response = UserResponse.new(user_response_params)

    respond_to do |format|
      if @user_response.save
        format.html { redirect_to home_index_path(uid: current_user.id, desired_date: Date.today.to_s), notice: 'Response was successfully saved.' }
        format.json { render :show, status: :created, location: @user_responses }
      else
        format.html { render :new }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_response.update_attributes(user_response_params)
        format.html { redirect_to home_index_path(uid: current_user.id, desired_date: Date.today.to_s), notice: "Response was successfully updated." }
        format.json { render :show, status: :ok, location: @user_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_response
      @user_response = UserResponse.find(params[:id])
  end
  def set_rating
      @mood_rating = MoodRating.find(params[:id])
  end

  def user_response_params
    params.permit(:id, :user_id, :question_asked, :response_type, :response_date, :response, :checked_off)
  end

  def slider_picture_params
    params.permit(:id, :image_link)
  end

end