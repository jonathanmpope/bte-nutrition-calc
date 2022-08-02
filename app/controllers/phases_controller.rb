class PhasesController < ApplicationController 
     def show
        @person = Person.find(params[:person_id])
        if @person.goal == 'performance' 
            @phase1 = @person.phases.new(name: @person.goal)
            phase1_macro_hash = @phase1.total_kcal_calc(@person)
            @phase1.update(kcal: phase1_macro_hash[:total_kcal], protein_grams: phase1_macro_hash[:protein_grams], protein_cals: phase1_macro_hash[:protein_cals], protein_percent: phase1_macro_hash[:protein_percent], carb_grams: phase1_macro_hash[:carb_grams], carb_cals: phase1_macro_hash[:carb_cals], carb_percent: phase1_macro_hash[:carb_percent], fat_grams: phase1_macro_hash[:fat_grams], fat_cals: phase1_macro_hash[:fat_cals], fat_percent: phase1_macro_hash[:fat_percent])
            phase2_macro_hash = @phase1.phase2_calcs(@person)
            @phase2 = @person.phases.create!(name: 'keto', kcal: phase2_macro_hash[:kcal], protein_grams: phase2_macro_hash[:protein_grams], protein_cals: phase2_macro_hash[:protein_cals], protein_percent: phase2_macro_hash[:protein_percent], carb_grams: phase2_macro_hash[:carb_grams], carb_cals: phase2_macro_hash[:carb_cals], carb_percent: phase2_macro_hash[:carb_percent], fat_grams: phase2_macro_hash[:fat_grams], fat_cals: phase2_macro_hash[:fat_cals], fat_percent: phase2_macro_hash[:fat_percent])
            phase3_macro_hash_fast = @phase2.phase3_calcs_fasting(@person)
            phase3_macro_hash_nofast = @phase2.phase3_calcs_nonfasting(@person)
            @phase3a = @person.phases.create!(name: 'IF - fasting', kcal: phase3_macro_hash_fast[:kcal], protein_grams: phase3_macro_hash_fast[:protein_grams], protein_cals: phase3_macro_hash_fast[:protein_cals], protein_percent: phase3_macro_hash_fast[:protein_percent], carb_grams: phase3_macro_hash_fast[:carb_grams], carb_cals: phase3_macro_hash_fast[:carb_cals], carb_percent: phase3_macro_hash_fast[:carb_percent], fat_grams: phase3_macro_hash_fast[:fat_grams], fat_cals: phase3_macro_hash_fast[:fat_cals], fat_percent: phase3_macro_hash_fast[:fat_percent])
            @phase3b = @person.phases.create!(name: 'IF - no fasting', kcal: phase3_macro_hash_nofast[:kcal], protein_grams: phase3_macro_hash_nofast[:protein_grams], protein_cals: phase3_macro_hash_nofast[:protein_cals], protein_percent: phase3_macro_hash_nofast[:protein_percent], carb_grams: phase3_macro_hash_nofast[:carb_grams], carb_cals: phase3_macro_hash_nofast[:carb_cals], carb_percent: phase3_macro_hash_nofast[:carb_percent], fat_grams: phase3_macro_hash_nofast[:fat_grams], fat_cals: phase3_macro_hash_nofast[:fat_cals], fat_percent: phase3_macro_hash_nofast[:fat_percent])
            # phase4_macro_hash = @phase3.phase4_calcs(@person)
            # @phase4 = @person.phases.create!(name: 'maintenance')
        else 
            phase1_macro_hash = @phase1.total_kcal_calc(@person)
            @phase1.update(kcal: phase1_macro_hash[:total_kcal], protein_grams: phase1_macro_hash[:protein_grams], protein_cals: phase1_macro_hash[:protein_cals], protein_percent: phase1_macro_hash[:protein_percent], carb_grams: phase1_macro_hash[:carb_grams], carb_cals: phase1_macro_hash[:carb_cals], carb_percent: phase1_macro_hash[:carb_percent], fat_grams: phase1_macro_hash[:fat_grams], fat_cals: phase1_macro_hash[:fat_cals], fat_percent: phase1_macro_hash[:fat_percent])
        end
    end 

end 