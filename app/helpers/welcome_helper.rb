module WelcomeHelper
  def welcome_navigation_menu
    menu = WebAppThemeHelper::Menu.new
    menu << ["Text", url_for(:controller => "welcome", :action => "text")]
    menu << ["Table", url_for(:controller => "welcome", :action => "table") ]
    menu << ["Forms", url_for(:controller => "welcome", :action => "form") ]
    menu << ["Messages", url_for(:controller => "welcome", :action => "messages") ]
    menu << ["2 Columns Forms", url_for(:controller => "welcome", :action => "forms2") ]
    menu << ["List", url_for(:controller => "welcome", :action => "lists")]
  end
end
