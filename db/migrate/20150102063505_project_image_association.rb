class ProjectImageAssociation < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.integer :project_image_id
    end
  end
end
