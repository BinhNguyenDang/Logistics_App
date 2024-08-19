require 'rails_helper'

describe "Delete deadline" do
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

    for i in 1..2 do
      Deadline.create!(
        min_distance: 5 * i,
        max_distance: 10 * i,
        deadline: 15 * i,
        mode_id: 1
      )
      Deadline.create!(
        min_distance: 7 * i,
        max_distance: 13 * i,
        deadline: 17 * i,
        mode_id: 2
      )
    end
  end

  it "deletes a deadline successfully" do
    # Act
    visit root_path
    click_on "Deadlines"
    accept_confirm "Are you sure you want to delete this deadline?" do
      page.all('button.btn-danger')[1].click
    end
    # Assert
    
    expect(page).to have_current_path(deadlines_path)
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
    expect(page).to have_content '14 Km'
    expect(page).to have_content '26 Km'
    expect(page).to have_content '34 hrs'
    expect(page).to have_content 'Mode 2'
    expect(page).not_to have_content '7 Km'
    expect(page).not_to have_content '13 Km'
    expect(page).not_to have_content '17 hrs'
  end
end
