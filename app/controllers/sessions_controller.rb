class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(email: params[:session][:email])
    if member && member.authenticate(params[:session][:password])
      log_in member
      redirect_to home_index_path(uid: member.id, desired_date: Date.today.to_s)
    else
      flash.now[:danger] = 'Bad email/password combination. Try again.'
      render 'new'
    end
  end

  def destroy
    session.delete(:member_id)
    @current_member = nil
    redirect_to sessions_new_url
  end
end
