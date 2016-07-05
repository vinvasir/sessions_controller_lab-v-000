class SessionsController < ApplicationController
  skip_before_action :logged_in?, only: [:new, :create]
  
  def new
  end
  
  def create
    if params[:name].nil? || params[:name].empty?
      redirect_to sessions_new_path
    else
      session[:name] = params[:name]
      redirect_to root_path
    end
  end
  
  def destroy
    session.clear
    redirect_to login_path
  end
end