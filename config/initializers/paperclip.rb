Paperclip.interpolates('root_path') do |attachment, style|
  Rails.application.config.paperclip_root_path
end

Paperclip.interpolates('root_url') do |attachment, style|
  Rails.application.config.paperclip_root_url
end