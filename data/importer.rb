# Run from project root via. `ruby data/importer.rb`
require 'csv'
require_relative '../app/models/bill'
require_relative '../lib/environment'

Environment.environment = "development"
source = "data/bills.csv"

CSV.foreach(source, headers: true) do |row|
  bill_number = row['bill_number']
  bill_name = row['name']
  bill_description = row['description']
  bill_floor_vote_date = row['floor_vote_date']

  Bill.create(bill_number: bill_number, name: bill_name, description: bill_description, floor_vote_date: floor_vote_date)
  puts "Imported #{bill_number}: #{bill_name}."
end
