class HomeController < ApplicationController
  def index
    @displayed_questions = DisplayedQuestion.all()
    @comments = Comment.all()
    @user_responses = UserResponse.all()
  end

  def new
    @user_response = UserResponse.new
  end

  def create
    @user_response = UserResponse.new(user_response_params)

    respond_to do |format|
      if @user_response.save
        format.html { redirect_to @user_response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @user_response }
      else
        format.html { render :new }
        format.json { render json: @user_response.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  def respond
      user_id = params[:user_id]
      question_asked = params[:question_asked]
      response_type = params[:response_type]
      response_date = params[:response_date]
      response = params[:response]
      user_response = UserResponse.create(user_id: user_id, question_asked: question_asked, response_type: response_type, response_date: response_date, response: response)
  end
