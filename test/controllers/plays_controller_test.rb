require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plays_index_url
    assert_response :success
  end

  test "should get new" do
    get plays_new_url
    assert_response :success
  end

  test "should get edit" do
    get plays_edit_url
    assert_response :success
  end

  test "should get show" do
    get plays_show_url
    assert_response :success
  end

  test "should get _form" do
    get plays__form_url
    assert_response :success
  end

end
