class GroupController < ApplicationController

  helper_method :prior_weekday

  def index
    @group_members = Member.where(group_id: current_member.group_id)
    @member_responses = MemberResponse.all()
  end

  def prior_weekday(date, weekday)
    # if the date is the same day as the one you put, return that day (not the week before)
    if date.strftime("%A") == weekday
      Date.today
    else
      weekday_index = Date::DAYNAMES.reverse.index(weekday)
      days_before = (date.wday + weekday_index) % 7 + 1
      date.to_date - days_before
    end
  end

end
