require 'test_helper'

class StudiesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end



  describe 'studies/_study.html.erb' do
  context 'when the study has a url' do
    it 'displays the url' do
      assign(:study, build(:study, url: 'http://example.com')

      render

      expect(rendered).to have_link 'study', href: 'http://example.com'
    end
  end

  context 'when the study url is nil' do
    it "displays 'None'" do
      assign(:study, build(:study, url: nil)

      render

      expect(rendered).to have_content 'None'
    end
  end
end

	test "should get index" do
    	get :index
    	assert_response :success
    	assert_not_nil assigns(:studies)
  	end

  	test "index should render correct template and layout" do
	  get :index
	  assert_template :index
	  assert_template layout: "layouts/studies"
	end

end














