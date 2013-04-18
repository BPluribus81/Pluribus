require 'spec_helper'

describe "Home Page" do
  describe "Content" do
    it "should include the word Contact" do
      visit '/'
      page.should have_content("Contact")
    end
  end
end