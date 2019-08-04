class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.string :title
      t.boolean :trashed
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
