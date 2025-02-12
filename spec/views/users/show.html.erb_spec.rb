require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "Name",
      username: "Username",
      email: "email@test.com",
      password: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/email@test.com/)
    expect(rendered).to match(/Password/)
  end
end
