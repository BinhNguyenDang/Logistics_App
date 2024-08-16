require 'rails_helper'

describe "Create Mode" do
  it "view page and form" do
    # Act
    visit root_path
    click_on 'Modes'
    click_on 'New Mode'
    # Assert
    expect(page).to have_content 'New Mode'
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Minimum Distance (Km)'
    expect(page).to have_field 'Maximum Distance (Km)'
    expect(page).to have_field 'Minimum Weight (Kg)'
    expect(page).to have_field 'Maximum Weight (Kg)'
    expect(page).to have_field 'Fixed Fee'
    expect(page).to have_field 'Status'
  end

  it "successfully" do
    # Act
    visit root_path
    click_on 'Modes'
    click_on 'New Mode'
    fill_in "Name",	with: "Mode 1"
    fill_in "Minimum Distance (Km)",	with: '1'
    fill_in "Maximum Distance (Km)",	with: '20'
    fill_in "Minimum Weight (Kg)",	with: '1'
    fill_in "Maximum Weight (Kg)",	with: '20'
    fill_in "Fixed Fee",	with: '5'
    check "Status"
    click_on 'Save'
    # Assert
    expect(page).to have_content 'Mode created successfully'  
    expect(page).to have_content 'Mode 1'
  end

  it "not empty fields" do
    # Act
    visit root_path
    click_on 'Modes'
    click_on 'New Mode'
    fill_in "Name",	with: ''
    fill_in "Minimum Distance (Km)",	with: ''
    fill_in "Maximum Distance (Km)",	with: ''
    fill_in "Minimum Weight (Kg)",	with: ''
    fill_in "Maximum Weight (Kg)",	with: ''
    fill_in "Fixed Fee",	with: ''
    check "Status"
    click_on 'Save'
    # Assert
    expect(page).to have_content 'Error creating mode'
    expect(page).to have_content 'Name can not be blank'
    expect(page).to have_content 'Minimum Distance can not be blank'
    expect(page).to have_content 'Maximum Distance can not be blank'
    expect(page).to have_content 'Minimum Weight can not be blank'
    expect(page).to have_content 'Maximum Weight can not be blank'
    expect(page).to have_content 'Fixed Fee can not be blank'
  end
end
