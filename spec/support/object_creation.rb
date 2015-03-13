def create_user
  @user=User.create!(email: "user@example.com", password: "password", password_confirmation: "password")
end

def sign_in
  create_user
  visit sign_in_path
  fill_in :email, with: @user.email
  fill_in :password, with: @user.password
  click_on "Sign In"
end
