require 'rails_helper'

describe "View prices" do
  it "visit page" do
    # Act
    visit root_path
    click_on 'Prices'
    # Assert
    expect(page).to have_current_path(prices_path)
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
      Price.create!(
        min_weight: 5 * i,
        max_weight: 10 * i,
        price_per_km: 0.11 * i,
        mode_id: 1
      )
      Price.create!(
        min_weight: 7 * i,
        max_weight: 12 * i,
        price_per_km: 0.16 * i,
        mode_id: 2
      )
    end

    # Act
    visit root_path
    click_on 'Prices'
    # Assert
    expect(page).to have_content 'Weight'
    expect(page).to have_content 'Price per Km'
    expect(page).to have_content 'Mode'
    expect(page).to have_content 'Actions'
    expect(page).to have_content 'Edit'
    expect(page).to have_content 'Delete'
    expect(page).to have_content '5 Kg'
    expect(page).to have_content '10 Kg'
    expect(page).to have_content '$ 0.11'
    expect(page).to have_content 'Mode 1'
    expect(page).to have_content '7 Kg'
    expect(page).to have_content '12 Kg'
    expect(page).to have_content '$ 0.16'
    expect(page).to have_content 'Mode 2'
  end

  it "no registered prices" do
    # Act
    visit root_path
    click_on 'Prices'
    # Assert
    expect(page).to have_content 'No prices registered'
  end
end
