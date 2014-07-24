class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  after_filter :discard_flash_if_ajax

  def registrations_accepted
    if User.count != 0
      redirect_to root_path, alert: "Accounts cannot be created at this time."
    end
  end

  private
  
  def discard_flash_if_ajax
    flash.discard if request.xhr?
  end
end
