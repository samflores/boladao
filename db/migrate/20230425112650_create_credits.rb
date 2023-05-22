class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits do |t|
      t.integer :amount, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
