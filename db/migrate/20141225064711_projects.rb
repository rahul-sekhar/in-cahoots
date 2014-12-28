class Projects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :url
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
