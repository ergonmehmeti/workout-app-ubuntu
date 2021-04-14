require 'rails_helper'

RSpec.feature 'Test spec' do

  scenario 'visit home page' do
    visit '/'
    expect(page).to have_content('Yay! You’re on Rails!')
  end
end