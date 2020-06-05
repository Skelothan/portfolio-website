require "application_system_test_case"

class TagProjectsTest < ApplicationSystemTestCase
  setup do
    @tag_project = tag_projects(:one)
  end

  test "visiting the index" do
    visit tag_projects_url
    assert_selector "h1", text: "Tag Projects"
  end

  test "creating a Tag project" do
    visit tag_projects_url
    click_on "New Tag Project"

    fill_in "Project", with: @tag_project.project_id
    fill_in "Tag", with: @tag_project.tag_id
    click_on "Create Tag project"

    assert_text "Tag project was successfully created"
    click_on "Back"
  end

  test "updating a Tag project" do
    visit tag_projects_url
    click_on "Edit", match: :first

    fill_in "Project", with: @tag_project.project_id
    fill_in "Tag", with: @tag_project.tag_id
    click_on "Update Tag project"

    assert_text "Tag project was successfully updated"
    click_on "Back"
  end

  test "destroying a Tag project" do
    visit tag_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag project was successfully destroyed"
  end
end
