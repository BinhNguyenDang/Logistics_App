require 'rails_helper'

describe "Show modes" do
  before(:each) do
    #Arrange
    Mode.create!(
      name: "Mode Test",
      min_distance: 1,
      max_distance: 20,
      min_weight: 1,
      max_weight: 20,
      fixed_fee: 5,
      active: true
    )
  end
  it "successfully" do
    #Act
    visit root_path 
    click_on "Modes"
    click_on "Mode Test"
    #Assert
    expect(page).to have_content "Name Mode Test"
    expect(page).to have_content "Minimum Distance 1 Km"
    expect(page).to have_content "Maximum Distance 20 Km"
    expect(page).to have_content "Minimum Weight 1 Kg"
    expect(page).to have_content "Maximum Weight 20 Kg"
    expect(page).to have_content "Fixed Fee $ 5"
    expect(page).to have_content "Status Active"
    
  end
  it "returns to modes page" do
    #Act 
    visit root_path 
    click_on "Modes"
    click_on "Mode Test"
    click_on "Back"
    #Assert
    expect(page).to have_current_path(modes_path)
  end
end