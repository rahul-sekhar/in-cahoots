require 'rails_helper'

describe 'Manage images for content', type: :feature do
  before do
    login
  end

  let!(:image1){ create(:content_image) }
  let!(:image2){ create(:content_image_2) }

  specify 'View and manage images' do
    visit admin_content_images_path

    expect(page).to have_image 'content1.jpg'
    expect(page).to have_content image1.image.url(:w1200)
    expect(page).to have_image 'content2.jpg'
    expect(page).to have_content image2.image.url(:w1200)
    expect(page).to have_no_image 'image.jpg'

    attach_file 'Image', Rails.root.join('spec', 'fixtures', 'files', 'image.jpg')
    click_on 'Add'

    new_image = ContentImage.last

    expect(current_path).to eq admin_content_images_path
    expect(page).to have_image 'image.jpg'
    expect(page).to have_content new_image.image.url(:w1200)

    image2_container = find_image('content2.jpg')
    image2_container.parent.click_on 'Delete'

    expect(current_path).to eq admin_content_images_path
    expect(page).to have_no_image 'content2.jpg'
    expect(page).to have_no_content image2.image.url(:w1200)
  end
end