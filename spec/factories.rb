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
      image File.new(Rails.root.join('spec', 'fixtures', 'files', 'image-1.jpg'))
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
end