require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
 test "invalide signup information" do
   get signup_path
   assert_select 'form[action="/signup"]'
   assert_no_difference 'User.count' do
     post users_path, params: {
            user:{
                name:                 "",
                email:                "user@email.com",
                password:             "fooo",
                password_cofirmation: "bar" }
     }
   end
   assert_template 'users/new'
   assert_select 'div#error_explanation'
   assert_select 'div.alert'
 end

  test "valide signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_difference 'User.count', 1 do
      post users_path, params:{
          user: {
              name:                   "Vasyu Pupkin",
              email:                  "pupkin@tohen.com",
              password:               "foobar",
              password_confirmation:  "foobar"
          }
      }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
end
