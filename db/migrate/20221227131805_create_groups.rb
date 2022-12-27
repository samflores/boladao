class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
