require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { description: @project.description, name: @project.name, user_id: @project.user_id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { description: @project.description, name: @project.name, user_id: @project.user_id }
    assert_redirected_to project_path(assigns(:project))
  end

  test "projects with sales should not be destroyed" do
    assert_difference('Project.count', 0) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end

  test "projects without sales should be destroyed" do
    assert_difference('Project.count', -1) do
      @project.sales = []
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end


end
