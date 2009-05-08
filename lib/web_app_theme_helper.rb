module WebAppThemeHelper

  def handicraft_form_for(name, *args, &block)
    options = args.last.is_a?(Hash) ? args.pop : {}
    options = options.merge(:builder => WebAppThemeForm)
    args = (args << options)
    form_for(name, *args, &block)
  end
  
  class Menu < Array
    attr_accessor :css_id
    attr_accessor :css_class
    attr_accessor :title

    def initialize(options={})
      @css_id = options[:id]
      @css_class = options[:class]
    end

  end
  
  def render_menu(menu, options={})
    menu_id = menu.css_id ? menu.css_id : nil
    menu_class = "menu" + (menu.css_class ? " #{menu.css_class}" : "")
    
    ul = TagNode.new('ul', :id => menu_id, :class => menu_class )
    
    menu.each_with_index do |item, i|       
      item_class = "first" if i == 0
      item_class = "last" if i == (menu.length - 1)

      if item.class == Array 
        if url_for( :controller => controller.controller_name, :action => controller.action_name, :only_path => true) == item[1] || ( @highlight && @highlight.include?(item[1]) )
        item_class = "#{item_class} active"
        end
      end
      
      ul << li = TagNode.new('li', :class => item_class)
      
      if item.class == Array
        li << link_to(item[0], item[1], item[2])
      elsif item.class == String
        li << "<p>#{item}</p>"
      elsif item.class == Menu
        li << link_to(item.title[0], h(item.title[1]), item.title[2])
        li << render_menu(item)
      end
    end
    
    return ul.to_s
  end

  # Composite pattern
  class TagNode
    include ActionView::Helpers::TagHelper
    
    def initialize(name, options = {})
      @name = name.to_s
      @attributes = options
      @children = []
    end
    
    def to_s
      value = @children.each { |c| c.to_s }.join
      content_tag(@name, value.to_s, @attributes)
    end
    
    def <<(tag_node)
      @children << tag_node
    end
  end
  
end
