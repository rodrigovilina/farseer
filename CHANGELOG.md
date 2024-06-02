# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2024-06-02

### Added
- `Farseer::Result` to hold the result of succesful parses.
- `Farseer#char_parser` to parse a single specific character.
- `muina` as a dependency.
- `bin/console` to jump into `irb` with the project loaded.

### Changed

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
