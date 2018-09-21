class CreateSpaceUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :space_users do |t|

      t.timestamps
    end
  end
end
