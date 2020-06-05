require "application_system_test_case"

class FileProjectsTest < ApplicationSystemTestCase
  setup do
    @file_project = file_projects(:one)
  end

  test "visiting the index" do
    visit file_projects_url
    assert_selector "h1", text: "File Projects"
  end

  test "creating a File project" do
    visit file_projects_url
    click_on "New File Project"

    fill_in "File", with: @file_project.file_id
    fill_in "Project", with: @file_project.project_id
    click_on "Create File project"

    assert_text "File project was successfully created"
    click_on "Back"
  end

  test "updating a File project" do
    visit file_projects_url
    click_on "Edit", match: :first

    fill_in "File", with: @file_project.file_id
    fill_in "Project", with: @file_project.project_id
    click_on "Update File project"

    assert_text "File project was successfully updated"
    click_on "Back"
  end

  test "destroying a File project" do
    visit file_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "File project was successfully destroyed"
  end
end
