# README

This is a knockoff Roll20, which I started partially because it sounded fun,
and partially because I needed a project to submit with job applications.

Backend for <https://github.com/chrisjmurphy96/simple-tabletop-rpg-angular>.
You will need the `Angular` app running when you launch this or you won't see anything.
Built using `Ruby 3.4.8` and `Rails 8.1.2`. You will need `Ruby` installed to run this repo.

## Running locally

1. Install the gem dependencies with `bundle install` (assume this works, I haven't tested from a fresh directory).
1. Run the DB migrations with `ruby bin/rails db:migrate`.
1. If you are using `VSCode`, you can install the `Ruby LSP` extension
and then run `Debug web server` in the `Run and Debug` tab. That's it!

## Overview

At the moment this backend manages two things. Account login/creation, and player object state.
This repo is attempting to use best practices for authentication (e.g. passwords are hashed in the DB), however this is still very rough and I
am not a security expert. If you somehow found this, please don't deploy as is. Not that you'd want to anyways.

## Future additions

- Ability to draw on the board.
- Player sprites tied to account instead of a button. The button could be limited to the GM
  and instead used to spawn sprites for NPC's and enemies.
- Separate board sessions, which could be used for separate campaigns or maybe separate maps within a campaign.
- Probably more I haven't thought of.
