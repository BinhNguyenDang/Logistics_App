require 'rails_helper'

describe "Create price" do
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

  it "view page and form" do
    # Act
    visit root_path
    click_on 'Prices'
    click_on 'New Price'
    # Assert
    expect(page).to have_content 'New Price'
    expect(page).to have_field 'Minimum Weight (Kg)'
    expect(page).to have_field 'Maximum Weight (Kg)'
    expect(page).to have_field 'Price per Km ($)'
    expect(page).to have_field 'Mode'
    expect(page).to have_button 'Save'
  end

  it "successfully" do
    # Act
    visit root_path
    click_on 'Prices'
    click_on 'New Price'
    fill_in "Minimum Weight (Kg)", with: '11'
    fill_in "Maximum Weight (Kg)", with: '20'
    fill_in "Price per Km ($)", with: "0.55"
    select "Mode 2", from: "Mode"
    click_on 'Save'
    # Assert
    expect(page).to have_current_path(prices_path)
    expect(page).to have_content 'Price successfully registered'
    expect(page).to have_content 'Weight'
    expect(page).to have_content 'Price per Km'
    expect(page).to have_content 'Mode'
    expect(page).to have_content 'Actions'
    expect(page).to have_content '11 Kg'
    expect(page).to have_content '20 Kg'
    expect(page).to have_content '$ 0.55'
    expect(page).to have_content 'Mode 2'
    expect(page).to have_content 'Edit'
    expect(page).to have_content 'Delete'
  end

  it "not empty fields" do
    # Act
    visit root_path
    click_on 'Prices'
    click_on 'New Price'
    fill_in "Minimum Weight (Kg)", with: ''
    fill_in "Maximum Weight (Kg)", with: ''
    fill_in "Price per Km ($)", with: ''
    select "Mode 2", from: "Mode"
    click_on 'Save'
    # Assert
    expect(page).to have_content 'Error registering price'
    expect(page).to have_content 'Minimum Weight can not be blank'
    expect(page).to have_content 'Maximum Weight can not be blank'
    expect(page).to have_content 'Price per Km can not be blank'
  end
end
