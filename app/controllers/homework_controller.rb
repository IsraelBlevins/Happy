class HomeworkController < ApplicationController
  def index
    @videos = Video.all()
    @displayed_questions = DisplayedQuestion.all()
  end

  def newHW
    @displayed_question = DisplayedQuestion.new
  end


  def createHW
    @displayed_question = DisplayedQuestion.new(displayed_question_params)

    respond_to do |format|
      if @displayed_question.save
        format.html { redirect_to homework_index_path(uid: current_user.id, desired_date: Date.today.to_s), notice: 'New Homework was successfully saved.' }
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


end
