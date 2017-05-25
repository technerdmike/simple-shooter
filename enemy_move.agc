Enemy_move:

// Move enemy down the screen at same rate
enemyy=enemyy+1

//Move the enemy left or right
If enemy_direction=4 and enemyx>GetVirtualWidth()-GetSpriteWidth(3)
	enemy_direction=-4
endif
//enemyx=enemyx+enemy_direction

If enemy_direction=-4 and enemyx<0
	enemy_direction=4
endif
enemyx=enemyx+enemy_direction

SetSpritePosition(3,enemyx,enemyy)

return



Enemy_Shoot:
if enemy_fired=0
	if Random(1,100)=5
		enemy_fired=1
		for i=0 to 4
			SetSpritePosition(110+i,GetSpriteX(3)+GetSpriteWidth(3)/2, GetSpriteY(3)+GetSpriteHeight(3))
		next i
	endif
endif

if enemy_fired=1
	SetSpritePosition(110, GetSpriteX(110)-3, GetSpriteY(110)+5)
	SetSpritePosition(111, GetSpriteX(111)-1, GetSpriteY(111)+5)
	SetSpritePosition(112, GetSpriteX(112), GetSpriteY(112)+5)
	SetSpritePosition(113, GetSpriteX(113)+1, GetSpriteY(113)+5)
	SetSpritePosition(114, GetSpriteX(114)+3, GetSpriteY(114)+5)
endif

if GetSpriteY(110)>1024
	enemy_fired=0
endif
Return	
