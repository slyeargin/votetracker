class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer  "bill_number"
      t.text     "name"
      t.text     "description"
      t.datetime "floor_vote_date"
    end
  end
end
