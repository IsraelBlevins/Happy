class HomeController < ApplicationController
  def index
    @displayed_questions = DisplayedQuestion.all()
    @comments = Comment.all()
    #@referenced_user = User.find(params[:uid]) unless logged_in?
  end
end
