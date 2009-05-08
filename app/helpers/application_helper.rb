# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def yield_or_default(message, default_message = "")
     message.nil? ? default_message : message
  end

  def main_navigation_menu
    menu = WebAppThemeHelper::Menu.new
    menu << ["Home", home_path]
    menu << ["Users", users_path ]
    if logged_in?
    end
    return menu
  end
  
  def secondary_navigation_menu
    if respond_to? "#{controller.controller_path.gsub('/','_')}_#{controller.action_name}_navigation_menu"
      return send("#{controller.controller_path.gsub('/','_')}_#{controller.action_name}_navigation_menu")
    elsif respond_to? "#{controller.controller_path.gsub('/','_')}_navigation_menu"
      return send("#{controller.controller_path.gsub('/','_')}_navigation_menu")
    else
      return WebAppThemeHelper::Menu.new
    end
  end
  
  def render_page_title
    title = @page_title ? " | #{@page_title}" : ''
    "<title> Web App Theme #{title}</title>"
  end
  
end
