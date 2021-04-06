class HomeController < ApplicationController
  def index
    @displayed_questions = DisplayedQuestion.all()
  end
end
