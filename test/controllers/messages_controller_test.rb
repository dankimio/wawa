require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
    sign_in_user
  end

  test "should create message" do
    assert_difference("Message.count") do
      post room_messages_url(@message.room), params: { message: { body: @message.body } }
    end

    assert_response :no_content
  end
end
