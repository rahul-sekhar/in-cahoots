class ProjectPriorities < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.integer :weight, default: 0, null: false
    end
  end
end
