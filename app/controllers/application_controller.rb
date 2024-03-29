class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token, if: :json_request?

protected
  def json_request?
    request.format.json?
  end

  def set_cacheable
    expires_in(5.minutes, public: true)
  end
end
