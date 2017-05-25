
// Project: SpaceInvaders_Test 
// Created: 2017-05-20
SetWindowSize(768,1024,0)
SetWindowAllowResize(5)
SetVirtualResolution(768,1024)
UseNewDefaultFonts(1)

//Player Position Variables
playerx as float
playery as float

//Lazer Position variable
lazerx as float = -100
lazery as float
//Is the lazer fired? variable
lazer_fired = 0

//Enemy Ship position variable
enemyx as float
enemyy as float
//Enemy ship starting spped and direction
enemy_direction = 4
//Is the Enemy Ship Fired? variable
enemy_fired=0
//Gameover variable
gameover=1

//Score variables
score=0
hiscore=0

// #include tells the main program to pull the other files
#include "Loader.agc"
#include "PlayerMove.agc"
#include "Player_shoots.agc"
#include "enemy_move.agc"
#include "sounds.agc"
#include "Collision.agc"
#include "Stars.agc"
#include "Text.agc"
#include "mainmenu.agc"

//Gosub tells the program to load that section of the program from one of the other files
Gosub Make_stars
Gosub loader
Gosub Load_sounds
Gosub Make_text

//The do-loop section is the codes that are constantly repeated, making sprited move and providing input and output.
do
	if gameover=1
		Gosub MainMenu
		score=0
	endif
	
	Gosub PlayerMove
	Gosub Player_shoots
	Gosub Enemy_move
	Gosub Enemy_Shoot
	Gosub Move_stars

	SetTextString(1,"Score: "+str(score))
	if score>hiscore
		hiscore=score
	endif
	SetTextString(3,"HiScore: "+str(hiscore))
	Gosub Collision
	Sync()
loop
	
