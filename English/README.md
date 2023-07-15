# A board baseball game to teach the sport

Copyright © Crane Softwrights Ltd.

*(Skip the introduction and jump to: [Basic Play](#basic-play) or [Extended Play](#extended-play))* 

## Introduction to baseball play

This project develops a board game along the lines of the basic long-played baseball board game, but brought up to date to include new rule changes at MLB. Differing from other board baseball games, this one aims to educate the players on the rules, the notations, and the conventions used when scoring a baseball game, using official abbreviations used by MLB.

Also, this version introduces an extended play that involves pitching, something not included in the original. With pitching, both players are rolling dice for each inning. There is sufficient detail in this alternative play that a game can be scored in order to practice scoring techniques. Crane's own scoring conventions are documented for consideration.

At its core, baseball is a game of two teams, a visiting team and a home team, each taking turns in offense and defense. The goal for the offensive team (batting) is to score runs by successfully hitting the ball and advancing around a series of four bases arranged in a diamond shape. The defensive team (pitching) aims to prevent the offensive team from scoring by pitching, fielding the ball, and making outs.

In board baseball, both the original basic "only batter rolls dice" and this new extended "batter and pitcher both roll dice" are played on the same board with the basic mode using only a subset of the play pieces. The setup and play involved for both basic and extended modes of play are described below.

At least nine innings are played, where in the "top" of the inning the visiting team is batting on offence and in the "bottom" of the inning the home team is batting on offence. The "middle" of the inning is the time between the top and bottom of the inning. The "end" of the inning is the time between the bottom of the inning and the top of the next inning.

The batter can reach base and become a base runner if they are not put out in a defensive play. A run is scored when a base runner reaches home plate. The objective of the each team is to plate more runs than their opponent.

Should the home team be in the lead at the middle of the ninth inning, the game ends with the given score.

Should the home team become in the lead in the bottom of the ninth inning, the game ends with the given score and further runs are not attempted.

Should the score not be tied at the end of the ninth inning, the game ends with the given unequal score.

Should the score be tied at the end of the ninth inning, an extra inning (both top and bottom halves) is played. 

In an extra inning the team batting places the previous inning's final batter as a base runner at second base before the first batter of the extra inning approaches the plate for play. Should the home team become in the lead in the bottom of the extra inning, the game ends with the given score and further runs are not attempted.

Should the score not be tied at the end of the extra inning, the game ends with the given unequal score.

Should the score be tied at the end of the extra inning, another extra inning is played as described above.

The concept of "scoring a game" is to transcribe a record of each of the plays, including if desired even each of the pitches, of every batter than comes to the plate. The pace and tenor of the game can be reviewed during the game and after the end of the game.

## Basic play 

Use the physical play board with the marking: <img src="../shared/z-batting.png" height=".35cm"/>

Alternatively, print the PDF file: [`basic-print-board-baseball-crane.pdf`](basic-print-board-baseball-crane.pdf)

[<img src="../shared/step-1.png" height=".5cm"/>](../shared/Z-SETUP.md)

- see [Basic Setup](../shared/Z-SETUP.md) for details

<img src="../shared/step-2-x.png" height=".5cm"/>

- in the basic mode there is no pitching

<img src="../shared/step-3.png" height=".5cm"/>

- the player batting rolls two dice to determine the play according to [basic plays](Z-PLAYS.md)
- the batter and the runners move according to the play rolled

<img src="../shared/step-4-x.png" height=".5cm"/>

- in the basic mode there is no nuanced control for base runners

## Extended play 

Use the physical play board with the marking: <img src="../shared/x-pitching.png" height=".5cm"/>

Alternatively, print the PDF file: [`extended-print-board-baseball-crane.pdf`](extended-print-board-baseball-crane.pdf)

[<img src="../shared/step-1.png" height=".5cm"/>](../shared/X-SETUP.md)

- see [Extended Setup](../shared/Z-SETUP.md) for details

<img src="../shared/step-2.png" height=".5cm"/>

- the pitcher (the player not batting) rolls one die (of a colour different from the dice used by the batter) to determine which pitch is thrown
- the batter begins with a tally of zero balls and zero strikes
- the batter's strike zone is an imaginary area above home plate in the horizontal and extending in the vertical from the batter's knees up to the mid-point between the top of the batter's pants and the batter's shoulders 
- a ball is a pitch thrown outside of the batter's strike zone when the batter does not "offer" at the pitch by swinging
- four balls <img src="../shared/pd2.png" height=".6cm"/> moves the batter to first base, pushing the first-base runner to second base
- a strike is a pitch thrown inside of the batter's strike zone or any pitch at which the batter offers by swinging
- the batter making contact with a the pitch but resulting in the ball being outside of the third-base line and the first-base line makes for a "foul ball"
- foul balls <img src="../shared/pd5.png" height=".6cm"/> count as strikes only when there are fewer than two strikes against the batter, otherwise they are ignored
- a swinging third strike <img src="../shared/pd1.png" height=".6cm"/> or a looking third strike <img src="../shared/pd3.png" height=".6cm"/> is an out for the batter
- the batter making contact with the pitch with <img src="../shared/pd4.png" height=".6cm"/> or <img src="../shared/pd6.png" height=".6cm"/> puts the ball "in play" in between the third-base line and the first-base line

<img src="../shared/step-3.png" height=".5cm"/>

- when there are no base runners and the game is not being scored, the batter rolls two dice to determine how the pitch is put in play according to [extended plays](X-PLAYS.md)
- the batter and runners move according to the play rolled

<img src="../shared/step-4.png" height=".5cm"/>

- when there are base runners or the game is being scored, the batter rolls three dice (two dice of one colour for the batter and one die of a different colour for the base runners) to determine how the pitch is put in play and the impact of the play on the runners, thus guiding how the play is scored


## Physical box assembly

See the [building instructions](../build/#readme) for a collection of image files for laser engraving/cutting. The assumption is a line of size .001mm is a cut request.

The image files are 250mm x 270mm each and, after cutting, the layers can be aligned for laminating by using the two 3/16" holes outside of the playing area. The alignment guides can be shaved off when the laminating is completed.

There are five layers in total to be cut in order to fashion the entire box. Each layer is assumed to be 3/16" in order to fit four 12mm dice in the storage compartment and to fit the play board in its cradle.

