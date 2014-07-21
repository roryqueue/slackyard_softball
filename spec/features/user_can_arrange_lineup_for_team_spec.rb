require 'rails_helper'

feature "User creates a lineup for team" do
  # As a team manager,
  # I want to set a lineup for my team,
  # so I can put players in the right positions and batting order.
  #
  # Acceptance Criteria:
  #
  # * I can arrange a lineup for my team and see that lineup on my team home page
  # * I can set that lineup to active or inactive

  it "creates an inactive lineup associated with a team" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    player = FactoryGirl.create(:player, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on "Add Lineup for Team"

    select(player.name, from: "First up")
    select(player.name, from: "Second up")
    select(player.name, from: "Third up")
    select(player.name, from: "Fourth up")
    select(player.name, from: "Fifth up")
    select(player.name, from: "Sixth up")
    select(player.name, from: "Seventh up")
    select(player.name, from: "Eighth up")
    select(player.name, from: "Ninth up")
    select(player.name, from: "Pitcher")
    select(player.name, from: "Catcher")
    select(player.name, from: "First baseman")
    select(player.name, from: "Second baseman")
    select(player.name, from: "Third baseman")
    select(player.name, from: "Shortstop")
    select(player.name, from: "Left field")
    select(player.name, from: "Center field")
    select(player.name, from: "Right field")
    fill_in("Nickname", with: "This Nickname")

    click_on "Create Lineup"

    expect(page).to have_content team.name
    expect(page).to have_content "This Nickname"
  end

  it "creates an inactive lineup associated with a team" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    player = FactoryGirl.create(:player, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on "Add Lineup for Team"

    select(player.name, from: "First up")
    select(player.name, from: "Second up")
    select(player.name, from: "Third up")
    select(player.name, from: "Fourth up")
    select(player.name, from: "Fifth up")
    select(player.name, from: "Sixth up")
    select(player.name, from: "Seventh up")
    select(player.name, from: "Eighth up")
    select(player.name, from: "Ninth up")
    select(player.name, from: "Pitcher")
    select(player.name, from: "Catcher")
    select(player.name, from: "First baseman")
    select(player.name, from: "Second baseman")
    select(player.name, from: "Third baseman")
    select(player.name, from: "Shortstop")
    select(player.name, from: "Left field")
    select(player.name, from: "Center field")
    select(player.name, from: "Right field")
    fill_in("Nickname", with: "That Nickname")
    check("Set lineup to active?")

    click_on "Create Lineup"

    expect(page).to have_content "That Nickname"
    expect(page).to have_content "(active)"
  end

  it "tries to create a lineup with incomplete info and gets error message" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    player = FactoryGirl.create(:player, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on "Add Lineup for Team"

    select(player.name, from: "First up")
    select(player.name, from: "Second up")
    select(player.name, from: "Third up")
    select(player.name, from: "Fourth up")
    select(player.name, from: "Fifth up")
    select(player.name, from: "Sixth up")
    select(player.name, from: "Seventh up")
    select(player.name, from: "Eighth up")
    select(player.name, from: "Ninth up")
    select(player.name, from: "Pitcher")
    select(player.name, from: "Catcher")
    select(player.name, from: "First baseman")
    select(player.name, from: "Second baseman")
    select(player.name, from: "Third baseman")
    select(player.name, from: "Shortstop")
    select(player.name, from: "Left field")
    select(player.name, from: "Center field")
    fill_in("Nickname", with: "Another Nickname")

    click_on "Create Lineup"

    expect(page).not_to have_content "Another Nickname"
    expect(page).to have_content team.name
  end

  it "can't access add lineup page if not manager" do

    team = FactoryGirl.create(:team)

    visit team_path(team)

    expect(page).to have_content team.name
    expect(page).not_to have_content "Add Lineup for Team"
  end
end
