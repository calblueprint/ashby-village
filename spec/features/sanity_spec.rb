require "rails_helper"

RSpec.describe "The app works" do
  describe "if the home page" do
    before { visit root_path }

    it "works" do
      expect(page).to have_content "What you'll be able to do on Ashby Village Square"
    end
  end
end
