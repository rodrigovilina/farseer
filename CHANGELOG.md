# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.8.0] - 2024-06-04
### Added
- `Farseer::Map` which is a parser with a callback to map the resulting token
    into something else.
- `Farseer::MapFactory` which adds `#map`, a factory method for new parsers with
    callbacks. It creates a new instance of `Farseer::Map`.
- Included `Farseer::MapFactory` into all parsers.


## [0.7.0] - 2024-06-04
### Added
- `Farseer::And` to run a sequence of parsers that must all succeed.
- `Farseer::Or` to try multiple parsers until one works.
- `Farseer::Word` to parse a keyword at the beginning of a string.
- `Farseer::Regexp` to parse a token using `regexp`.
- `mutant` development dependency for mutation testing.
- Achieve `100%` mutation test coverage.
- `byebug` development dependency for debugging.

### Removed
- All helper methods of `Farseer`.

### Changed
- Update development dependencies.


## [0.6.0] - 2024-06-03
### Added
- `Farseer::Opt`  to parse `0` to `1` times the wrapped parser. (`?`)
- `Farseer::Any`  to parse `0` to multiple times the wrapped parser. (`*`)
- `Farseer::Many` to parse `1` to multiple times the wrapped parser. (`+`)
- A couple of instances of `Farseer::Chars` as constants:
  - `Farseer::Chars::DIGITS` to parse digits from `0` to `9`.
  - `Farseer::Chars::BASIC_MATH_OP` to parse symbols `+`, `-`, `*`, `/`.
- Enabled more `Lint` `rubocop` rules.
- Enabled `Performance` `rubocop` rules.

### Changed
- Updated development dependencies


## [0.5.0] - 2024-06-03
### Added
- `Farseer::Char` as a single character parser.
- `Farseer::Chars` as a single character from set parser.
- Multiple instances of `Farseer::Char` as constants:
  - `Farseer::Char::L_PARENS` for `(`.
  - `Farseer::Char::R_PARENS` for `)`.
  - `Farseer::Char::PLUS`     for `+`.
  - `Farseer::Char::MINUS`    for `-`.
  - `Farseer::Char::STAR`     for `*`.
  - `Farseer::Char::SLASH`    for `/`.
- Enabled `Lint` `rubocop` rules.
- Enabled a couple more `Layout` `rubocop` rules.

### Changed
- Update `muina` version requirement to `~> 0.5`


## [0.4.0] - 2024-06-03
### Added
- `Farseer.any_char_parser` to parse a single character from a given set.
- `irb` development dependency.
- `.gitignore.local` symlink to `.git/info/exclude`.

### Changed
- Stop using `module_function` and change methods into singleton methods.
- Update `bundler` version.


## [0.3.0] - 2024-06-02
### Added
- `Farseer#ws_parser` to parse all leading whitespace.
- Multiple development dependencies:
  - `flay`, `flog`, `guard`, `guard-rspec`, `guard-rubocop`, `lefthook`, and
    `rubocop-performance` with corresponding `binstubs`.
  - `Guardfile` with `rspec` and `rubocop` guards.
  - `.lefthook.yml` including `pre-commit` and `pre-push` hooks, and `audit` and
    `full_audit` tasks.

### Changed
- Bump `muina` required version to `~> 0.4`.
- Enabled `Lint` `rubocop` department.


## [0.2.0] - 2024-06-02
### Added
- `Farseer::Result` to hold the result of succesful parses.
- `Farseer#char_parser` to parse a single specific character.
- `muina` as a dependency.
- `bin/console` to jump into `irb` with the project loaded.


## [0.1.0] - 2024-06-02
### Added
- Initial gem relase.
- Set up code quality dependencies:
  - `rake`:      for running common tasks.
  - `rubocop`:   for linting.
  - `rspec`:     for testing.
  - `simplecov`: for code coverage.
- License the project with `The Unlicense`.
- `Rakefile` with `gem`, `rubocop`, and `rspec` tasks.
- `SECURITY.md` to keep track of maintained versions.
- `Farseer::VERSION`: Keep the gem version in a constant.
- `.ruby-version` for rbenv, with version `3.2.2`
- This `CHANGELOG.md`
