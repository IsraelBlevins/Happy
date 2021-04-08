class GroupController < ApplicationController
  def index
    @group_members = User.where(group_id: current_user.group_id)
  end

end
