require 'rails_helper'

describe 'Manage projects', type: :feature do
  before do
    login
  end

  let!(:nature_site){ create(:nature_site) }
  let!(:wedding_invitation){ create(:wedding_invitation) }

  specify 'View projects' do
    click_on 'Projects'
    expect(current_path).to eq admin_projects_path

    expect(page).to have_content 'Nature website'
    expect(page).to have_content 'Wedding invitation'

    click_on 'Wedding invitation'
    expect(current_path).to eq admin_project_path(wedding_invitation)
  end
end