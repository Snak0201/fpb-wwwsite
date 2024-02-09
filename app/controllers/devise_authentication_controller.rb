class DeviseAuthenticationController < ApplicationController
  before_action :authenticate_admin!
end
