require 'rails_helper'

describe 'Admin login', type: :feature do
  let!(:admin) { create(:admin) }

  before do
    visit admin_root_path
    expect(current_path).to eq new_admin_session_path
  end

  specify 'with the wrong password' do
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'wrong-password'
    click_on 'Log in'

    expect(page).to have_content 'Invalid username or password'
    expect(current_path).to eq new_admin_session_path
  end


  specify 'with the correct password' do
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'some-password'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq admin_root_path

    visit admin_root_path
    expect(current_path).to eq admin_root_path
  end

  specify 'logout' do
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'some-password'
    click_on 'Log in'
    expect(current_path).to eq admin_root_path

    click_on 'Logout'
    expect(current_path).to eq root_path

    visit admin_root_path
    expect(current_path).to eq new_admin_session_path
  end

  specify 'visiting the projects page' do
    visit admin_projects_path
    expect(current_path).to eq new_admin_session_path

    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'some-password'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq admin_projects_path
  end
end
