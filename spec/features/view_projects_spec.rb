require 'rails_helper'

describe 'View projects', type: :feature do
  let!(:nature_site){ create(:nature_site) }
  let!(:wedding_invitation){ create(:wedding_invitation) }

  specify 'all projects should show on the home page' do
    visit root_path

    expect(page).to have_content 'Nature website'
    expect(page).to have_content 'A website about the birds and the bees and the restless wind rustling through the trees.'

    expect(page).to have_content 'Wedding invitation'
    expect(page).to have_content 'Invitations for a wedding.'
  end
end