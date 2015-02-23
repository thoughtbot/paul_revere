New in 1.4:

* Reference the MIT license from the gemspec
* Update migration to avoid Rails deprecation warning about timestamps `null :false`
* Drop support for ruby 1.9.3
* Remove deprecated Rails method `link_to_function`
* Use ISO 8601 format when creating the Announcement cookie name

New in 1.3:

* Fix for ActiveRecord migration/generator error on Rails 4+.

New in 1.2:

* Rails 4 support.

New in 1.1:

* Support for the asset pipeline.
* More clear installation instructions for both newer and older Rails.
* The Announcement body is attr_accessible.

New in 1.0:

* Support for Rails 3.2.3, 3.1.4, and 3.0.12.
* Fix the JavaScript that hides the announcements to work out of the box.
* The announcement hiding cookie expires after a year.
