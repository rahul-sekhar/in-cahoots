class ProjectImage < ActiveRecord::Base
  has_attached_file :image,
    styles: { medium: '290x' }

  validates :image,
    attachment_presence: true,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }
end