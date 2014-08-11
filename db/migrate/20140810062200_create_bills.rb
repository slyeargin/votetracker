class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.text  "bill_number"
      t.text     "name"
      t.text     "description"
      t.date "floor_vote_date"
    end
  end
end
