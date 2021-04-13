class HomeController < ApplicationController
  def index
    @displayed_questions = DisplayedQuestion.all()
    @comments = Comment.all()
    @user_responses = UserResponse.all()
    @user_response = UserResponse.new(user_response_params)
    @displayed_questions = DisplayedQuestion.all()
  end

  def newQuestion
    @displayed_question = DisplayedQuestion.new
  end


  def createQuestion
    @displayed_question = DisplayedQuestion.new(displayed_question_params)

    respond_to do |format|
      if @displayed_question.save
        format.html { redirect_to home_index_path(@user), notice: 'New Question was successfully saved.' }
        format.json { render :show, status: :created, location: @displayed_questions }
      else
        format.html { render :new }
        format.json { render json: @displayed_question.errors, status: :unprocessable_entity }
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
        format.html { redirect_to home_index_path(@user), notice: 'Mood successfully saved.' }
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
        format.html { redirect_to home_index_path(@user), notice: 'Response was successfully saved.' }
        format.json { render :show, status: :created, location: @user_responses }
      else
        format.html { render :new }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_response.update(user_response_params)
        format.html { redirect_to home_index_path(@user), notice: "Response was successfully updated." }
        format.json { render :show, status: :ok, location: @user_responses }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_response
      @user_response = UserResponse.find(params[:response])
  end

  def user_response_params
    params.permit(:user_id, :question_asked, :response_type, :response_date, :response)
  end


end