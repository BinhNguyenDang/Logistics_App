require 'rails_helper'

describe "Create deadline" do
  before(:each) do
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
  end

  it "views page and form" do
    # Act
    visit root_path
    click_on 'Deadlines'
    click_on 'New Deadline'
    # Assert
    expect(page).to have_content 'New Deadline'
    expect(page).to have_field 'Minimum Distance (Km)'
    expect(page).to have_field 'Maximum Distance (Km)'
    expect(page).to have_field 'Deadline (hrs)'
    expect(page).to have_field 'Mode'
    expect(page).to have_button 'Save'
  end

  it "creates a deadline successfully" do
    # Act
    visit root_path
    click_on 'Deadlines'
    click_on 'New Deadline'
    fill_in "Minimum Distance (Km)", with: '11'
    fill_in "Maximum Distance (Km)", with: '20'
    fill_in "Deadline (hrs)", with: "55"
    select "Mode 2", from: "Mode"
    click_on 'Save'
    # Assert
    expect(page).to have_current_path(deadlines_path)
    expect(page).to have_content 'Deadline created successfully'
    expect(page).to have_content 'Distance'
    expect(page).to have_content 'Deadline'
    expect(page).to have_content 'Mode'
    expect(page).to have_content 'Actions'
    expect(page).to have_content '11 Km'
    expect(page).to have_content '20 Km'
    expect(page).to have_content '55 hrs'
    expect(page).to have_content 'Mode 2'
    expect(page).to have_content 'Edit'
    expect(page).to have_content 'Delete'
  end

  it "does not allow empty fields" do
    # Act
    visit root_path
    click_on 'Deadlines'
    click_on 'New Deadline'
    fill_in "Minimum Distance (Km)", with: ''
    fill_in "Maximum Distance (Km)", with: ''
    fill_in "Deadline (hrs)", with: ''
    select "Mode 2", from: "Mode"
    click_on 'Save'
    # Assert
    expect(page).to have_content 'Error creating deadline'
    expect(page).to have_content 'Minimum Distance can not be blank'
    expect(page).to have_content 'Maximum Distance can not be blank'
    expect(page).to have_content 'Deadline can not be blank'
  end
end
