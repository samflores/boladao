class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.datetime :starts_at
      t.string :location
      t.integer :phase
      t.references :tournament, null: false, foreign_key: true
      t.references :team_a, null: false, foreign_key: { to_table: :teams }
      t.references :team_b, null: false, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
