class DataController < ApplicationController
  def index
    @mood_ratings_morning = MoodRating.where(user_id: current_user.id, morning: true)
    @mood_ratings_morning_pastweek = MoodRating.where(user_id: current_user.id, morning: true, created_at: 1.week.ago..Time.now)
    @mood_ratings_morning_pastmonth = MoodRating.where(user_id: current_user.id, morning: true, created_at: 1.month.ago..Time.now)

    @mood_ratings_evening = MoodRating.where(user_id: current_user.id, morning: false)
    @mood_ratings_evening_pastweek = MoodRating.where(user_id: current_user.id, morning: false, created_at: 1.week.ago..Time.now)
    @mood_ratings_evening_pastmonth = MoodRating.where(user_id: current_user.id, morning: false, created_at: 1.month.ago..Time.now)
  end
  Groupdate.time_zone = "Central Time (US & Canada)"
end
