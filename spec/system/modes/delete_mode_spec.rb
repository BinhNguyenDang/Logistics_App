require 'rails_helper'

describe "Delete mode" do
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

  it "successfully" do
    # Act
    visit root_path
    click_on "Modes"
    click_on "Mode 1"
    accept_confirm "Are you sure you want to delete this mode?" do
      click_on "Delete"
     end
    # Assert
    expect(page).to have_current_path(modes_path)
    expect(page).to have_content "Modes"
    expect(page).to have_content "Name"
    expect(page).to have_content "Minimum Distance (Km)"
    expect(page).to have_content "Maximum Distance (Km)"
    expect(page).to have_content "Status"
    expect(page).to have_content "Mode 2"
    expect(page).to have_content "Mode 3"
    expect(page).not_to have_content "Mode 1"
  end
end
