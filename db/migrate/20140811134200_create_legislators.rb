class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string  "name"
      t.string  "hometown"
      t.integer "district_number"
      t.string  "party_affiliation"
      t.string  "governing_body"
    end
  end
end
