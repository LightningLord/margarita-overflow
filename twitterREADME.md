### GET TWITTER SIGN IN WORKING ON YOUR LOCAL MACHINE

You'll have to register a Twitter application on Twitter and get an API key and
API secret.  You can do this at the [Twitter app registry][twitter app registry]

After you get your keys, put them in your .env file.
 ```text
 $ touch .env
 ```
Then configure your .env file

 ```ruby
TWITTER_CONSUMER_KEY = your api key #no quotes
TWITTER_CONSUMER_SECRET = your api secret #no quotes
 ```

Try to sign in to the app with twitter. Note: you can only sign in with twitter, you cannot sign up for a new account. You will need to create a new account manually where the username is the same as your twitter handle.