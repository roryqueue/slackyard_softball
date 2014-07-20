require 'rails_helper'

describe Lineup do
  it 'is instantiated as inactive by default' do
    lineup = FactoryGirl.build(:lineup)

    expect(lineup.active).to eq false
  end
end
