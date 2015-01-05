module Capybara
  module Node
    class Element
      def parent
        find(:xpath, '..')
      end
    end
  end
end

module FeatureHelpers
  def login
    create(:admin)
    visit admin_root_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'some-password'
    click_on 'Log in'
  end
end

module CapybaraImageHelpers
  def has_image?(filename)
    has_css? 'img[src*="' + filename + '"]'
  end

  def has_no_image?(filename)
    has_no_css? 'img[src*="' + filename + '"]'
  end

  def find_image(filename)
    find 'img[src*="' + filename + '"]'
  end
end

module Capybara
  module Node
    class Element
      include CapybaraImageHelpers
    end
  end

  class Session
    include CapybaraImageHelpers
  end
end

module FeatureHelpers
  include CapybaraImageHelpers
end