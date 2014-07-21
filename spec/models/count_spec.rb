require 'rails_helper'

describe Count do
  it 'has pitches, balls, and strikes' do
    count = Count.new

    expect(count.balls).to eq 0
    expect(count.strikes).to eq 0
    expect(count.pitches).to eq 0
  end
  it 'can be adjusted' do
    count = Count.new

    count.balls += 1
    count.strikes += 2
    count.pitches += 3

    expect(count.balls).to eq 1
    expect(count.strikes).to eq 2
    expect(count.pitches).to eq 3
  end
end
