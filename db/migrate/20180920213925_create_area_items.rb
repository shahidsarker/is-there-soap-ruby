class CreateAreaItems < ActiveRecord::Migration[5.2]
  def change
    create_table :area_items do |t|

      t.timestamps
    end
  end
end
