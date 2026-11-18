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

  it "constructs the recursive rich text supported by version 2.8" do
    text = Telegram::Bot::Types::RichTextBold.new(text: ["hello", { type: "italic", text: "world" }])
    block = Telegram::Bot::Types::InputRichBlockBlockQuotation.new(
      blocks: [{ type: "paragraph", text: text.to_h }]
    )

    _(block.blocks.first).must_be_kind_of(Telegram::Bot::Types::InputRichBlockParagraph)
    _(block.blocks.first.text).must_be_kind_of(Telegram::Bot::Types::RichTextBold)
    _(block.blocks.first.text.text.last).must_be_kind_of(Telegram::Bot::Types::RichTextItalic)
  end
end
