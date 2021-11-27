require "application_system_test_case"

class ComplainsTest < ApplicationSystemTestCase
  setup do
    @complain = complains(:one)
  end

  test "visiting the index" do
    visit complains_url
    assert_selector "h1", text: "Complains"
  end

  test "creating a Complain" do
    visit complains_url
    click_on "New Complain"

    fill_in "Content", with: @complain.content
    fill_in "End date", with: @complain.end_date
    fill_in "Location", with: @complain.location
    check "Resolve" if @complain.resolve
    fill_in "Start date", with: @complain.start_date
    fill_in "Title", with: @complain.title
    fill_in "User", with: @complain.user_id
    click_on "Create Complain"

    assert_text "Complain was successfully created"
    click_on "Back"
  end

  test "updating a Complain" do
    visit complains_url
    click_on "Edit", match: :first

    fill_in "Content", with: @complain.content
    fill_in "End date", with: @complain.end_date
    fill_in "Location", with: @complain.location
    check "Resolve" if @complain.resolve
    fill_in "Start date", with: @complain.start_date
    fill_in "Title", with: @complain.title
    fill_in "User", with: @complain.user_id
    click_on "Update Complain"

    assert_text "Complain was successfully updated"
    click_on "Back"
  end

  test "destroying a Complain" do
    visit complains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Complain was successfully destroyed"
  end
end
