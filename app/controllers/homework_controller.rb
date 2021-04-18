class HomeworkController < ApplicationController
  before_action :set_displayed_question, only: %i[destroy]

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


  def createVideo
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to homework_index_path(uid: current_user.id, desired_date: Date.today.to_s), notice: 'New Video was successfully saved.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /displayed_question/1 or /displayed_question/1.json
  def destroy
    @displayed_question.destroy
    redirect_to homework_index_path(uid: current_user.id, desired_date: Date.today.to_s)
  end


    def set_displayed_question
      @displayed_question = DisplayedQuestion.find(params[:id])
    end

    def set_video
      @video = Video.find(params[:id])
    end

    def displayed_question_params
      params.permit( :question, :question_type)
    end

    def video_params
      params.permit( :video_link, :uploader_comment)
    end
end
