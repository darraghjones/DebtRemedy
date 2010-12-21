class ApplicationController < ActionController::Base
  protect_from_forgery
 
  def current_client
    Client.find(session[:client_id]) unless session[:client_id].nil?
  end

  def current_client=(client)
    session[:client_id] = client.id    
  end
  
   
end
