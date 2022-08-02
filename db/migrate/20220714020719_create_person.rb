class CreatePerson < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.integer :weight
      t.string :bodycomp
      t.float :lean_mass
      t.string :goal
      t.string :activity_level
      t.string :training_load
      t.string :fc_pref
      t.float :multiplier
      t.timestamps
    end
  end
end
