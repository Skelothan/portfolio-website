require "application_system_test_case"

class UploadedFilesTest < ApplicationSystemTestCase
  setup do
    @uploaded_file = uploaded_files(:one)
  end

  test "visiting the index" do
    visit uploaded_files_url
    assert_selector "h1", text: "Uploaded Files"
  end

  test "creating a Uploaded file" do
    visit uploaded_files_url
    click_on "New Uploaded File"

    check "Active" if @uploaded_file.active
    fill_in "Media type", with: @uploaded_file.media_type
    fill_in "Name", with: @uploaded_file.name
    fill_in "Upload date", with: @uploaded_file.upload_date
    fill_in "Url", with: @uploaded_file.url
    click_on "Create Uploaded file"

    assert_text "Uploaded file was successfully created"
    click_on "Back"
  end

  test "updating a Uploaded file" do
    visit uploaded_files_url
    click_on "Edit", match: :first

    check "Active" if @uploaded_file.active
    fill_in "Media type", with: @uploaded_file.media_type
    fill_in "Name", with: @uploaded_file.name
    fill_in "Upload date", with: @uploaded_file.upload_date
    fill_in "Url", with: @uploaded_file.url
    click_on "Update Uploaded file"

    assert_text "Uploaded file was successfully updated"
    click_on "Back"
  end

  test "destroying a Uploaded file" do
    visit uploaded_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uploaded file was successfully destroyed"
  end
end
