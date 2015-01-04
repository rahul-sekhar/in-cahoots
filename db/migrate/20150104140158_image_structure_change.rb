class ImageStructureChange < ActiveRecord::Migration
  def up
    change_table :projects do |t|
      t.remove :project_image_id
      t.attachment :image
    end

    drop_table :project_images
  end

  def down
    create_table :project_images do |t|
      t.attachment :image
      t.timestamps
    end

    change_table :projects do |t|
      t.integer :project_image_id
    end
  end
end
