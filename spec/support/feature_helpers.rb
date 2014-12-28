module FeatureHelpers
  def login
    create(:admin)
    visit admin_root_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'some-password'
    click_on 'Log in'
  end
end