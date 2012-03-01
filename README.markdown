# WinLoss
## Because the people you work with are assholes who deserve to be beaten.

A ping-pong leaderboard for the Ennova office.

## Spec

There should be two views of the data:

- Current Leader (scoped to this week)
- Champions (scoped to all-time)

Eventually, there may be alternate views aggregating by overall points, average PPG, etc.

### Entry

Entry should be a natural-language field. The following are valid:

    Odin beat Tate 21-5 => { winner: odin, loser: tate, winner_score: 21, loser_score: 5, played_at: Time.now }
    Jason was beaten by Tate 21-6 an hour ago => { winner: tate, loser: jason, winner_score: 21, loser_score: 6, played_at: Time.now - 1.hour }

## Schema
### Users

Standard user table. Capture name, email address.

### Games

    | winner_id | loser_id | winner_score | loser_score | played_at |
