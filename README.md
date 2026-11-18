# telegram-bot-ruby-rbs

RBS signatures for [`telegram-bot-ruby`](https://github.com/atipugin/telegram-bot-ruby), generated from the wrapper's real Ruby surface and checked against the [official Telegram Bot API](https://core.telegram.org/bots/api).

Version `0.2.x` targets `telegram-bot-ruby >= 2.8.1, < 2.9`. The current normalized documentation snapshot is Telegram Bot API 10.4.

## Installation

Add both gems to your bundle:

```ruby
gem "telegram-bot-ruby", "~> 2.8.1"
gem "telegram-bot-ruby-rbs", "~> 0.2.0", require: false
```

RBS, Steep and compatible editors discover the `.rbs` files from the installed gem's `sig/` directory. This gem adds no runtime behavior.

## What is covered

- every concrete `Telegram::Bot::Types` class and every Dry::Struct-generated reader;
- typed constructors, including required and optional attributes;
- every endpoint accepted by `Telegram::Bot::Api#method_missing`, in snake_case and Telegram camelCase forms;
- `Client`, `Api`, configuration, exceptions and helper modules;
- union constants represented as RBS type aliases.

Telegram's official API can move ahead of the wrapper. `data/compatibility.yml` records methods, types and fields present in the official documentation but not yet implemented by `telegram-bot-ruby`; signatures deliberately do not promise missing runtime constants or response conversions.

## Development

```sh
bundle install
bundle exec rake update_api  # fetch and normalize the official documentation
bundle exec rake generate    # regenerate sig/ and the compatibility report
bundle exec rake test        # fast deterministic tests
bundle exec rake             # tests, 100% generator coverage, and rbs validate
bundle exec rake build
```

The generated files are committed so consumers never need network access or generator dependencies.

The coverage gate measures the generator's lines, branches and methods. The shipped gem contains RBS declarations and no Ruby runtime code; its declarations are checked exhaustively against the wrapper and validated by RBS. Refreshing the official snapshot requires network access and runs only through the explicit `update_api` task.

## License

MIT. Telegram Bot API names and facts are sourced from Telegram's official documentation; `telegram-bot-ruby` remains under its own license.
