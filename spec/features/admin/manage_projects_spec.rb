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

  specify 'Create a project' do
    visit admin_projects_path
    click_on 'New project'

    expect(current_path).to eq new_admin_project_path

    fill_in 'Title', with: 'Fresh project'
    fill_in 'Description', with: 'Super fresh'
    fill_in 'URL', with: 'http://fresh-fresh.com'
    fill_in 'Content', with: 'Freshness is hard to describe'

    click_on 'Create'

    expect(current_path).to eq admin_projects_path
    expect(page).to have_content 'Fresh project'

    project = Project.find_by_title('Fresh project')
    expect(project.description).to eq 'Super fresh'
    expect(project.url).to eq 'http://fresh-fresh.com'
    expect(project.content).to eq 'Freshness is hard to describe'
  end

  specify 'Edit a project' do
    visit admin_project_path(nature_site)

    expect(page).to have_field 'Title', with: 'Nature website'
    expect(page).to have_field 'Description', with: 'A website about the birds and the bees and the restless wind rustling through the trees.'
    expect(page).to have_field 'URL', with: 'http://nature.com'
    expect(page).to have_field 'Content', with: 'Many many many pictures of nature go here.'

    fill_in 'Title', with: 'Forest website'
    fill_in 'Description', with: 'A website about just forests'
    fill_in 'URL', with: 'http://forests.com'
    fill_in 'Content', with: 'Forests, forests, forests!'

    click_on 'Save'

    expect(current_path).to eq admin_projects_path
    expect(page).to have_no_content 'Nature website'
    expect(page).to have_content 'Forest website'

    nature_site.reload
    expect(nature_site.title).to eq 'Forest website'
    expect(nature_site.description).to eq 'A website about just forests'
    expect(nature_site.url).to eq 'http://forests.com'
    expect(nature_site.content).to eq 'Forests, forests, forests!'
  end
end