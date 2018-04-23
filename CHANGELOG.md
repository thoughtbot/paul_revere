# Changelog

## Unreleased:

* Drop explicit support for ruby versions under 2.3.x
* Drop support for Rails versions under 5.0.x
* Add support for Rails version 5.2.x

## 2.1.0

* Drop explicit support for ruby versions under 2.1.0
* Drop support for Rails versions prior to 4.1.0
* Relax version requirements to support Rails version 5.0.x

## 2.0.0

* Remove deprecated should macros
* Switch to using `change` in generated Rails migrations
* Clean up the README and installation instructions
* Install the javascripts into vendor/assets
* Rename helper methods and view partials

## 1.4

* Reference the MIT license from the gemspec
* Update migration to avoid Rails deprecation warning about timestamps `null :false`
* Drop support for ruby 1.9.3
* Remove deprecated Rails method `link_to_function`
* Use ISO 8601 format when creating the Announcement cookie name

## 1.3

* Fix for ActiveRecord migration/generator error on Rails 4+.

## 1.2

* Rails 4 support.

## 1.1

* Support for the asset pipeline.
* More clear installation instructions for both newer and older Rails.
* The Announcement body is attr_accessible.

## 1.0

* Support for Rails 3.2.3, 3.1.4, and 3.0.12.
* Fix the JavaScript that hides the announcements to work out of the box.
* The announcement hiding cookie expires after a year.
