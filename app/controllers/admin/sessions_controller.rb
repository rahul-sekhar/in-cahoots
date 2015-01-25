class Admin::SessionsController < ::Devise::SessionsController
  layout 'admin'

  def after_sign_in_path_for(admin)
    session.delete(:admin_previous_url) || admin_root_path
  end
end