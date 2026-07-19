# frozen_string_literal: true

require_relative "test_helper"

describe "telegram-bot-ruby runtime assumptions" do
  it "constructs a documented type with generated readers" do
    user = Telegram::Bot::Types::User.new(id: 1, is_bot: false, first_name: "Ada")

    _(user.id).must_equal(1)
    _(user.username).must_be_nil
  end

  it "recognizes snake_case and camelCase endpoint names without a request" do
    api = Telegram::Bot::Api.new("test-token")

    _(api.respond_to?(:send_message)).must_equal(true)
    _(api.respond_to?(:sendMessage)).must_equal(true)
  end
end
