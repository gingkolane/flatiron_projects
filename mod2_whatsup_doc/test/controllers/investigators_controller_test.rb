require 'test_helper'

class InvestigatorsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
   test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investigators)
  end

  test "index should render correct template and layout" do
	  get :index
	  assert_template :index
	  assert_template layout: "layouts/investigators"
	end
end
