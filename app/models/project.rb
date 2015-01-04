class Project < ActiveRecord::Base
  validates :title, presence: true

  has_attached_file :image,
    styles: { medium: '290x' },
    url: ":root_url/projects/:id_partition/:updated_at/:style/:filename",
    path: ":root_path/projects/:id_partition/:updated_at/:style/:filename",
    use_timestamp: false,
    convert_options: { all: '-strip -quality 80  -filter Lanczos  -unsharp 0.8x1.0+0.75+0.1' }

  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }

  def next
    self.class.where('id > ?', id).first
  end

  def previous
    self.class.where('id < ?', id).last
  end
end