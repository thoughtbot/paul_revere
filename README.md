# Paul Revere

[![Build Status](https://travis-ci.org/thoughtbot/paul_revere.svg?branch=master)](https://travis-ci.org/thoughtbot/paul_revere)

This gem enables the inclusion of "one off" announcements in Rails applications.

## Installation

First, include the gem as normal in your Gemfile:

    gem "paul_revere"

Then, run the generator to create the migration and copy the javascript.

    rails generate paul_revere

The announcements JS will be installed into vendor/assets/javascripts.
You can add the announcement JS to `app/assets/javascripts/application.js`:

    //= require announcements

This will include the javascript into the `application.js` for the entire site.

Finally, create the announcements table by running the migration:

    rake db:migrate

Copy built-in partials into your Rails application by running:

    rails generate paul_revere:views

## Background

Paul Revere provides...

* A model called `Announcement`, which has timestamps and a "body" text column.
* A `current` class method on `Announcement` which returns the latest
  `Announcement`, or a new unsaved instance.
* A view helper called `#current_announcement`, which will return that latest
  `Announcement` record.
* A view partial called `_public_announcement`, which is intended to be shown to
  all site users.
* A view partial called `_private_announcement`, which is intended to be shown
  only to logged in users.  Note that this merely wraps the rendering of the
  public announcement with a call to a helper which checks that a user is signed
  in. There is only one type of Announcement.
* A view partial called `_email_announcement`, which is intended to be used in
  site emails which are sent out and need to include announcements.

## Usage

* Install the gem, run the migration, ensure the javascript can be accessed.
* Use those partials in the correct places in your view code and mailer view
  code where you want announcements to show up.

For example, to include the latest announcement for all site users:

```
<%= render "announcements/public_announcement" %>
```

To make an announcement, use the Rails console to create a new record:

```
Announcement.create!(body: "Free ice cream on Monday!")
```

There is a helper method called `announcement_visibility_allowed?`, which is
what the `private_announcement` partial calls to determine whether to allow the
current session to view announcements.  The built-in implementation just checks
that `current_user` is truth-y. Override that helper method if you want to do
something more interesting as a check here.

## License

Paul Revere is Copyright © 2009 thoughtbot, inc. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.

<!-- START /templates/footer.md -->
## About thoughtbot

![thoughtbot](https://thoughtbot.com/thoughtbot-logo-for-readmes.svg)

This repo is maintained and funded by thoughtbot, inc.
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

We love open source software!
See [our other projects][community].
We are [available for hire][hire].

[community]: https://thoughtbot.com/community?utm_source=github
[hire]: https://thoughtbot.com/hire-us?utm_source=github


<!-- END /templates/footer.md -->
