require "application_system_test_case"

class Admin::PeopleTest < ApplicationSystemTestCase
  setup do
    @admin_person = admin_people(:one)
  end

  test "visiting the index" do
    visit admin_people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit admin_people_url
    click_on "New person"

    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit admin_person_url(@admin_person)
    click_on "Edit this person", match: :first

    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit admin_person_url(@admin_person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
