require "test_helper"

class RoomTest < ActiveSupport::TestCase
  def setup
    @room = rooms(:one)
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "name should be present" do
    @room.name = " "
    assert_not @room.valid?
  end
end
