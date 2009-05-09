class WelcomeController < ApplicationController
  def index
  end
  
  def table
    @users = User.all.paginate(:page => params[:page], :per_page=> 1)
  end
  def form_for
    @user = User.new
  end
end
