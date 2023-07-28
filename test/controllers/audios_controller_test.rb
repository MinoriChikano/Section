require "test_helper"

class AudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get audios_index_url
    assert_response :success
  end

  test "should get new" do
    get audios_new_url
    assert_response :success
  end

  test "should get show" do
    get audios_show_url
    assert_response :success
  end

  test "should get edit" do
    get audios_edit_url
    assert_response :success
  end
end
