class CreateContentItems < ActiveRecord::Migration[5.2]
  def change
    create_table :content_items do |t|
      t.text :title
      t.boolean :trashed, default: false
      t.integer :parent_id
      t.text :type

      t.timestamps
    end
  end
end
