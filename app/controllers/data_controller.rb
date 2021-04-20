class DataController < ApplicationController
  def index
    @mood_ratings_morning = MoodRating.where(member_id: current_member.id, morning: true)
    @mood_ratings_morning_pastweek = MoodRating.where(member_id: current_member.id, morning: true, created_at: 8.days.ago..Time.now)
    @mood_ratings_morning_pastmonth = MoodRating.where(member_id: current_member.id, morning: true, created_at: 31.days.ago..Time.now)

    @mood_ratings_evening = MoodRating.where(member_id: current_member.id, morning: false)
    @mood_ratings_evening_pastweek = MoodRating.where(member_id: current_member.id, morning: false, created_at: 8.days.ago..Time.now)
    @mood_ratings_evening_pastmonth = MoodRating.where(member_id: current_member.id, morning: false, created_at: 31.days.ago..Time.now)
  end
  Groupdate.time_zone = "Central Time (US & Canada)"
end
