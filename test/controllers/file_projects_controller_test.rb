require 'test_helper'

class FileProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_project = file_projects(:one)
  end

  test "should get index" do
    get file_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_file_project_url
    assert_response :success
  end

  test "should create file_project" do
    assert_difference('FileProject.count') do
      post file_projects_url, params: { file_project: { file_id: @file_project.file_id, project_id: @file_project.project_id } }
    end

    assert_redirected_to file_project_url(FileProject.last)
  end

  test "should show file_project" do
    get file_project_url(@file_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_project_url(@file_project)
    assert_response :success
  end

  test "should update file_project" do
    patch file_project_url(@file_project), params: { file_project: { file_id: @file_project.file_id, project_id: @file_project.project_id } }
    assert_redirected_to file_project_url(@file_project)
  end

  test "should destroy file_project" do
    assert_difference('FileProject.count', -1) do
      delete file_project_url(@file_project)
    end

    assert_redirected_to file_projects_url
  end
end
