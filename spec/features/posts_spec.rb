require 'rails_helper'

feature "Posts" do

  before do
    create_user
  end


  scenario 'User can make new post' do
    sign_in
    visit new_user_post_path(@user.id)
    expect(page).to have_content("New Post")
    fill_in :content, with: "Hello everybody, this is a post"
    click_on "Create Post"
    expect(current_path).to eq (user_posts_path(@user.id))
    expect(page).to have_content("List of User Posts")
    expect(page).to have_content("Hello everybody, this is a post")
  end

end
