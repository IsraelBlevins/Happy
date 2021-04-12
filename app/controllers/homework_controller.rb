class HomeworkController < ApplicationController
  def index
    @videos = Video.all()
    @displayed_questions = DisplayedQuestion.all()
  end
end
