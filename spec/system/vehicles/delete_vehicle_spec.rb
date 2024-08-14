require 'rails_helper'

describe "Delete vehicle" do
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

    for i in 1..3 do
      Vehicle.create!(
        plate: "ABC-123#{i}",
        brand: "Brand #{i}",
        model: "Model #{i}",
        category: "Category #{i}",
        year: "201#{i}",
        capacity: 100 * i,
        status: true,
        mode_id: 1
      )
    end
  end

  it "successfully deletes a vehicle" do
    # Act
    visit root_path
    click_on "Vehicles"
    click_on "ABC-1231"
    # Simulate the confirmation dialog
    accept_confirm "Are you sure you want to delete this vehicle?" do
     click_on "Delete"
    end
    # Assert
    expect(page).to have_current_path(vehicles_path)
    expect(page).to have_content "Vehicles"
    expect(page).to have_content "Plate"
    expect(page).to have_content "Model"
    expect(page).to have_content "Category"
    expect(page).to have_content "Status"
    expect(page).to have_content "ABC-1232"
    expect(page).to have_content "ABC-1233"
    expect(page).not_to have_content "ABC-1231"
  end
end
