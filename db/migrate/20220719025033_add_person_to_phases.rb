class AddPersonToPhases < ActiveRecord::Migration[5.2]
  def change
    add_reference :phases, :person, foreign_key: true
  end
end
