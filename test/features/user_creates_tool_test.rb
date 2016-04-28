require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest

  test "User can create a tool" do
    visit new_tool_path

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "10"

    click_button "Create Tool"

    assert_equal tool_path(Tool.last), current_path

    within(".tool_info") do
      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
  end
end
