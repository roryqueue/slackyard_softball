require 'rails_helper'

describe League do
  it 'has a name' do
    league = FactoryGirl.build(:league, name: 'International League')

    expect(league.name).to eq 'International League'
  end

  it 'has leaderboards that initialize as empty arrays' do
    league = FactoryGirl.build(:league)

    expect(league.standings).to eq []
    expect(league.hit_leaders).to eq []
    expect(league.homerun_leaders).to eq []
    expect(league.rbi_leaders).to eq []
    expect(league.era_leaders).to eq []
    expect(league.pitching_win_leaders).to eq []
    expect(league.strikeout_leaders).to eq []
  end

  it 'league has a commissioner' do
    league = FactoryGirl.build(:league)

    expect(league.commissioner).to be_instance_of(User)
  end


  it 'has teams, initializes at zero' do
    league = FactoryGirl.build(:league)

    expect(league.teams.count).to eq 0
  end
end
