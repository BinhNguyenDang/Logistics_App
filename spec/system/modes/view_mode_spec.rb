require 'rails_helper'

describe "View modes" do 
  it "View modes" do 
    #Act 
    visit root_path
    click_on "Modes"
    #Assert
    expect(page).to have_current_path(modes_path)
  end
  it "Successfully" do 
    #Arrange 
    for i in 1..3
      Mode.create!(
        name: "Mode #{i}",
        min_distance: 1 * i,
        max_distance: 20 * i,
        min_weight: 1 * i,
        max_weight: 20 * i,
        fixed_fee: 5 * i,
        active: true
      )
    end
    #Act 
    visit root_path
    click_on "Modes"
    #Assert
    expect(page).to have_current_path(modes_path)
    within('table thead') do 
      expect(page).to have_content "Name"
      expect(page).to have_content "Minimum Distance (Km)"
      expect(page).to have_content "Maximum Distance (Km)"
      expect(page).to have_content "Status"
    end
    within('table tbody') do 
      expect(page).to have_content "Mode 1"
      expect(page).to have_content "Mode 2"
      expect(page).to have_content "Mode 3"
      expect(page).to have_content "1"
      expect(page).to have_content "2"
      expect(page).to have_content "3"
      expect(page).to have_content "20"
      expect(page).to have_content "40"
      expect(page).to have_content "60"
      
    end
  end
  it "no registered modes" do 
    #Act 
    visit root_path
    click_on "Modes"
    #Assert
    expect(page).to have_current_path(modes_path)
    expect(page).to have_content "No modes registered"
  end
end