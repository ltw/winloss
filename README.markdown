# WinLoss
## Because the people you work with are assholes who deserve to be beaten.

A ping-pong leaderboard designed for the [Ennova](http://ennova.com.au) office.

This board shows Points-Per-Game averages as each person's score, along with the number of games recorded for that person, broken down by week, month and all-time.

This app is designed to be a stand-alone install of a Rails app, as there's no authentication or anything built for a single server to host multiple sets (or leagues) of players.

## Usage

To record a score, enter a natural language string into the results box, e.g.

**Lucas got his ass beaten by Odin 21-2 yesterday**

This records that Odin is the winner, Lucas is the loser, Odin got 21 points, Lucas got 2 points and the game happened yesterday.

**Odin beat Lucas 4-21**

This records that Odin won, Lucas lost, Odin got 21 points, Lucas got 4 points and the game happened today.

## Other Features

You can delete the last game entered if you made a mistake.

## Issues

- no way to create users through the UI
- names must be spelt with correct case when recording results
- a hack determines verb object direction (i.e. one word actions indicate that the person on the left is the winner, multiple word actions indicate that the person to the right is the winner)
