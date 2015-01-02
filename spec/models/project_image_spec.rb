require 'rails_helper'

describe ProjectImage, type: :model do
  subject { build(:project_image) }

  describe 'the image' do
    it 'is required' do
      subject.image = nil
      expect(subject).to be_invalid
    end

    it 'must be an image' do
      subject.image_content_type = 'application/pdf'
      expect(subject).to be_invalid
    end
  end
end