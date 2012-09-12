Paul Revere
===========

[![Build Status](https://secure.travis-ci.org/thoughtbot/paul_revere.png?branch=master)](http://travis-ci.org/thoughtbot/paul_revere)


Simple announcement plugin to include "one off" style announcements in Rails web apps.

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

Beastie Boys Lyrics
-------------------

Now here's a little story I've got to tell  
About three bad brothers you know so well  
It started way back in history  
With Adrock, M.C.A., and me - Mike D.  
Been had a little horsy named Paul Revere  
Just me and my horsy and a quart of beer  
Riding across the land, kicking up sand  
Sheriff's posse on my tail cause I'm in demand  
One lonely Beastie I be  
All by myself without nobody  
The sun is beating down on my baseball hat  
The air is gettin' hot the beer is getting flat  
Lookin' for a girl I ran into a guy  
His name is M.C.A., I said, "Howdy" he said, "Hi"

He told a little story that sounded well rehearsed  
Four days on the run and that he's dying of thirst  
The brew was in my hand and he was on my tip  
His voice was hoarse, his throat was dry he asked me for a sip  
He said, "Can I get some?"  
I said, "You can't get none!"  
Had a chance to run  
He pulled out his shotgun  
He was quick on the draw I thought I'd be dead  
He put the gun to my head and this is what he said,

"Now my name is M.C.A. I've got a license to kill  
I think you know what time it is it's time to get ill  
Now what do we have here an outlaw and his beer  
I run this land, you understand I make myself clear."  
We stepped into the wind he had a gun, I had a grin  
You think this story's over but it's ready to begin

"Now I got the gun you got the brew  
You got two choices of what you can do  
It's not a tough decision as you can see  
I can blow you away or you can ride with me"  
I said, I'll ride with you if you can get me to the border  
The sheriff's after me for what I did to his daughter  
I did it like this, I did it like that  
I did it with a whiffleball bat  
So I'm on the run the cop's got my gun  
And right about now it's time to have some fun  
The King Adrock that is my name  
And I know the fly spot where they got the champagne."  
We rode for six hours then we hit the spot  
The beat was a bumping and the girlies was hot  
This dude was staring like he knows who we are  
We took the empty spot next to him at the bar  
M.C.A. said, "Yo, you know this kid?"  
I said, "I didn't." but I know he did  
The kid said, "Get ready cause this ain't funny  
My name's Mike D. and I'm about to get money."  
Pulled out the jammy aimed it at the sky  
He yelled, "Stick 'em up!" and let two fly  
Hands went up and people hit the floor  
He wasted two kids that ran for the door  
"I'm Mike D. and I get respect  
Your cash and your jewelry is what I expect"  
M.C.A. was with it and he's my ace  
So I grabbed the piano player and I punched him in the face  
The piano player's out the music stopped  
His boy had beef and he got dropped  
Mike D. grabbed the money M.C.A. snatched the gold  
I grabbed two girlies and a beer that's cold.

Credits
-------

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Paul Revere is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community)

Thank you to all [the contributors](https://github.com/thoughtbot/paul_revere/contributors)!

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

Paul Revere is Copyright © 2009-2011 thoughtbot. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
