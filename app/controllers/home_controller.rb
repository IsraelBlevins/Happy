class HomeController < ApplicationController
  def index
    @displayed_questions = DisplayedQuestion.all()
    @comments = Comment.all()
    @user_responses = UserResponse.all()
  end

  def new
    @user_response = UserResponse.new
  end

  def create_response
    @user_response = UserResponse.new(user_response_params)

    respond_to do |format|
      if @user_response.save
        format.html {redirect_to @user_response, notice: 'Response has been saved.'}
        format.json {render :show, status: :created, location: @user_response}
      else
        format.html {render :new}
        format.json {render json: @user_response.errors, status: :unprocessable_entity}
      end
    end
  end

end
