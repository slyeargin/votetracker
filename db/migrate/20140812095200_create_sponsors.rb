class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.integer :bill_id
      t.integer :legislator_id
    end

    add_index :sponsors, :bill_id
    add_index :sponsors, :legislator_id
  end
end
