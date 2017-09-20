require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding words', {:type => :feature}) do
  it('takes user input and displays words') do
    visit('/')
    fill_in('name', :with => 'Dichotomy')
    fill_in('definition', :with => 'A division or contrast between two things that are or are represented as being opposed or entirely different.')
    click_button('Add!')
    expect(page).to have_content('Dichotomy')
  end
end

describe('displays definitions', {:type => :feature}) do
  it('displays definition when word is clicked on') do
    visit('/')
    click_link('Dichotomy')
    expect(page).to have_content('A division or contrast between two things that are or are represented as being opposed or entirely different.')
  end
end

describe('adds definitions', {:type => :feature}) do
  it('displays new definition when added') do
    visit('/')
    click_link('Dichotomy')
    fill_in('name', :with => 'Dichotomy')
    fill_in('definition', :with => 'Definition2')
    click_button('Add Definition!')
    expect(page).to have_content('Definition2')
  end
end
