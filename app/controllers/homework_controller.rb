class HomeworkController < ApplicationController
  def index
    @videos = Video.all()
  end
end
