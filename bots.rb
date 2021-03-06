#!/usr/bin/env ruby

require 'twitter_ebooks_dev'

# This is an example bot definition with event handlers commented out
# You can define as many of these as you like; they will run simultaneously

Ebooks::Bot.new("karlnp_ebooks") do |bot|
  # Consumer details come from registering an app at https://dev.twitter.com/
  # OAuth details can be fetched with https://github.com/marcel/twurl
  bot.consumer_key = "8mtyAdENNNENloLizNO5sS34x" # Your app consumer key
  bot.consumer_secret = "JJwL8Ns3tIEyp0LwRjbW6GGRCkGRUlqvhIJ0PIIAYvvbhYRibm" # Your app consumer secret
  bot.oauth_token = "2573471509-CBtvONN47me1t0ref03EWtoWj2DczVEwo5PrgKD" # Token connecting the app to this account
  bot.oauth_token_secret = "c6YQJN1XOiqG1EoaNoNatNTisPeFYriGaFCxe9cYYokNU" # Secret connecting the app to this account


    favstrings = [ "Favourite favourites are great tweets!",
    "painters, though... hm.",
    "Is there any way I can tell the Twitter app to not show me when my friends favourite blocked accounts' tweets",
    "lying cat is my favourite comic character",
    "first to space but mysteriously disappeared",
    "princess is my favourite so far.",
    "This is also my favourite part of my shirt.",
    "My favourite thing about my new shirt.",
    "because of pieces like this. Great work. :)",
    "fyi"]



  bot.on_startup do 
      model = Ebooks::Model.load("model/karlnp.model")
      #model = Ebooks::Model.load("model/combined.model")
      bot.tweet(model.make_statement(140))
  end


  bot.on_message do |dm|
    # Reply to a DM
     bot.reply(dm, "sssssssh. don't tell anyone")
  end

  bot.on_follow do |user|
    # Follow a user back
     model = Ebooks::Model.load("model/karlnp.model")
     bot.follow(user[:screen_name])
     bot.reply("@"+ user[:screen_name] + " " + model.make_response("Thanks for the follow!", 130))
  end

  bot.on_favorite do |user|
    model = Ebooks::Model.load("model/karlnp.model")
    bot.follow(user[:screen_name])
    if rand(10) == 1 then
        bot.tweet("@"+ user[:screen_name] + " " + model.make_response(favstrings.sample, 110))
    end
  end

  bot.on_mention do |tweet, meta|
    # Reply to a mention
     model = Ebooks::Model.load("model/karlnp.model")
    bot.reply(tweet, meta[:reply_prefix] + model.make_response(tweet.text, 110))
  end

  bot.on_timeline do |tweet, meta|
    # Reply to a tweet in the bot's timeline
    # bot.reply(tweet, meta[:reply_prefix] + "nice tweet")
  end

  bot.scheduler.every '24h' do
    # Tweet something every 24 hours
    # See https://github.com/jmettraux/rufus-scheduler
    # bot.tweet("hi")
  end

  bot.scheduler.every '1h' do
    model = Ebooks::Model.load("model/karlnp.model")
    bot.tweet(model.make_statement(140))
  end
end
