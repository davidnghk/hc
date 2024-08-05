require 'test_helper'

class FixesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fix = fixes(:one)
  end

  test "should get index" do
    get fixes_url
    assert_response :success
  end

  test "should get new" do
    get new_fix_url
    assert_response :success
  end

  test "should create fix" do
    assert_difference('Fix.count') do
      post fixes_url, params: { fix: { chi_name: @fix.chi_name, code: @fix.code, is_active?: @fix.is_active?, name: @fix.name, type: @fix.type } }
    end

    assert_redirected_to fix_url(Fix.last)
  end

  test "should show fix" do
    get fix_url(@fix)
    assert_response :success
  end

  test "should get edit" do
    get edit_fix_url(@fix)
    assert_response :success
  end

  test "should update fix" do
    patch fix_url(@fix), params: { fix: { chi_name: @fix.chi_name, code: @fix.code, is_active?: @fix.is_active?, name: @fix.name, type: @fix.type } }
    assert_redirected_to fix_url(@fix)
  end

  test "should destroy fix" do
    assert_difference('Fix.count', -1) do
      delete fix_url(@fix)
    end

    assert_redirected_to fixes_url
  end
end
