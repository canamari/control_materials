require "application_system_test_case"

class MaterialLogsTest < ApplicationSystemTestCase
  setup do
    @material_log = material_logs(:one)
  end

  test "visiting the index" do
    visit material_logs_url
    assert_selector "h1", text: "Material logs"
  end

  test "should create material log" do
    visit material_logs_url
    click_on "New material log"

    click_on "Create Material log"

    assert_text "Material log was successfully created"
    click_on "Back"
  end

  test "should update Material log" do
    visit material_log_url(@material_log)
    click_on "Edit this material log", match: :first

    click_on "Update Material log"

    assert_text "Material log was successfully updated"
    click_on "Back"
  end

  test "should destroy Material log" do
    visit material_log_url(@material_log)
    click_on "Destroy this material log", match: :first

    assert_text "Material log was successfully destroyed"
  end
end
