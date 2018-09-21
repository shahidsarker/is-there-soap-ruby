class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.text :description
      t.integer :type
      t.references :space, foreign_key: true

      t.timestamps
    end
  end
end
