require 'rails_helper'

describe Game do
  it 'starts with no score' do
    game = FactoryGirl.build(:game)

    expect(game.home_score).to eq 0
    expect(game.away_score).to eq 0
  end
end
