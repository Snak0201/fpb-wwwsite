class DeviseAuthenticationController < ApplicationController
  include Pundit::Authorization
  before_action :authenticate_admin!

  def pundit_user
    current_admin
  end
end
