require 'spec_helper'

describe 'New trade', type: :feature  do
  it 'creates a new trade' do
    visit '/new-trade'

    fill_in 'cost', with: '200'
    click_button 'buy'

    expect(page).to have_selector('.component.trades .trade', count: 1)
  end
end
