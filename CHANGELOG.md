# Changelog

## Unreleased:

## 3.0.0:

### Added

- Add support for Rails version 5.2.x

### Removed

- Drop explicit support for ruby versions under 2.3.x
- Drop support for Rails versions under 5.0.x

## 2.1.0

### Added

- Relax version requirements to support Rails version 5.0.x

### Removed

- Drop explicit support for ruby versions under 2.1.0
- Drop support for Rails versions prior to 4.1.0

## 2.0.0

### Added

- Install the javascripts into vendor/assets

### Changed

- Remove deprecated should macros
- Switch to using `change` in generated Rails migrations
- Clean up the README and installation instructions
- Rename helper methods and view partials

## 1.4

### Removed

- Drop support for ruby 1.9.3
- Remove deprecated Rails method `link_to_function`

### Changed

- Reference the MIT license from the gemspec
- Update migration to avoid Rails deprecation warning about timestamps `null :false`
- Use ISO 8601 format when creating the Announcement cookie name

## 1.3

### Fixed

- Fix for ActiveRecord migration/generator error on Rails 4+.

## 1.2

### Added

- Rails 4 support.

## 1.1

### Added

- Support for the Rails asset pipeline.
- More clear installation instructions for both newer and older Rails.
- The Announcement body is attr_accessible.

## 1.0

### Added

- Support for Rails 3.2.3, 3.1.4, and 3.0.12.
- The announcement hiding cookie expires after a year.

### Fixed

- Fix the JavaScript that hides the announcements to work out of the box.
