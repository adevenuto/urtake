require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "user comment creation" do
    user = FactoryGirl.create(:user)
    sign_in user
    place = FactoryGirl.create(:place)
    post :create, :place_id => place.id, :comment => {
      :message => 'Good grief',
      :rating => '5_star',
      :user_id => user.id
    }
    assert_redirected_to place_path(place)
    assert_equal 1, place.comments.count

  end
end
