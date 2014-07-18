# not implemented yet
# require 'rails_helper'

# feature 'user is able to search for league' do

#   it 'user can search for a league' do

#   correct_league = FactoryGirl.create(:league, name: "national")
#   imperfect_match_league = FactoryGirl.create(:league, name: "american")
#   non_match_league = FactoryGirl.create(:league, name: "international")

#   visit leagues_path

#   fill_in "search", with: correct_league.name
#   click_on "Search"

#   expect(page).to have_content(correct_league.name)
#   expect(page).to have_content(imperfect_match_league.name)
#   expect(page).to_not have_content(non_match_league.name)

#   end
# end
