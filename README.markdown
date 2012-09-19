[![Build Status](https://secure.travis-ci.org/ltw/winloss.png)](http://travis-ci.org/ltw/winloss)

# WinLoss
## Because the people you work with are assholes who deserve to be beaten.

A ping-pong leaderboard designed for the [Ennova](http://ennova.com.au) office.

This board shows Points-Per-Game averages as each person's score, along with the number of games recorded for that person, broken down by week, month and all-time.

This app is designed to be a stand-alone install of a Rails app, as there's no authentication or anything built for a single server to host multiple sets (or leagues) of players.

## Usage

To record a score, enter a natural language string into the results box, e.g.

**Odin got his ass beaten by Lucas 21-7 yesterday**

This records that Lucas is the winner, Odin is the loser, Lucas got 21 points, Odin got 7 points and the game happened yesterday.

**Lucas beat Odin 4-21**

This records that Lucas won, Odin lost, Lucas got 21 points, Odin got 4 points and the game happened today.

## Other Features

You can delete the last game entered if you made a mistake.

## Issues

- no way to create users through the UI
- names must be spelt with correct case when recording results
- a hack determines verb object direction (i.e. one word actions indicate that the person on the left is the winner, multiple word actions indicate that the person to the right is the winner)
