class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string  "bill_number"
      t.string  "legislator_name"
      t.string  "vote_status"
    end
  end
end
