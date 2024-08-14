require 'rails_helper'

describe "Edit vehicle" do
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

  it "views page and form" do
    # Act
    visit root_path
    click_on "Vehicles"
    click_on "ABC-1231"
    click_on "Edit"
    # Assert
    expect(page).to have_current_path(edit_vehicle_path(1))
    expect(page).to have_content "Edit Vehicle"
    expect(page).to have_content "Plate"
    expect(page).to have_content "Brand"
    expect(page).to have_content "Model"
    expect(page).to have_content "Category"
    expect(page).to have_content "Year"
    expect(page).to have_content "Capacity"
    expect(page).to have_content "Status"
  end

  it "successfully updates a vehicle" do
    # Act
    visit root_path
    click_on "Vehicles"
    click_on "ABC-1231"
    click_on "Edit"
    select "Mode 3", from: "Mode"
    fill_in "Plate",	with: "ABC-9999" 
    fill_in "Brand",	with: "Brand 9999"
    fill_in "Model",	with: "Model 9999"
    fill_in "Category",	with: "Category 9999"
    fill_in "Year",	with: "2019"
    fill_in "Capacity",	with: "9999"
    check "Status"
    click_on "Save"
    # Assert
    expect(page).to have_current_path(vehicle_path(1))
    expect(page).to have_content "Vehicle"
    expect(page).to have_content "Plate ABC-9999"
    expect(page).to have_content "Brand Brand 9999"
    expect(page).to have_content "Model Model 9999"
    expect(page).to have_content "Category Category 9999"
    expect(page).to have_content "Year 2019"
    expect(page).to have_content "Capacity 9999"
    expect(page).to have_content "Status In operation"
  end
end
