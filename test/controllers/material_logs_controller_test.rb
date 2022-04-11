require "test_helper"

class MaterialLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_log = material_logs(:one)
  end

  test "should get index" do
    get material_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_material_log_url
    assert_response :success
  end

  test "should create material_log" do
    assert_difference("MaterialLog.count") do
      post material_logs_url, params: { material_log: {  } }
    end

    assert_redirected_to material_log_url(MaterialLog.last)
  end

  test "should show material_log" do
    get material_log_url(@material_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_log_url(@material_log)
    assert_response :success
  end

  test "should update material_log" do
    patch material_log_url(@material_log), params: { material_log: {  } }
    assert_redirected_to material_log_url(@material_log)
  end

  test "should destroy material_log" do
    assert_difference("MaterialLog.count", -1) do
      delete material_log_url(@material_log)
    end

    assert_redirected_to material_logs_url
  end
end
