require "application_system_test_case"

class EquationsTest < ApplicationSystemTestCase
  setup do
    @equation = equations(:one)
  end

  test "visiting the index" do
    visit equations_url
    assert_selector "h1", text: "Equations"
  end

  test "creating a Equation" do
    visit equations_url
    click_on "New Equation"

    fill_in "Root1", with: @equation.root1
    fill_in "Root2", with: @equation.root2
    click_on "Create Equation"

    assert_text "Equation was successfully created"
    click_on "Back"
  end

  test "updating a Equation" do
    visit equations_url
    click_on "Edit", match: :first

    fill_in "Root1", with: @equation.root1
    fill_in "Root2", with: @equation.root2
    click_on "Update Equation"

    assert_text "Equation was successfully updated"
    click_on "Back"
  end

  test "destroying a Equation" do
    visit equations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equation was successfully destroyed"
  end
end
