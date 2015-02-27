class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  rescue_from "ApiError", with: :throw_error

  def current_user
    @current ||= User.current_user
  end

  private

  def throw_error(exception)
    respond_to do |f|
      f.html { redirect_to({action: :index}, flash: {error: exception.message})}
      f.js { render text: exception.message, status: 400 }
    end
  end
end
