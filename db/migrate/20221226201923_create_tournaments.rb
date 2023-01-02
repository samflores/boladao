class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
