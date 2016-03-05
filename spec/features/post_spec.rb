require "rails_helper"

RSpec.describe "Write post" do
  # Helpers for this spec
  def fill_in_form
    post = build :post

    # fill_in "post_title", with: post.title
    # fill_in "post_content", with: post.content
    [:title, :content].each do |attribute|
      fill_in "post[#{attribute}]", with: post.send(attribute)
    end
  end

  def submit_form
    click_button("Post New Topic")
  end

  let!(:user) { create :user }
  # let! will make it not lazy
  let!(:group) { create :group }

  def join_group
    click_link("Join Group")
  end

  before do
    visit new_user_session_path
    fill_in "user_email", with: user.email, match: :first
    fill_in "user_password", with: user.password, match: :first
    click_button "Login", match: :first
    visit group_path(group)
  end

  # describe "logged in" do
  #   it "on group page" do
  #     expect(page).to have_content group.name
  #   end
  # end

  describe "on group page" do
    it "renders bulletin board" do
      expect(page).to have_content "Bulletin Board"
      expect(page).to have_content group.name
    end
  end

  # pending means test is not ready to run; change to describe when ready
  describe "without being a member" do
    it "post form can't render" do
      expect(page).not_to have_content "Write a Post"
      expect(page).not_to have_content "Write your reply here..."
    end
  end

  describe "while being a member" do
    it "shows post form" do
      join_group
      expect(page).to have_content "Write a Post"
    end

    it "does not allow empty form submit" do
      join_group
      expect { submit_form }.to change { Post.count }.by(0)
    end

    it "creates a post on submit" do
      join_group
      fill_in_form
      expect { submit_form }.to change { Post.count }.by(1)
    end
  end
end
