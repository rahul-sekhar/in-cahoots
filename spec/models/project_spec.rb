require 'rails_helper'

describe Project, type: :model do
  subject { build(:project) }

  it 'requires a title' do
    subject.title = nil
    expect(subject).to be_invalid
  end
end