class CreateAreaItems < ActiveRecord::Migration[5.2]
  def change
    create_table :area_items do |t|
      t.references :area, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
