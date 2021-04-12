class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #session[:user_id] = user.id
      log_in user
      redirect_to home_index_path(user)
      #redirect_to home_index_path(uid: user.id)
    else
      flash.now[:danger] = 'Bad email/password combination. Try again.'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to sessions_new_url
  end
end
