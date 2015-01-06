class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :store_location_and_authenticate

  layout 'admin/application'

  def home
  end

  def blurb
    Settings.home_page_blurb = params[:blurb]
    redirect_to admin_root_url
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
