require "test_helper"

class RoomUserTest < ActiveSupport::TestCase
  def setup
    @room_user = room_users(:one)
  end

  test "should be valid" do
    assert @room_user.valid?
  end

  test "should be unique" do
    duplicate_room_user = @room_user.dup
    @room_user.save
    assert_not duplicate_room_user.valid?
  end
end
