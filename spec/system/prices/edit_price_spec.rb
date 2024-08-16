require 'rails_helper'

fdescribe "Edit price" do
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
  end

  it "view page and form" do
    # Act
    visit root_path
    click_on "Prices"
    page.all('button.btn-warning')[1].click
    # Assert
    expect(page).to have_current_path(edit_price_path(2))
    expect(page).to have_field 'Minimum Weight (Kg)'
    expect(page).to have_field 'Maximum Weight (Kg)'
    expect(page).to have_field 'Price per Km ($)'
    expect(page).to have_field 'Mode'
  end

  it "successfully" do
    # Act
    visit root_path
    click_on "Prices"
    page.all('button.btn-warning')[1].click
    fill_in "Minimum Weight (Kg)", with: "99"
    fill_in "Maximum Weight (Kg)", with: "199"
    fill_in "Price per Km ($)", with: "0.99"
    select "Mode 3", from: "Mode"
    click_on "Save"
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
    expect(page).to have_content '99 Kg'
    expect(page).to have_content '199 Kg'
    expect(page).to have_content '$ 0.99'
    expect(page).to have_content 'Mode 3'
  end
end
