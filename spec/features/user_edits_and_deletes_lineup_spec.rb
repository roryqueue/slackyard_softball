require 'rails_helper'

feature "User creates a lineup for team" do
  # As a team manager,
  # I want to be able to edit and delete lineups
  # so I don't have a glut of unused arrangements
  #
  # Acceptance Criteria:
  #
  # * I can change a lineup and see that changed lineup on the team page as team manager
  # * I can delete a lineup as team manager
  # * I can't edit or delete a player if I'm not team manager

  it "changes arrangement of lineup" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    lineup = FactoryGirl.create(:lineup, team: team)
    player = FactoryGirl.create(:player, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on lineup.nickname

    select(player.name, from: "First up")

    click_on "Update Lineup"

    expect(page).to have_content "#{lineup.nickname} has been successfully updated!"
    expect(page).to have_content team.name
  end

  it "deletes lineup" do

    user = FactoryGirl.create(:user)
    team = FactoryGirl.create(:team, user: user)
    lineup = FactoryGirl.create(:lineup, team: team)

    sign_in_as(user)

    visit team_path(team)

    click_on lineup.nickname

    click_on "Delete Lineup"

    expect(page).to have_content "#{lineup.nickname} has been deleted."
    expect(page).to have_content team.name
  end

  it "can't access edit page if not manager" do

    team = FactoryGirl.create(:team)
    lineup = FactoryGirl.create(:lineup, team: team)

    visit team_path(team)

    expect(page).to have_content team.name
    expect(page).not_to have_content lineup.nickname
  end
end
