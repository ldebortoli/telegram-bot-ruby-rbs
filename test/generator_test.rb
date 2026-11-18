# frozen_string_literal: true

require_relative "test_helper"
load File.expand_path("../script/generate", __dir__)

describe "signature generation for telegram-bot-ruby 2.8" do
  it "resolves deferred recursive unions without embedding Ruby expressions" do
    _(source_type("Types::Array.of(Types.deferred(:InputRichBlock))", ALIASES)).must_equal("Array[input_rich_block]")
    _(source_type("Types.deferred(:InputRichBlock)", ALIASES, namespace: true)).must_equal("Types::input_rich_block")
    signature = File.read(File.join(SIG_ROOT, "types/input_rich_block_block_quotation.rbs"))
    _(signature).must_include("blocks: Array[input_rich_block]")
    _(signature).wont_include("deferred")
    unions = File.read(File.join(SIG_ROOT, "types/unions.rbs"))
    _(unions).must_include("type rich_text = String | Array[rich_text] | RichTextBold")
  end

  it "preserves optional nested unions and primitive types" do
    _(source_type("(Types::String | Types::Integer).optional", {})).must_equal("(String | Integer)?")
    _(source_type("Types::String | Types::Integer", {})).must_equal("(String | Integer)")
    _(source_type("Types::String.optional", {})).must_equal("String?")
    _(source_type("Types::True", {})).must_equal("true")
    _(source_type("Types::Float", {})).must_equal("Float")
    _(source_type("Types::User", {}, namespace: true)).must_equal("Types::User")
    _(source_type("Types::RichText", ALIASES, namespace: true)).must_equal("Types::rich_text")
    _(source_type("Types::RichText", ALIASES)).must_equal("rich_text")
    _(source_type("Types::User", ALIASES)).must_equal("User")
    _(source_type("User", ALIASES, namespace: true)).must_equal("Types::User")
    _(nilable("String | Integer")).must_equal("(String | Integer)?")
    _(nilable("String")).must_equal("String?")
  end

  it "translates documented arrays, alternatives and unknown types conservatively" do
    _(doc_type("", ALIASES)).must_equal("untyped")
    _(doc_type("???", ALIASES)).must_equal("untyped")
    _(doc_type("unknown", ALIASES)).must_equal("untyped")
    _(doc_type("MissingType", ALIASES)).must_equal("untyped")
    _(doc_type("Array of String", ALIASES)).must_equal("Array[String]")
    _(doc_type("Array of String or Integer", ALIASES)).must_equal("Array[(String | Integer)]")
    _(doc_type("String or Integer", ALIASES)).must_equal("String | Integer")
    _(doc_type("RichText", ALIASES, namespace: false)).must_equal("rich_text")
    _(doc_type("RichText", ALIASES)).must_equal("Types::rich_text")
    _(doc_type("User", ALIASES, namespace: false)).must_equal("User")
    _(doc_type("User", ALIASES)).must_equal("Types::User")
  end

  it "rejects an endpoint source whose declaration disappeared" do
    File.stub(:read, "unrecognized source") do
      _(proc { endpoints }).must_raise(RuntimeError)
    end
  end

  it "does not invent members for an empty union declaration" do
    Dir.stub(:[], ["fixture.rb"]) do
      File.stub(:read, "EmptyUnion = (\n)\n") do
        _(wrapper_unions).must_be_empty
      end
    end
  end

  it "retains the complete generated output across a second generation" do
    files = Dir[File.join(SIG_ROOT, "**/*.rbs")].sort
    before = files.to_h { |path| [path, File.binread(path)] }
    output = IO.popen([RbConfig.ruby, File.join(ROOT, "script/generate")], &:read)
    _($?.success?).must_equal(true)
    _(output).must_include("363 concrete types, 26 unions and 184 endpoints")
    after = Dir[File.join(SIG_ROOT, "**/*.rbs")].sort.to_h { |path| [path, File.binread(path)] }
    _(after).must_equal(before)
  end
end
