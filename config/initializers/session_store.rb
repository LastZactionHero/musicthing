# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_musicthing0.1_session',
  :secret      => 'a730cba36a8fd6ab1c3e9371fd5e7ef01a7aacfcd9c6c228c05656af8f1d8cb59b9c3644300c06471c4487a2d99d0b8038e1e25e0a909604120d6e4a33c89441'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
