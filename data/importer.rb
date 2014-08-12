# Run from project root via. `ruby data/importer.rb`
require 'csv'
require 'active_record'
require 'date'
require_relative '../app/models/bill'
require_relative '../lib/environment'

Environment.environment = "development"
bills = "data/bills.csv"
legislators = "data/legislators.csv"
votes = "data/votes.csv"

CSV.foreach(bills, headers: true) do |row|
  bill_number = row['bill_number']
  bill_name = row['name']
  bill_description = row['description']
  bill_floor_vote_date = Date.strptime(row['floor_vote_date'], '%m/%d/%Y')

  bill = Bill.create(bill_number: bill_number, name: bill_name, description: bill_description, floor_vote_date: bill_floor_vote_date)
  puts "Imported #{bill_number}: #{bill_name}."
end

CSV.foreach(legislators, headers: true) do |row|
  legislator_name = row['name']
  legislator_hometown = row['hometown']
  legislator_district_number = row['district_number'].to_i
  legislator_party_affiliation = row['party_affiliation']
  legislator_governing_body = row['governing_body']

  legislator = Legislator.create(name: legislator_name, hometown: legislator_hometown, district_number: legislator_district_number, party_affiliation: legislator_party_affiliation, governing_body: legislator_governing_body)
  puts "Imported information for #{legislator.name}."
end

CSV.foreach(votes, headers: true) do |row|
  bill_number = row['bill_number']
  legislator_name = row['legislator_name']
  vote_status = row['vote_status']

  vote = Vote.create(bill_number: bill_number, legislator_name: legislator_name, vote_status: vote_status)
  puts "Imported vote #{vote.id}."
end
