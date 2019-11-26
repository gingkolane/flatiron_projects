require 'test_helper'

class ConditionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

   test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conditions)
  end

  test "index should render correct template and layout" do
	  get :index
	  assert_template :index
	  assert_template layout: "layouts/conditions"
	end
end


