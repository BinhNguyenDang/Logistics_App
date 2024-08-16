require 'rails_helper'

describe "Edit mode" do
  before(:each) do
    #Arrange
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
    #Act
    visit root_path
    click_on "Modes"
    click_on "Mode 1"
    click_on "Edit"
    #Assert
    
    expect(page).to have_current_path(edit_mode_path(1))
    expect(page).to have_content "Name"
    expect(page).to have_content "Minimum Distance (Km)"
    expect(page).to have_content "Maximum Distance (Km)"
    expect(page).to have_content "Minimum Weight (Kg)"
    expect(page).to have_content "Maximum Weight (Kg)"
    expect(page).to have_content "Fixed Fee ($)"
    expect(page).to have_content "Status"
  end

  it "successfully" do
    #Act
    visit root_path
    click_on "Modes"
    click_on "Mode 1"
    click_on "Edit"
    fill_in "Name",	with: "Mode 5" 
    fill_in "Minimum Distance (Km)", with: "15"
    fill_in "Maximum Distance (Km)", with: "50"
    fill_in "Minimum Weight (Kg)",	with: "10"
    fill_in "Maximum Weight (Kg)",	with: "100"
    fill_in "Fixed Fee ($)",	with: "500"
    check "Status"
    click_on "Save"
    #Assert
    
    expect(page).to have_current_path(mode_path(1))
    expect(page).to have_content "Name Mode 5"
    expect(page).to have_content "Minimum Distance 15 Km"
    expect(page).to have_content "Maximum Distance 50 Km"
    expect(page).to have_content "Minimum Weight 10 Kg"
    expect(page).to have_content "Maximum Weight 100 Kg"
    expect(page).to have_content "Fixed Fee $ 500"
    expect(page).to have_content "Status Active"
  end
end