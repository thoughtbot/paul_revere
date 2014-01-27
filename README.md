Paul Revere
===========

[![Build Status](https://secure.travis-ci.org/thoughtbot/paul_revere.png?branch=master)](http://travis-ci.org/thoughtbot/paul_revere)

Simple announcement plugin to include "one off" style announcements in Rails web apps.

[![Paul Revere's
Ride](http://f.cl.ly/items/2u260D0Y2j2T3O3o4017/Screen%20Shot%202013-01-23%20at%2010.46.06%20AM.png)](http://poetry.eserver.org/paul-revere.html)

Install with the asset pipeline (Rails 3.1+, asset pipeline enabled)
--------------------------------------------------------------------

Install as normal in your Gemfile:

    gem 'paul_revere'

Run the generator to create the migration:

    rails generate paul_revere

Add the announcement JS to `app/assets/javascripts/application.js`:

    //= require announcements

Run the migration:

    rake db:migrate && rake db:migrate:redo

Install without the asset pipeline (Rails 3.0 or asset pipeline disabled)
---------------------------------------------------------------------------

Install as normal in your Gemfile:

    gem 'paul_revere'

Run the generator to create the migration and copy the JavaScript file into public:

    rails generate paul_revere

Add the announcement JS to your layout, such as `app/views/layouts/application.html.erb`:

    <%= javascript_include_tag 'announcements' %>

Run the migration:

    rake db:migrate && rake db:migrate:redo

Usage
-----

Paul Revere provides...

* A model called `Announcement`, which has nothing more than timestamps and a "body" column (text column).  We view the most recent `Announcement` as the "current" announcement, and will select that to show on the site.
* A helper called `#current_announcement`, which will return that latest `Announcement` record.
* A view partial called `_announcement_for_all`, which is intended to be shown to all site users.
* A view partial called `_announcement`, which is intended to be shown only to logged in users.
* A view partial called `_email_announcement`, which is intended to be used in site emails which are sent out.

So the flow would be...

* Install the gem
* Use those partials in the correct places in your view code and mailer view code where you want announcements to show up:

        <%= render 'announcements/announcement_for_all' %>

* When you want to make an announcement, use the Rails console to create a new `Announcement` record:

        Announcement.create!(body: 'This Web site is shutting down because you refuse to pay')

Credits
-------

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Paul Revere is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community)

Thank you to all [the contributors](https://github.com/thoughtbot/paul_revere/contributors)!

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

Paul Revere is Copyright © 2009-2014 thoughtbot. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
