# README

Tutor Assistant is a personal application that was created to engage and interact with third grade students who I am currently tutoring. This application allows them to have one place for all of the resources, private messages, and assignments sent to them by me. With having students from the U.S. and Jamaica, some well-known applications weren't accessible. Here, they will have a "one-stop shop". 

Installation Install Ruby 2.6.1-p33 and Rails 6.0.3.4

# Install Your Dependencies
by running the following in your terminal:

bundle install

# Run the following to get into the current directory:
cd tutor-assistant

# Example of being in the current directory
root@LAPTOP-6AGP0TPS:~/tutor-assistant# %

rails s

# Running the Server
root@LAPTOP-6AGP0TPS:~/tutor-assistant# rails s => Booting Puma => Rails 6.0.3.2 application starting in development => Run rails server --help for more startup options Puma starting in single mode...

Version 4.3.6 (ruby 2.6.1-p33), codename: Mysterious Traveller
Min threads: 5, max threads: 5
Environment: development
Listening on tcp://127.0.0.1:3000
Listening on tcp://[::1]:3000 Use Ctrl-C to stop


# Gems to Install
gem bcrypt - This gem (an ActiveRecord macro) creates uncodeable passwords.

gem omniauth-google-oauth2 - This gem allows users to sign in with Google.

gem byebug - debugging tool for Rails