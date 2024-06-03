# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
