class ApplicationController < ActionController::Base
  before_action :login_if_not

  def current_user
    return if session[:user_id].blank?

    @_current_user ||= User.find(session[:user_id])
  end

  def login_if_not
    return unless session[:user_id].blank?

    redirect_to sessions_path
  end
end
