require 'rails_helper'

describe "Delete price" do
  before(:each) do
    # Arrange
    for i in 1..2 do
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
      Price.create!(
        min_weight: 3 * i,
        max_weight: 8 * i,
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

  it "successfully" do
    # Act
    visit root_path
    click_on "Prices"
    accept_confirm "Are you sure you want to delete this price?" do
      page.all('button.btn-danger')[1].click
     end
    # Assert
    expect(page).to have_current_path(prices_path)
    expect(page).to have_content 'Weight'
    expect(page).to have_content 'Price per Km'
    expect(page).to have_content 'Mode'
    expect(page).to have_content 'Actions'
    expect(page).to have_content 'Edit'
    expect(page).to have_content 'Delete'
    expect(page).to have_content '3 Kg'
    expect(page).to have_content '8 Kg'
    expect(page).to have_content '$ 0.11'
    expect(page).to have_content 'Mode 1'
    expect(page).to have_content '6 Kg'
    expect(page).to have_content '16 Kg'
    expect(page).to have_content '$ 0.22'
    expect(page).to have_content '14 Kg'
    expect(page).to have_content '24 Kg'
    expect(page).to have_content '$ 0.32'
    expect(page).not_to have_content '7 Kg'
    expect(page).not_to have_content '12 Kg'
    expect(page).not_to have_content '$ 0.16'
  end
end
