class Project < ActiveRecord::Base
  validates :title, presence: true

  has_attached_file :image,
    styles: { medium: '290x' }

  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }

  def next
    self.class.where('id > ?', id).first
  end

  def previous
    self.class.where('id < ?', id).last
  end
end