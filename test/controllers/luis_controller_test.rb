require 'test_helper'

class LuisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lui = luis(:one)
  end

  test "should get index" do
    get luis_url
    assert_response :success
  end

  test "should get new" do
    get new_lui_url
    assert_response :success
  end

  test "should create lui" do
    assert_difference('Lui.count') do
      post luis_url, params: { lui: { description: @lui.description } }
    end

    assert_redirected_to lui_url(Lui.last)
  end

  test "should show lui" do
    get lui_url(@lui)
    assert_response :success
  end

  test "should get edit" do
    get edit_lui_url(@lui)
    assert_response :success
  end

  test "should update lui" do
    patch lui_url(@lui), params: { lui: { description: @lui.description } }
    assert_redirected_to lui_url(@lui)
  end

  test "should destroy lui" do
    assert_difference('Lui.count', -1) do
      delete lui_url(@lui)
    end

    assert_redirected_to luis_url
  end
end
