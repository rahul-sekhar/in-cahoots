require 'rails_helper'

describe ContentImage, type: :model do
  subject { build(:content_image) }

  describe 'image' do
    it 'is required' do
      subject.image = nil
      expect(subject).to be_invalid
    end

    it 'cannot be a non-image file' do
      subject.image_content_type = 'application/pdf'
      expect(subject).to be_invalid
    end
  end
end