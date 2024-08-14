require 'rails_helper'

describe "Create vehicle" do
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
    click_on 'Vehicles'
    click_on 'New Vehicle'
    # Assert
    expect(page).to have_content 'New Vehicle'
    expect(page).to have_field 'Mode'
    expect(page).to have_field 'Plate'
    expect(page).to have_field 'Brand'
    expect(page).to have_field 'Model'
    expect(page).to have_field 'Category'
    expect(page).to have_field 'Year'
    expect(page).to have_field 'Capacity'
    expect(page).to have_field 'Status'
  end

  it "successfully creates a vehicle" do
    # Act
    visit root_path
    click_on 'Vehicles'
    click_on 'New Vehicle'
    select 'Mode 2', from: 'Mode'
    fill_in "Plate", with: 'ABC-1231'
    fill_in "Brand", with: 'Brand 1'
    fill_in "Model", with: 'Model 1'
    fill_in "Category", with: 'Category 1'
    fill_in "Year", with: '2011'
    fill_in "Capacity", with: '100'
    check "Status"
    click_on 'Save'
    # Assert
    expect(page).to have_current_path(vehicles_path)
    expect(page).to have_content 'Vehicle created successfully'  
    expect(page).to have_content 'Model 1'
  end

  it "displays errors when fields are empty" do
    # Act
    visit root_path
    click_on 'Vehicles'
    click_on 'New Vehicle'
    select 'Mode 2', from: 'Mode'
    fill_in "Plate", with: ''
    fill_in "Brand", with: ''
    fill_in "Model", with: ''
    fill_in "Category", with: ''
    fill_in "Year", with: ''
    fill_in "Capacity", with: ''
    check "Status"
    click_on 'Save'
    # Assert
    expect(page).to have_content 'Error while creating the vehicle'
    expect(page).to have_content "Plate can not be blank"
    expect(page).to have_content "Brand can not be blank"
    expect(page).to have_content "Model can not be blank"
    expect(page).to have_content "Category can not be blank"
    expect(page).to have_content "Year can not be blank"
    expect(page).to have_content "Capacity can not be blank"
  end
end
