require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit people_url
    click_on "New person"

    check "Admin" if @person.admin
    fill_in "Born at", with: @person.born_at
    fill_in "Name", with: @person.name
    fill_in "Password", with: @person.password
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit this person", match: :first

    check "Admin" if @person.admin
    fill_in "Born at", with: @person.born_at
    fill_in "Name", with: @person.name
    fill_in "Password", with: @person.password
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
