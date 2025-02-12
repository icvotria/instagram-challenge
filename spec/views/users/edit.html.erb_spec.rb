require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "name",
      username: "username",
      email: "email@test.com",
      password: "password"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password]"
    end
  end
end
