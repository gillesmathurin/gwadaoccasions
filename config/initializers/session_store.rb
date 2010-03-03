# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gwadaoccasions_session',
  :secret      => 'd0de7960c3cc93f292e0bbfb110887ca624c4b76fb1dfed779767eee68e9fa258eafdc5e9945bfc9bf81c143dd7638f7e3b6560fe1dbd6886086be531f593c73'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
