module SessionHelper

  def please_select
    ['Please select', '']
  end

  def yes_no_radio_buttons(name = "")
    label_tag("#{name}_true", "Yes") + "\n" + 
    radio_button_tag(name, true) +  "\n" +
    label_tag("#{name}_false", "No") + "\n" +
    radio_button_tag(name, false)
  end
  
  def info_icon(info)
    image_tag('icon-i.gif')
  end
  
  def nav_link(text, action_name)    
    link_to(text, action_name, :class => ("current" if controller.action_name == action_name))
  end
  

end


class ActionView::Helpers::FormBuilder
   include ActionView::Helpers::RawOutputHelper
   include ActionView::Helpers::NumberHelper
   
  def currency_field(name, options = {})
    raw " &pound; " + text_field(name, options)
  end
 
  def frequency_select(name)
    select "#{name}_frequency", [['Weekly','weekly'],['Fortnightly','fortnightly'],['4-weekly','four_weekly'],['Montly','monthly'],['Quarterly','quarterly'],['Annually','annually']]
  end 
  
  def owner_select(name)
    select 
  end
  
  def depression_dropdown(name)
    select name, [['Please select', ''],['Not at all',1],['Several days',2],['More than half the days',3],['Nearly every day',4]]
  end

  def yes_no_radio_buttons(name)
    label("#{name}_true", "Yes") + "\n" +
    radio_button(name, true) + "\n" + 
    label("#{name}_false", "No") + "\n" +
    radio_button(name, false)
  end

end
