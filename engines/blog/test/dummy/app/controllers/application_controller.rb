class ApplicationController < ActionController::Base
  def authenticated?
    Current.user != nil
  end
  helper_method :authenticated?
end
