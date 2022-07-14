class AddPersonsToPhase1s < ActiveRecord::Migration[5.2]
  def change
    add_reference :phase1s, :person, foreign_key: true
  end
end
