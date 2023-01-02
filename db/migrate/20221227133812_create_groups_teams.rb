class CreateGroupsTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_teams do |t|
      t.references :team, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
    end
  end
end
