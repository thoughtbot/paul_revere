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

## Background

Paul Revere provides...

* A model called `Announcement`, which has nothing more than timestamps and a
  "body" column (text column).
* A `current` class method on `Announcement` which returns the latest
  `Announcement`, or an unsaved new instance.
* A view helper called `#current_announcement`, which will return that latest
  `Announcement` record.
* A view partial called `_announcement_for_all`, which is intended to be shown
  to all site users.
* A view partial called `_announcement`, which is intended to be shown only to
  logged in users.
* A view partial called `_email_announcement`, which is intended to be used in
  site emails which are sent out and need to include announcements.

## Usage

* Install the gem, run the migration, ensure the javascript can be accessed.
* Use those partials in the correct places in your view code and mailer view
  code where you want announcements to show up.

For example, to include the latest announcement for all site users:

```
<%= render "announcements/announcement_for_all" %>
```

To make an announcement, use the Rails console to create a new record:

```
Announcement.create!(body: "Free ice cream on Monday!")
```

## Credits

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Paul Revere is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community)

Thank you to all [the contributors](https://github.com/thoughtbot/paul_revere/contributors)!

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

## License

Paul Revere is Copyright © 2009 thoughtbot, inc. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.
