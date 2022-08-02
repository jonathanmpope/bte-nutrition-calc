class CreatePhases < ActiveRecord::Migration[5.2]
  def change
    create_table :phases do |t|
      t.float :protein_grams
      t.float :protein_cals
      t.float :protein_percent
      t.float :carb_grams
      t.float :carb_cals
      t.float :carb_percent
      t.float :fat_grams
      t.float :fat_cals
      t.float :fat_percent
      t.string :name
      t.float :kcal
      
      t.timestamps 
    end
  end
end
