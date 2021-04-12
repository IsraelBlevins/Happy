class HomeController < ApplicationController
  def index
    @displayed_questions = DisplayedQuestion.all()
    @comments = Comment.all()
    @user_responses = UserResponse.all()
    @user_response = UserResponse.new(user_response_params)
  end

  def new
    @user_response = UserResponse.new
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

  private

  def user_response_params
    params.permit(:user_id, :question_asked, :response_type, :response_date, :response)
  end

end