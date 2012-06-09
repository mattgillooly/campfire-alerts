# campfire-alerts

Uses Postmark to process Google Alerts emails, and post the new results to a Campfire chatroom.

Prompted by Postmark's [contest](http://blog.postmarkapp.com/post/24474853026/contest-bring-google-alerts-into-campfire-using).

[![Build Status](https://secure.travis-ci.org/mattgillooly/campfire-alerts.png?branch=master)](http://travis-ci.org/mattgillooly/campfire-alerts)


## Setup

### Campfire

For the smoothest experience, I recommend creating a new user in your Campfire account just for alerts.  If you are logged into Campfire as the same user that you have configured on campfire-alerts, you will not always see alerts as soon as they post into the room.

You will need to set a few environment variables to tell campfire-alerts how to connect to your Campfire room.

```
ENV['CAMPFIRE_SUBDOMAIN'] # => the subdomain of your Campfire account

ENV['CAMPFIRE_AUTH_TOKEN'] # => your API authentication token.  Find it by clicking the "My info" link in the upper-right of the Campfire UI.

ENV['CAMPFIRE_ROOM_NAME'] # => the name of the room to post alerts into
```


If you're running on Heroku, you can set these variables using `heroku config` from the commandline.  https://devcenter.heroku.com/articles/config-vars


### Postmark

Once you've deployed campfire-alerts to some publicly-accessible part of the web, you need to configure your Postmark account to post incoming alerts to your server.   Just [configure an inbound server](http://developer.postmarkapp.com/developer-inbound-configure.html) following Postmark's instructions.  If your web server is set up at http://campfire-alerts.example.com/, then your webhook URL will be http://campfire-alerts.example.com/postmark_callbacks

