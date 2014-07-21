require 'rails_helper'

describe Team do
  it 'has a name' do
    team = FactoryGirl.build(:team, name: 'West Roxbury Phillies')

    expect(team.name).to eq 'West Roxbury Phillies'
  end

  it 'calculates team stats, most are starting at zero' do
    team = FactoryGirl.build(:team)

    expect(team.homeruns).to eq 0
    expect(team.triples).to eq 0
    expect(team.doubles).to eq 0
    expect(team.singles).to eq 0
    expect(team.rbis).to eq 0
    expect(team.runs_scored).to eq 0
    expect(team.strikeouts_thrown).to eq 0
    expect(team.wins).to eq 0
    expect(team.losses).to eq 0
    expect(team.err_count).to eq 0
    expect(team.batting_average).to eq 0
    expect(team.field_percentage).to eq 0
  end

  it 'calculates team stats, those with divide-by-zero constraints are predetermined' do
    team = FactoryGirl.build(:team)

    expect(team.era).to eq 999.99
  end

  it 'has a league and an owner' do
    team = FactoryGirl.build(:team)

    expect(team.league).to be_instance_of(League)
    expect(team.user).to be_instance_of(User)
  end

  it 'has players and lineups, both initialize at zero' do
    team = FactoryGirl.build(:team)

    expect(team.players.count).to eq 0
    expect(team.lineups.count).to eq 0
  end
end
