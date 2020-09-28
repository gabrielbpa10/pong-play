# Pong-Play  

## Summary

The project is a game using the device Esp 8266 that receive commands of one potentiometer (Player 2) and two buttons (Player 1) to move the rackets of the pong. The idea of the game is
simulate a pong's match that there are two players, controlling the rackets.

- Esp 8266  
The device control the direction of rackets to up or to down at the match when the user to push the buttons or move the potentiometer to left or to right.
The code on the device is here: https://github.com/gabrielbpa10/joystick-pong

- Godot
The Godot engine is used to create the pong program. Through communication serial, the commands are passed to the game, manipulating the rackets.
