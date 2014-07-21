require 'rails_helper'

describe BattingOrder do
  it 'has a defined order' do
    batting_order = BattingOrder.new(['Jack', 'Jim', 'Larry'])

    expect(batting_order.order.first).to eq 'Jack'
  end
  it 'has a changing and persisting rotation' do
    batting_order = BattingOrder.new(['Jack', 'Jim', 'Larry'])

    expect(batting_order.order.first).to eq 'Jack'

    batting_order.next!

    expect(batting_order.order.first).to eq 'Jim'
  end
end
