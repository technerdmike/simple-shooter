//Check sprite collisions
Collision:

If GetSpriteCollision(2,3)=1
	playsound(explosion)
	score=score+10
	enemyx=100: enemyy=-50
	enemy_fired=0
	for j=0 to 4
		SetSpritePosition(110+j,-100,-100)
	next j
	lazer_fired=0
	lazerx=250: lazery=-150
endif


//Check to see if any of the enemy bullets have hit the player ship
for i=0 to 4
	if GetSpriteCollision((110+i),1) = 1
		PlaySound(explosion)
		gameover=1
		for j=0 to 4
			SetSpritePosition(110+j,-100,-100)
		next j
		enemyx=100: enemyy=-50
	endif
next i
Return
