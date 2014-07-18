# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  # user = User.find_or_create_by(user_name: "Bob", email: "bob@example.com")
  user = FactoryGirl.create(:user)
    # encrypted_password: "#$taawktljasktlw4aaglj")
  american_league = League.find_or_create_by(name: "American League", commissioner_id: user.id)
  # binding.pry
  sox = Team.find_or_create_by(name: "Red Sox", league_id: american_league.id, user_id: user.id)
  yanks = Team.find_or_create_by(name: "Yankees", league_id: american_league.id, user_id: user.id)
  jays = Team.find_or_create_by(name: "Blue Jays", league_id: american_league.id, user_id: user.id)
  rays = Team.find_or_create_by(name: "Devil Rays", league_id: american_league.id, user_id: user.id)

  sox0 = Player.find_or_create_by(team_id: sox.id, first_name: "Justin", last_name: "Verlander", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox1 = Player.find_or_create_by(team_id: sox.id, first_name: "Alex", last_name: "Gonzalez", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox2 = Player.find_or_create_by(team_id: sox.id, first_name: "Hanley", last_name: "Ramirez", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox3 = Player.find_or_create_by(team_id: sox.id, first_name: "Xander", last_name: "Bogaerts", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox4 = Player.find_or_create_by(team_id: sox.id, first_name: "Justin2", last_name: "Verlander2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox5 = Player.find_or_create_by(team_id: sox.id, first_name: "Alex2", last_name: "Gonzalez2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox6 = Player.find_or_create_by(team_id: sox.id, first_name: "Hanley2", last_name: "Ramirez2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox7 = Player.find_or_create_by(team_id: sox.id, first_name: "Xander2", last_name: "Bogaerts2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  sox8 = Player.find_or_create_by(team_id: sox.id, first_name: "Xander3", last_name: "Bogaerts3", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)

  yanks0 = Player.find_or_create_by(team_id: yanks.id, first_name: "CC", last_name: "Sabathia", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks1 = Player.find_or_create_by(team_id: yanks.id, first_name: "David", last_name: "Ortiz", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks2 = Player.find_or_create_by(team_id: yanks.id, first_name: "Miguel", last_name: "Cabrera", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks3 = Player.find_or_create_by(team_id: yanks.id, first_name: "Bryce", last_name: "Harper", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks4 = Player.find_or_create_by(team_id: yanks.id, first_name: "CC2", last_name: "Sabathia2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks5 = Player.find_or_create_by(team_id: yanks.id, first_name: "David2", last_name: "Ortiz2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks6 = Player.find_or_create_by(team_id: yanks.id, first_name: "Miguel2", last_name: "Cabrera2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks7 = Player.find_or_create_by(team_id: yanks.id, first_name: "Bryce2", last_name: "Harper2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  yanks8 = Player.find_or_create_by(team_id: yanks.id, first_name: "Bryce3", last_name: "Harper3", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)

  jays0 = Player.find_or_create_by(team_id: jays.id, first_name: "Justin", last_name: "Verlander", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays1 = Player.find_or_create_by(team_id: jays.id, first_name: "Alex", last_name: "Gonzalez", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays2 = Player.find_or_create_by(team_id: jays.id, first_name: "Hanley", last_name: "Ramirez", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays3 = Player.find_or_create_by(team_id: jays.id, first_name: "Xander", last_name: "Bogaerts", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays4 = Player.find_or_create_by(team_id: jays.id, first_name: "Justin2", last_name: "Verlander2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays5 = Player.find_or_create_by(team_id: jays.id, first_name: "Alex2", last_name: "Gonzalez2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays6 = Player.find_or_create_by(team_id: jays.id, first_name: "Hanley2", last_name: "Ramirez2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays7 = Player.find_or_create_by(team_id: jays.id, first_name: "Xander2", last_name: "Bogaerts2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  jays8 = Player.find_or_create_by(team_id: jays.id, first_name: "Xander3", last_name: "Bogaerts3", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)

  rays0 = Player.find_or_create_by(team_id: rays.id, first_name: "Justin", last_name: "Verlander", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays1 = Player.find_or_create_by(team_id: rays.id, first_name: "Alex", last_name: "Gonzalez", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays2 = Player.find_or_create_by(team_id: rays.id, first_name: "Hanley", last_name: "Ramirez", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays3 = Player.find_or_create_by(team_id: rays.id, first_name: "Xander", last_name: "Bogaerts", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays4 = Player.find_or_create_by(team_id: rays.id, first_name: "Justin2", last_name: "Verlander2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays5 = Player.find_or_create_by(team_id: rays.id, first_name: "Alex2", last_name: "Gonzalez2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays6 = Player.find_or_create_by(team_id: rays.id, first_name: "Hanley2", last_name: "Ramirez2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays7 = Player.find_or_create_by(team_id: rays.id, first_name: "Xander2", last_name: "Bogaerts2", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)
  rays8 = Player.find_or_create_by(team_id: rays.id, first_name: "Xander3", last_name: "Bogaerts3", batting_contact: 70, batting_power: 70, pitching_craftiness: 70, pitching_accuracy: 70, fielding: 70, speed: 70)

  sox_lineup = Lineup.find_or_create_by(team_id: sox.id, pitcher_id: sox0.id, catcher_id: sox1.id, first_baseman_id: sox2.id,
    second_baseman_id: sox3.id, third_baseman_id: sox4.id, shortstop_id: sox5.id, left_fielder_id: sox6.id,
    center_fielder_id: sox7.id, right_fielder_id: sox8.id, first_up_id: sox0.id, second_up_id: sox1.id,
    third_up_id: sox2.id, fourth_up_id: sox3.id, fifth_up_id: sox4.id, sixth_up_id: sox5.id,
    seventh_up_id: sox6.id, eighth_up_id: sox7.id, ninth_up_id: sox8.id, nickname: "Sox Lineup", active: true)

  yanks_lineup = Lineup.find_or_create_by(team_id: yanks.id, pitcher_id: yanks0.id, catcher_id: yanks1.id, first_baseman_id: yanks2.id,
    second_baseman_id: yanks3.id, third_baseman_id: yanks4.id, shortstop_id: yanks5.id, left_fielder_id: yanks6.id,
    center_fielder_id: yanks7.id, right_fielder_id: yanks8.id, first_up_id: yanks0.id, second_up_id: yanks1.id,
    third_up_id: yanks2.id, fourth_up_id: yanks3.id, fifth_up_id: yanks4.id, sixth_up_id: yanks5.id,
    seventh_up_id: yanks6.id, eighth_up_id: yanks7.id, ninth_up_id: yanks8.id, nickname: "Yanks Lineup", active: true)

  jays_lineup = Lineup.find_or_create_by(team_id: jays.id, pitcher_id: jays0.id, catcher_id: jays1.id, first_baseman_id: jays2.id,
    second_baseman_id: jays3.id, third_baseman_id: jays4.id, shortstop_id: jays5.id, left_fielder_id: jays6.id,
    center_fielder_id: jays7.id, right_fielder_id: jays8.id, first_up_id: jays0.id, second_up_id: jays1.id,
    third_up_id: jays2.id, fourth_up_id: jays3.id, fifth_up_id: jays4.id, sixth_up_id: jays5.id,
    seventh_up_id: jays6.id, eighth_up_id: jays7.id, ninth_up_id: jays8.id, nickname: "Jays Lineup", active: true)

  rays_lineup = Lineup.find_or_create_by(team_id: rays.id, pitcher_id: rays0.id, catcher_id: rays1.id, first_baseman_id: rays2.id,
    second_baseman_id: rays3.id, third_baseman_id: rays4.id, shortstop_id: rays5.id, left_fielder_id: rays6.id,
    center_fielder_id: rays7.id, right_fielder_id: rays8.id, first_up_id: rays0.id, second_up_id: rays1.id,
    third_up_id: rays2.id, fourth_up_id: rays3.id, fifth_up_id: rays4.id, sixth_up_id: rays5.id,
    seventh_up_id: rays6.id, eighth_up_id: rays7.id, ninth_up_id: rays8.id, nickname: "Rays Lineup", active: true)

  Season.new(american_league)
