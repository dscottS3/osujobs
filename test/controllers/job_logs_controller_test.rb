require 'test_helper'

class JobLogsControllerTest < ActionController::TestCase
  setup do
    @job_log = job_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_log" do
    assert_difference('JobLog.count') do
      post :create, job_log: {  }
    end

    assert_redirected_to job_log_path(assigns(:job_log))
  end

  test "should show job_log" do
    get :show, id: @job_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_log
    assert_response :success
  end

  test "should update job_log" do
    patch :update, id: @job_log, job_log: {  }
    assert_redirected_to job_log_path(assigns(:job_log))
  end

  test "should destroy job_log" do
    assert_difference('JobLog.count', -1) do
      delete :destroy, id: @job_log
    end

    assert_redirected_to job_logs_path
  end
end
