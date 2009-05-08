class WelcomeController < ApplicationController
  def index
  end
  
  def text
  end
  
  def form_for
    @user = User.new
  end
end
