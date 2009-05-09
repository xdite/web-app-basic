# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper WebAppThemeHelper
  include AuthenticatedSystem
  
  before_filter :set_locale
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def set_timezone
    Time.zone = browser_timezone || "Asia/Taipei"
    Time.zone = logged_in? ? current_user.time_zone : browser_timezone
  end

  def set_locale
    # update session if passed
    session[:locale] = params[:locale] if params[:locale]

    # set locale based on session or default
    I18n.locale = session[:locale] || I18n.default_locale

  end
end
