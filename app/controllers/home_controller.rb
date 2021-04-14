class HomeController < ApplicationController
  def index
    @displayed_questions = DisplayedQuestion.all()
    @comments = Comment.all()
    #@referenced_user = User.find(params[:uid]) unless logged_in?
    @user_responses = UserResponse.all()
    @user_response = UserResponse.new(user_response_params)
    @displayed_questions = DisplayedQuestion.all()

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
        format.html { redirect_to home_index_path(uid: current_user.id), notice: 'New Question was successfully saved.' }
        format.json { render :show, status: :created, location: @displayed_questions }
      else
        format.html { render :new }
        format.json { render json: @displayed_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def displayed_question_params
    params.permit(:question, :question_type)
  end


  def new
    @user_response = UserResponse.new
  end
  #POST /home or /home.json
  def create
    @user_response = UserResponse.new(user_response_params)

    respond_to do |format|
      if @user_response.save
        format.html { redirect_to home_index_path(uid: current_user.id), notice: 'Response was successfully saved.' }
        format.json { render :show, status: :created, location: @user_responses }
      else
        format.html { render :new }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_response_params
    params.permit(:user_id, :question_asked, :response_type, :response_date, :response)
  end


end