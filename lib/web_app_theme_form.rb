class WebAppThemeForm < ActionView::Helpers::FormBuilder

  #    <div class="field">
  #      <label for="user_name">Real Name</label>
  #      <%= f.text_field :name %>
  #    </div>

  helpers = field_helpers +
    %w(date_select datetime_select time_select radio_button) +
    %w(collection_select select country_select time_zone_select) -
    %w(hidden_field label fields_for)
    
  helpers.each do |name|
    define_method(name) do |field, *args|
      options = args.last.is_a?(Hash) ? args.pop : {}
      
      options.merge!( :class => name ) unless options[:class]
      
      prefix_option = ""
      postfix_option = ""
      if options[:label]
        prefix_option += label(field, options.delete(:label) , :class => "label" )
      end

      if options[:description]
        postfix_option += @template.content_tag(:span, options[:description] , :class => "description" )
      end
      
      @template.content_tag(:div, prefix_option + super + postfix_option , :class => "group" )
    end
  end

  def submit(*args)
    @template.content_tag(:div, super(*args),:class => "submit")
  end

end
