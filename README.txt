DESC.

This game was coded in processing.
Simple frogger game based off the origional.

This game was originally created by Joshua Tommy Hess on 10/28/22
The origional methods were created by the coding train's youtube channel but most are totally different 
now.
-----------------------------------------------------------------------------------------------------------
v1.3 11/4/22 2:00am
Added - 
- Colors to everything: roads, water, cars, logs.
- Added stuff to make level2 but still need to finish implementing.
- Added Frog png but it's not on top of the stupid frog.
Removed -
- Font
Fixes -
- Fixed the arrayIndexOutOfBounds error if you go too far up the screen by adding an if statement in move()
- Fixed the lives counter font by deleting the font
Fixes still needed - 
- More randomness in the obstacles
- More png's to add to game
- Figure out how to set the obs to png
- Implement level2
-----------------------------------------------------------------------------------------------------------
v1.2 11/1/22 1:00am
Added - 
- Win game function to display a screen when you win. Also added a restart game option. 
- Game over function that calls when you run out of lives and asks if you want to restart the game. 
- Number of lives updates in the bottom right corner. 
- More colors 
- Font 
Fixes - 
- Fixed the arrayIndexOutOfBounds error when frog moved down at start pos. 
- Fixed end area to have boundaries and safe zone. 
Fixes still needed - 
- Lives counter changes font after game resets once. 
- arrayIndexOutOfBounds error if you go too far up on screen. (Hopefully the win game function will fix) 
- More randomness. (Frog can make it all the way if you hold up)
-----------------------------------------------------------------------------------------------------------
v1.1 10/28/22
This was the first stage of the game. Was very basic with lots of bugs. There was not a win or
a game over function. Nor is there anything stopping you from going off the screen.