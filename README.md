<img src='https://github.com/m-delarosa/303-mtb-trails-cli-app/blob/master/design/images/303TF_log_in.png' />

## 303MTB Trail Finder CLI App

Generates decisive mountain bike trail recommendations for new and veteran riders alike, in the Denver/Boulder geographic area.

## Motivation

On average 52 people move to the Denver/Boulder metro area each day, a suprising percentage of which are trail users. As the metro area cotinues to expand, so does the volume of traffic our trails receive. This app is meant to take the guesswork out of finding the perfect trail to ride each day, based on the user's mood and preferences. It's meant to limit the time spent researching trails, so that users can maxmize their time on the trail!

The 303MTB Trail Finder app is also meant to help preserve our trails. When a trail in our area is ridden in a muddy state, it causes permanent damage to the soil, which will need to be repaired by volunteers. In order to limit the amount of damage to our trails, the 303MTB Trail Finder App will only make recommendations that have been reported to be in a dry or safe condition. Preventing the user from making a long trip to trailhead, only to find out it is closed or muddy.

## Build status

Iteration 0 functional. Currently adding additional functionality such as MTB Project API data.

## Tech/framework used

<b>Built with</b>

- [Ruby]
- [ActiveRecord]
- [TTY-Prompt]

## Features

- Generates a decisive trail recommendation based on user-submitted criteria such as riding style, length of ride, location and skill level and trail condition.
- Ability to save trail information to user account for future reference.
- Ability to remove trails from user account to customize favorite trails.
- "Find a Trail" feature will not recommend a previously saved trail.
- Access information for all public mountain bike trails in the Boulder/Denver area.

## Installation

1. Navigate to desired filepath for this app in terminal.
2. Fork (optional) and clone down the project by running the line below in terminal:

   `$ git clone git@github.com:m-delarosa/303-mtb-trails-cli-app.git`

3. Install Gems in terminal using:

   `$ bundle install`

4. From repo root directory:

   `$ ruby runner.rb`

## API Reference

Future Feature: MTB Project API Compatability

## How to use?

Use arrow keys for navigation

Select: enter

Yes: y

No: n

## Credits

ASCII Artwork: @NickDongoske

## Contribute

Contributions are always welcome! Please read the contribution guidelines first.
