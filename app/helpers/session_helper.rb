module SessionHelper

  def current_client
    session[:client] || Client.first
  end

  def current_client=(client)
    session[:client] = client
  end

  def please_select
    ['Please select', nil]
  end

  def yes_no_radio_buttons(name = "")
    label_tag("#{name}_true", "Yes") + "\n" + 
    radio_button_tag(name, true) +  "\n" +
    label_tag("#{name}_false", "No") + "\n" +
    radio_button_tag(name, false)
  end

  end


class ActionView::Helpers::FormBuilder
 
  def frequency_select(name)
    select "#{name}_frequency", [['Weekly','weekly'],['Fortnightly','fortnightly'],['4-weekly','four_weekly'],['Montly','monthly'],['Quarterly','quarterly'],['Annually','annually']]
  end 

  def yes_no_radio_buttons(name)
    label("#{name}_true", "Yes") + "\n" +
    radio_button(name, true) + "\n" + 
    label("#{name}_false", "No") + "\n" +
    radio_button(name, false)
  end

end
