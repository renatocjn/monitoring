class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #IMPORTANT! THESE TWO LINES MUST COME AFTER protect_from_forgery!
  #skip_before_filter :verify_authenticity_token, :only => :webhook
  #include TeleNotify::Controller
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login', alert: "Por favor, entre com seu usuário" unless session.include? :user_authorized
  end
  
  def gen_error_string record
    record.errors.collect {|err, msg| msg}.join("\n")
  end
end
