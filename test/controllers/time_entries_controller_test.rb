require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase
  setup do
    @time_entry = time_entries(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index, id: users(:one).id
    assert_response :success
    assert_not_nil assigns(:time_entries)
  end

  test "clock_in should start a new time_entry" do
    project = projects(:one)
    assert_difference('TimeEntry.count') do
      post :clock_in, time_entry: {project_id: project.id}
    end

    assert TimeEntry.where('project_id = ?', project.id).last.stop_time == nil
    assert_redirected_to project_path(project.id)
  end

  test "clock_out should complete the time entry for that project" do
    project = projects(:one)

    post :clock_in, time_entry: {project_id: project.id}

    post :clock_in, time_entry: {project_id: projects(:two).id}

    patch :clock_out, time_entry: {project_id: project.id}

    assert TimeEntry.where('project_id = ?', project.id).last.stop_time != nil

    assert_redirected_to project_path(project.id)
  end

  test "can't clock out without clocking in first" do
    project = projects(:one)

    post :clock_in, time_entry: {project_id: project.id}
    patch :clock_out, time_entry: {project_id: project.id}

    last_entry = TimeEntry.where('project_id = ?', project.id).last

    patch :clock_out, time_entry: {project_id: project.id}

    assert_redirected_to project_path(project.id)
    assert last_entry.stop_time == TimeEntry.where('project_id = ?', project.id).last.stop_time
  end

  test "should show time_entry" do
    get :show, id: @time_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_entry
    assert_response :success
  end

  test "should update time_entry" do
    patch :update, id: @time_entry, time_entry: { date: @time_entry.date, project_id: @time_entry.project_id, start_time: @time_entry.start_time, stop_time: @time_entry.stop_time }
    assert_redirected_to time_entry_path(assigns(:time_entry))
  end

  test "should destroy time_entry" do
    project_id = @time_entry.project_id
    assert_difference('TimeEntry.count', -1) do
      delete :destroy, id: @time_entry
    end

    assert_redirected_to time_entries_path(id: project_id)
  end
end
