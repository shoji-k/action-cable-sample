require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @two = messages(:two)
  end

  def teardown
    @two = nil
  end

  test "save message" do
    message = Message.new({
      content: 'hey'
    })
    assert message.save
  end
  test "test fixture count" do
    messages = Message.all
    assert_equal 2, messages.count
  end

  test "test one fixture" do
    message = Message.find_by(content: 'MySecond')
    assert_equal @two, message
    assert_equal 'MySecond', message.content
  end
end
