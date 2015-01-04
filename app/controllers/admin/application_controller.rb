class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :store_location_and_authenticate

  layout 'admin/application'

  def home
  end

  private

  def store_location
    if !request.xhr? # don't store ajax calls
      session[:admin_previous_url] = request.fullpath
    end
  end

  def store_location_and_authenticate
    store_location unless admin_signed_in?
    authenticate_admin!
  end
end
