class ContentImages < ActiveRecord::Migration
  def change
    create_table :content_images do |t|
      t.attachment :image

      t.timestamps
    end
  end
end
