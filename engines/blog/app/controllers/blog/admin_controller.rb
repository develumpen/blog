module Blog
  class AdminController < ApplicationController
    before_action :require_authentication
  end
end
