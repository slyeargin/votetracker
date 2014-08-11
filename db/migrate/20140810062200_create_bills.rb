class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string  "bill_number"
      t.text     "name"
      t.text     "description"
      t.string "floor_vote_date"
    end
  end
end
