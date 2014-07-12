require 'rails_helper'

describe League do
  it 'returns the concatenated first and last name' do
    # setup
    user = build(:user, first_name: 'Josh', last_name: 'Steiner')

    # excercise and verify
    expect(user.name).to eq 'Josh Steiner'
  end
end
