# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oreillerchaton_session',
  :secret      => 'b1e01035992513f7eda68bce584f70a70929617a8863a7e0c2843ad6dfa51a6520324841eef1ae976f994117cafb851e7dacd893c2f26f7e29c8f703b8bc799b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
