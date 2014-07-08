require 'spec_helper'

feature "User visits leagues index" do
  # As a User
  # I want to see all the events on one page
  # So that I know what events are happening
  #
  # Acceptance Criteria:
  #
  # * I see a title that lets me know I'm on the right page
  # * I see all of the events listed

  it "finds index page title and league" do
    league = FactoryGirl.create(:league)

    visit '/league'
    expect(page).to have_content "Leagues"
    expect(page).to have_content league.name
  end

  it "finds league name on its show page" do
    league = FactoryGirl.create(:league)
    team = FactoryGirl.create(:team, league_id: league.id)

    visit "/league/#{league.id}"
    expect(page).to have_content "Standings"
    expect(page).to have_content league.name
    expect(page).to have_content team.name
  end
end
