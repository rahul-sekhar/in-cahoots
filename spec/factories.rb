FactoryGirl.define do
  factory :admin do
    username 'admin'
    password 'some-password'
  end

  factory :project do
    title 'Test Project'

    factory :nature_site do
      title 'Nature website'
      url 'http://nature.com'
      description 'A website about the birds and the bees and the restless wind rustling through the trees.'
      content 'Many many many pictures of nature go here.'
    end

    factory :wedding_invitation do
      title 'Wedding invitation'
      description 'Invitations for a wedding.'
      content 'It was a good wedding.'
    end
  end
end