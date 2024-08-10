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
    expect(page).to have_content "Mode: Mode Test"
    expect(page).to have_content "Distance: from 1 to 20"
    expect(page).to have_content "Weight: from 1 to 20"
    expect(page).to have_content "$ 5"
  end
  it "returns to modes page" do
    #Act 
    visit root_path 
    click_on "Modes"
    click_on "Mode Test"
    click_on "Back"
    #Assert
    expect(current_path).to eq modes_path
  end
end