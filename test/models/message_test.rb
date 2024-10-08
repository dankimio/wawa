require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = messages(:one)
  end

  test "should be valid" do
    assert @message.valid?
  end

  test "content should be present" do
    @message.body = " "
    assert_not @message.valid?
  end
end
