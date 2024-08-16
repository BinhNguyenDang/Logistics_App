require 'rails_helper'

describe "View deadlines" do
  it "visit page" do
    # Act
    visit root_path
    click_on 'Deadlines'
    # Assert
    expect(page).to have_current_path(deadlines_path)
  end

  it "successfully" do
    # Arrange
    for i in 1..3 do
      Mode.create!(
        name: "Mode #{i}",
        min_distance: 10 * i,
        max_distance: 100 * i,
        min_weight: 1 * i,
        max_weight: 100 * i,
        fixed_fee: 50 * i,
        active: true
      )
    end

    for i in 1..3 do
      Deadline.create!(
        min_distance: 5 * i,
        max_distance: 10 * i,
        deadline: 15 * i,
        mode_id: 1
      )
      Deadline.create!(
        min_distance: 8 * i,
        max_distance: 14 * i,
        deadline: 18 * i,
        mode_id: 2
      )
    end

    # Act
    visit root_path
    click_on 'Deadlines'
    # Assert
    expect(page).to have_content 'Distance'
    expect(page).to have_content 'Deadline'
    expect(page).to have_content 'Mode'
    expect(page).to have_content 'Actions'
    expect(page).to have_content 'Edit'
    expect(page).to have_content 'Delete'
    expect(page).to have_content '5 Km'
    expect(page).to have_content '10 Km'
    expect(page).to have_content '15 hrs'
    expect(page).to have_content 'Mode 1'
    expect(page).to have_content '8 Km'
    expect(page).to have_content '14 Km'
    expect(page).to have_content '18 hrs'
    expect(page).to have_content 'Mode 2'
  end

  it "no registered deadlines" do
    # Act
    visit root_path
    click_on 'Deadlines'
    # Assert
    expect(page).to have_content 'No deadlines registered'
  end
end
