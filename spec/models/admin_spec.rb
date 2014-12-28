require 'rails_helper'

describe Admin, :type => :model do
  subject { build(:admin) }

  describe 'username' do
    it 'is required' do
      subject.username = nil
      expect(subject).to be_invalid
    end
  end
end
