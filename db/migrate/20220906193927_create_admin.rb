class CreateAdmin < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :status, default: 0

      t.timestamps
    end
  end
end
