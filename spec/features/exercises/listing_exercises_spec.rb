require 'rails_helper'

RSpec.feature "Listing Exercises" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Vithe", workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: 30, workout: "Biceps", workout_date: Date.tomorrow)
  end

  scenario "Listing exercises" do

    visit '/'
    click_link 'My Lounge'

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)


    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

  end

  scenario "When there are not any" do

    @john.exercises.all.delete_all

    visit '/'
    click_link 'My Lounge'
    expect(page).to have_content('No Workouts Yet')

  end
end