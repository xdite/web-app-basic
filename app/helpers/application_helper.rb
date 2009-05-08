# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def yield_or_default(message, default_message = "")
     message.nil? ? default_message : message
   end
end
