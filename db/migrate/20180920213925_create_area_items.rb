class CreateAreaItems < ActiveRecord::Migration[5.2]
  def change
    create_table :area_items do |t|
      t.references :area, foreign_key: true
      t.references :item, foreign_key: true
      t.decimal :status, precision: 3, scale: 2

      t.timestamps
    end
  end
end
