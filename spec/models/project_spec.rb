require 'rails_helper'

describe Project, type: :model do
  subject { build(:project) }

  it 'requires a title' do
    subject.title = nil
    expect(subject).to be_invalid
  end

  describe 'image' do
    before do
      subject.image_file_name = 'some-file'
      subject.image_file_size = 1024
      subject.image_content_type = 'image/jpeg'
    end

    it 'can be an image' do
      expect(subject).to be_valid
    end

    it 'cannot be a non-image file' do
      subject.image_content_type = 'application/pdf'
      expect(subject).to be_invalid
    end
  end

  describe 'previous and next' do
    before do
      @proj1 = create(:project)
      @proj2 = create(:project)
    end

    describe 'for a new record' do
      specify 'previous is empty' do
        expect(subject.previous).to be_nil
      end

      specify 'next is empty' do
        expect(subject.next).to be_nil
      end
    end

    describe 'for a saved record' do
      before do
        subject.save!
        @proj3 = create(:project)
        @proj4 = create(:project)
      end

      specify 'previous returns the previous project' do
        expect(subject.previous).to eq @proj2
      end

      specify 'next returns the next project' do
        expect(subject.next).to eq @proj3
      end
    end
  end
end