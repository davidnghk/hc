require "application_system_test_case"

class FixesTest < ApplicationSystemTestCase
  setup do
    @fix = fixes(:one)
  end

  test "visiting the index" do
    visit fixes_url
    assert_selector "h1", text: "Fixes"
  end

  test "creating a Fix" do
    visit fixes_url
    click_on "New Fix"

    fill_in "Chi Name", with: @fix.chi_name
    fill_in "Code", with: @fix.code
    fill_in "Is Active?", with: @fix.is_active?
    fill_in "Name", with: @fix.name
    fill_in "Type", with: @fix.type
    click_on "Create Fix"

    assert_text "Fix was successfully created"
    click_on "Back"
  end

  test "updating a Fix" do
    visit fixes_url
    click_on "Edit", match: :first

    fill_in "Chi Name", with: @fix.chi_name
    fill_in "Code", with: @fix.code
    fill_in "Is Active?", with: @fix.is_active?
    fill_in "Name", with: @fix.name
    fill_in "Type", with: @fix.type
    click_on "Update Fix"

    assert_text "Fix was successfully updated"
    click_on "Back"
  end

  test "destroying a Fix" do
    visit fixes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fix was successfully destroyed"
  end
end
