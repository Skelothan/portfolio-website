require 'test_helper'

class TagProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_project = tag_projects(:one)
  end

  test "should get index" do
    get tag_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_project_url
    assert_response :success
  end

  test "should create tag_project" do
    assert_difference('TagProject.count') do
      post tag_projects_url, params: { tag_project: { project_id: @tag_project.project_id, tag_id: @tag_project.tag_id } }
    end

    assert_redirected_to tag_project_url(TagProject.last)
  end

  test "should show tag_project" do
    get tag_project_url(@tag_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_project_url(@tag_project)
    assert_response :success
  end

  test "should update tag_project" do
    patch tag_project_url(@tag_project), params: { tag_project: { project_id: @tag_project.project_id, tag_id: @tag_project.tag_id } }
    assert_redirected_to tag_project_url(@tag_project)
  end

  test "should destroy tag_project" do
    assert_difference('TagProject.count', -1) do
      delete tag_project_url(@tag_project)
    end

    assert_redirected_to tag_projects_url
  end
end
