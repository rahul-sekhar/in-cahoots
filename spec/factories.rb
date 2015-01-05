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

      image_file_name 'nature.jpg'
      image_file_size 1024
      image_content_type 'image/jpeg'
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

  factory :content_image do
    image_file_name 'content1.jpg'
    image_file_size 1024
    image_content_type 'image/jpeg'

    factory :content_image_2 do
      image_file_name 'content2.jpg'
    end
  end
end