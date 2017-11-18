require 'spec_helper'

describe 'Homepage', type: :feature  do
  before { visit '/' }

  it 'shows the title' do
    expect(page).to have_content('Bitcoin exchange')
  end

  it 'shows the bitcoin price' do
    expect(page).to have_selector('.component.price')
  end

  it "doesn't have any trade at the beginning" do
    expect(page).to have_selector('.component.trades > .trade', count: 0)
  end

  it 'redirect me to create a new trade when I click on the link' do
    click_link('new-trade')

    expect(page).to have_current_path('/new-trade')
  end
end
