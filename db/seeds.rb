# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  user = User.create!(user_name: "Bob", email: "bob@example.com", password: "bobobobob", password_confirmation: "bobobobob")
    # encrypted_password: "#$taawktljasktlw4aaglj")
  american_league = League.create!(name: "AL", commissioner_id: user.id)
  sox = Team.create!(name: 'Sox', league_id: american_league.id, user_id: user.id)
  yanks = Team.create!(name: 'Yanks', league_id: american_league.id, user_id: user.id)

  sox0 = Player.create!(team_id: sox.id, first_name: "Justin", last_name: "Verlander", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox1 = Player.create!(team_id: sox.id, first_name: "Alex", last_name: "Gonzalez", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox2 = Player.create!(team_id: sox.id, first_name: "Hanley", last_name: "Ramirez", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox3 = Player.create!(team_id: sox.id, first_name: "Xander", last_name: "Bogaerts", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox4 = Player.create!(team_id: sox.id, first_name: "Justin", last_name: "Verlander", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox5 = Player.create!(team_id: sox.id, first_name: "Alex", last_name: "Gonzalez", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox6 = Player.create!(team_id: sox.id, first_name: "Hanley", last_name: "Ramirez", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox7 = Player.create!(team_id: sox.id, first_name: "Xander", last_name: "Bogaerts", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  sox8 = Player.create!(team_id: sox.id, first_name: "Xander", last_name: "Bogaerts", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)

  yanks0 = Player.create!(team_id: yanks.id, first_name: "CC", last_name: "Sabathia", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks1 = Player.create!(team_id: yanks.id, first_name: "David", last_name: "Ortiz", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks2 = Player.create!(team_id: yanks.id, first_name: "Miguel", last_name: "Cabrera", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks3 = Player.create!(team_id: yanks.id, first_name: "Bryce", last_name: "Harper", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks4 = Player.create!(team_id: yanks.id, first_name: "CC", last_name: "Sabathia", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks5 = Player.create!(team_id: yanks.id, first_name: "David", last_name: "Ortiz", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks6 = Player.create!(team_id: yanks.id, first_name: "Miguel", last_name: "Cabrera", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks7 = Player.create!(team_id: yanks.id, first_name: "Bryce", last_name: "Harper", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)
  yanks8 = Player.create!(team_id: yanks.id, first_name: "Bryce", last_name: "Harper", batting_contact: 90, batting_power: 90, pitching_craftiness: 90, pitching_accuracy: 90, fielding: 90, speed: 90)

Lineup.create!(team_id: sox.id, pitcher_id: sox0.id, catcher_id: sox1.id, first_baseman_id: sox2.id,
  second_baseman_id: sox3.id, third_baseman_id: sox4.id, shortstop_id: sox5.id, left_fielder_id: sox6.id,
  center_fielder_id: sox7.id, right_fielder_id: sox8.id, first_up_id: sox0.id, second_up_id: sox1.id,
  third_up_id: sox2.id, fourth_up_id: sox3.id, fifth_up_id: sox4.id, sixth_up_id: sox5.id,
  seventh_up_id: sox6.id, eighth_up_id: sox7.id, ninth_up_id: sox8.id)
Lineup.create!(team_id: yanks.id, pitcher_id: yanks0.id, catcher_id: yanks1.id, first_baseman_id: yanks2.id,
  second_baseman_id: yanks3.id, third_baseman_id: yanks4.id, shortstop_id: yanks5.id, left_fielder_id: yanks6.id,
  center_fielder_id: yanks7.id, right_fielder_id: yanks8.id, first_up_id: yanks0.id, second_up_id: yanks1.id,
  third_up_id: yanks2.id, fourth_up_id: yanks3.id, fifth_up_id: yanks4.id, sixth_up_id: yanks5.id,
  seventh_up_id: yanks6.id, eighth_up_id: yanks7.id, ninth_up_id: yanks8.id)
