require 'rails_helper'

describe TeamManager do
  it 'arranges players into field positions' do
    lineup = FactoryGirl.build(:lineup)
    team_manager = TeamManager.new(lineup)

    expect(team_manager.positions[0]).to eq lineup.pitcher
    expect(team_manager.positions[1]).to eq lineup.catcher
    expect(team_manager.positions[2]).to eq lineup.first_baseman
    expect(team_manager.positions[3]).to eq lineup.second_baseman
    expect(team_manager.positions[4]).to eq lineup.third_baseman
    expect(team_manager.positions[5]).to eq lineup.shortstop
    expect(team_manager.positions[6]).to eq lineup.left_fielder
    expect(team_manager.positions[7]).to eq lineup.center_fielder
    expect(team_manager.positions[8]).to eq lineup.right_fielder
  end
  it 'arranges players into batting order' do
    lineup = FactoryGirl.build(:lineup)
    team_manager = TeamManager.new(lineup)

    expect(team_manager.batting_order.order[0]).to eq lineup.first_up
    expect(team_manager.batting_order.order[1]).to eq lineup.second_up
    expect(team_manager.batting_order.order[2]).to eq lineup.third_up
    expect(team_manager.batting_order.order[3]).to eq lineup.fourth_up
    expect(team_manager.batting_order.order[4]).to eq lineup.fifth_up
    expect(team_manager.batting_order.order[5]).to eq lineup.sixth_up
    expect(team_manager.batting_order.order[6]).to eq lineup.seventh_up
    expect(team_manager.batting_order.order[7]).to eq lineup.eighth_up
    expect(team_manager.batting_order.order[8]).to eq lineup.ninth_up
  end
end
