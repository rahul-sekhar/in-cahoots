class ContentImage < ActiveRecord::Base
  has_attached_file :image,
    styles: { w1200: '1200x', thumb: '300x' },
    url: ":root_url/images/:id_partition/:style/:filename",
    path: ":root_path/images/:id_partition/:style/:filename",
    use_timestamp: false,
    convert_options: { all: '-strip -quality 80  -filter Lanczos  -unsharp 0.8x1.0+0.75+0.1' }

  validates :image,
    attachment_presence: true,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ }
end