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

  specify 'each project should be viewable on its own page' do
    visit root_path

    click_on 'Nature website'

    expect(current_path).to eq project_path(nature_site)

    expect(page).to have_content 'Nature website'
    expect(page).to have_content 'A website about the birds and the bees and the restless wind rustling through the trees.'
    expect(page).to have_content 'Many many many pictures of nature go here.'

    site_link = find_link('View')
    expect(site_link['href']).to eq 'http://nature.com'
  end
end