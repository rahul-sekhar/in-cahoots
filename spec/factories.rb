FactoryGirl.define do
  factory :admin do
    username 'admin'
    password 'some-password'
  end

  factory :project do
    title 'Test Project'

    factory :nature_site do
      title 'Nature website'
      description 'A website about the birds and the bees and the restless wind rustling through the trees.'
      url 'http://nature.com'
      content 'Many many many pictures of nature go here.'
    end

    factory :wedding_invitation do
      title 'Wedding invitation'
      description 'Invitations for a wedding.'
      content 'It was a good wedding.'
    end

    factory :book_site do
      title 'Books'
      description 'A book store.'
    end
  end

  factory :project_image do
    image_file_name { 'test.jpg' }
    image_content_type { 'image/jpeg' }
    image_file_size { 1024 }
  end
end