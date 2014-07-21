require 'rails_helper'

feature "User creates a lineup for team" do
  # As a team manager,
  # I want add players to my team
  # so I have people to play in my games
  #
  # Acceptance Criteria:
  #
  # * I can add players to my team
  # * I can't add players to anyone else's

  it "creates a player on team" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    player = FactoryGirl.build(:player, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on "Add Player to Team"

    fill_in("First Name", with: player.first_name)
    fill_in("Last Name", with: player.last_name)
    fill_in("Bat Contact", with: player.batting_contact)
    fill_in("Bat Power", with: player.batting_power)
    fill_in("Throw Accuracy", with: player.pitching_accuracy)
    fill_in("Pitch Craft", with: player.pitching_craftiness)
    fill_in("Fielding", with: player.fielding)
    fill_in("Speed", with: player.speed)

    click_on "Create Player"

    expect(page).to have_content team.name
    expect(page).to have_content player.name
  end

  it "tries to create an incomplete player and is rejected" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    player = FactoryGirl.build(:player, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on "Add Player to Team"

    fill_in("First Name", with: player.first_name)
    fill_in("Last Name", with: player.last_name)
    fill_in("Bat Contact", with: player.batting_contact)
    fill_in("Bat Power", with: player.batting_power)
    fill_in("Throw Accuracy", with: player.pitching_accuracy)
    fill_in("Pitch Craft", with: player.pitching_craftiness)
    fill_in("Fielding", with: player.fielding)

    click_on "Create Player"

    expect(page).to have_content team.name
    expect(page).not_to have_content player.name
  end

  it "can't access add player page if not manager" do

    team = FactoryGirl.create(:team)

    visit team_path(team)

    expect(page).to have_content team.name
    expect(page).not_to have_content "Add Player to Team"
  end

end
