class Admin::DashboardController < ApplicationController
  ActionController::Base.http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"]
  def show
  end
end
