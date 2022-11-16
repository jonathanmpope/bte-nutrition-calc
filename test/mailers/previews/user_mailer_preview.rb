class UserMailerPreview < ActionMailer::Preview
  def results_email
    @user = Person.create!(email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    @phase1 = @user.phases.new(name: @user.goal)
    phase1_macro_hash = @phase1.total_kcal_calc(@user)
    @phase1.update(kcal: phase1_macro_hash[:total_kcal], protein_grams: phase1_macro_hash[:protein_grams], protein_cals: phase1_macro_hash[:protein_cals], protein_percent: phase1_macro_hash[:protein_percent], carb_grams: phase1_macro_hash[:carb_grams], carb_cals: phase1_macro_hash[:carb_cals], carb_percent: phase1_macro_hash[:carb_percent], fat_grams: phase1_macro_hash[:fat_grams], fat_cals: phase1_macro_hash[:fat_cals], fat_percent: phase1_macro_hash[:fat_percent])
    phase2_macro_hash = @phase1.phase2_calcs(@user)
    @phase2 = @user.phases.create!(name: 'keto', kcal: phase2_macro_hash[:kcal], protein_grams: phase2_macro_hash[:protein_grams], protein_cals: phase2_macro_hash[:protein_cals], protein_percent: phase2_macro_hash[:protein_percent], carb_grams: phase2_macro_hash[:carb_grams], carb_cals: phase2_macro_hash[:carb_cals], carb_percent: phase2_macro_hash[:carb_percent], fat_grams: phase2_macro_hash[:fat_grams], fat_cals: phase2_macro_hash[:fat_cals], fat_percent: phase2_macro_hash[:fat_percent])
    phase3_macro_hash_fast = @phase2.phase3_calcs_fasting(@user)
    phase3_macro_hash_nofast = @phase2.phase3_calcs_nonfasting(@user)
    @phase3a = @user.phases.create!(name: 'Intermittent fasting - fasting days', kcal: phase3_macro_hash_fast[:kcal], protein_grams: phase3_macro_hash_fast[:protein_grams], protein_cals: phase3_macro_hash_fast[:protein_cals], protein_percent: phase3_macro_hash_fast[:protein_percent], carb_grams: phase3_macro_hash_fast[:carb_grams], carb_cals: phase3_macro_hash_fast[:carb_cals], carb_percent: phase3_macro_hash_fast[:carb_percent], fat_grams: phase3_macro_hash_fast[:fat_grams], fat_cals: phase3_macro_hash_fast[:fat_cals], fat_percent: phase3_macro_hash_fast[:fat_percent])
    @phase3b = @user.phases.create!(name: 'Intermittent fasting - non-fasting days', kcal: phase3_macro_hash_nofast[:kcal], protein_grams: phase3_macro_hash_nofast[:protein_grams], protein_cals: phase3_macro_hash_nofast[:protein_cals], protein_percent: phase3_macro_hash_nofast[:protein_percent], carb_grams: phase3_macro_hash_nofast[:carb_grams], carb_cals: phase3_macro_hash_nofast[:carb_cals], carb_percent: phase3_macro_hash_nofast[:carb_percent], fat_grams: phase3_macro_hash_nofast[:fat_grams], fat_cals: phase3_macro_hash_nofast[:fat_cals], fat_percent: phase3_macro_hash_nofast[:fat_percent])
    UserMailer.with(user: @user).results_email
  end
end