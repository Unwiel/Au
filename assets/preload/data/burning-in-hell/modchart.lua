function onCreate()
    InvincibleTime = 0;
	DamageEnable = false;
	DamageEnable2 = false;
	RandomAngle = 0;
	FlipX = 0
	FlipX2 = false
    SansAttack = false
     

    
	

	makeAnimatedLuaSprite('ray','Gaster_blasterss',-200,1000);
	addAnimationByPrefix('ray','Attack1','fefe instance 1',24,false)
	objectPlayAnimation('ray','Attack1',false)
	
    
	makeAnimatedLuaSprite('ray2','Gaster_blasterss',-2200,1000);
	addAnimationByPrefix('ray2','Attack1','fefe instance 1',24,false)
	objectPlayAnimation('ray2','Attack1',false)
	
	

	makeLuaSprite('HeartSans','heart',990,1500)



	SansAttack = false
end

function onUpdate()

	if SansAttack == true then

		RandomAngle = math.random(0,30)

		if FlipX == 0 then
			FlipX2 = false
		else
			FlipX2 = true
		end
		







		if SansAttack == true then

			triggerEvent('Camera Follow Pos',getProperty('boyfriend.x') + 50,getProperty('boyfriend.y'))

			if getProperty('HeartSans.alpha') < 1 then
				setProperty('HeartSans.alpha',getProperty('HeartSans.alpha') + 0.02)
			end

			if getProperty('boyfriend.alpha') > 0.5 then
				setProperty('boyfriend.alpha',getProperty('boyfriend.alpha') - 0.02)
			end


			if keyPressed('left') and getProperty('HeartSans.x') >218 then
				setProperty('HeartSans.x',getProperty('HeartSans.x') - 6.5)
			end

			if keyPressed('right') and getProperty('HeartSans.x') <1662 then
				setProperty('HeartSans.x',getProperty('HeartSans.x') + 6.5)
			end

			if keyPressed('up') and getProperty('HeartSans.y') >1300 then
				setProperty('HeartSans.y',getProperty('HeartSans.y') - 6.5)
			end

			if keyPressed('down') and getProperty('HeartSans.y') <2100 then
				setProperty('HeartSans.y',getProperty('HeartSans.y') + 6.5)
			end
			
			

			
			if InvincibleTime == 0  then

				if getProperty('HeartSans.y') > (getProperty('ray.y') + 10) and getProperty('HeartSans.y') < (getProperty('ray.y') - 10) + getProperty('ray.height')/2 and DamageEnable == true or getProperty('HeartSans.y') > (getProperty('ray2.y') + 10)  and getProperty('HeartSans.y') < (getProperty('ray2.y')- 10) + getProperty('ray2.height') / 2 and DamageEnable2 == true or objectsOverlap('HeartSans','ray') and DamageEnable == true or objectsOverlap('HeartSans','ray2') and DamageEnable2 == true  then
					InvincibleTime = 200
					playSound('heart_hurt')
					setProperty('health',getProperty('health') -0.5)
					playSound('bendy/inked')
				end
			end
		end
    end

	if InvincibleTime > 0 then
		InvincibleTime = InvincibleTime - 1
	end

	
	
	if curStep == 1904 then
		doTweenAlpha('dahud', 'camHUD', 0, 2, 'linear') 
	end

	
	
	if SansAttack == false then
		setProperty('HeartSans.alpha',0)
	end
end

function onTimerCompleted(tag)
	if SansAttack == true then
		if tag == 'SansAttack1' then
			runTimer('gasSound',0.6)
			addLuaSprite('ray', true) 
			objectPlayAnimation('ray','Attack1')
			setProperty('ray.y',getProperty('HeartSans.y')- 170)
			setProperty('ray.angle',RandomAngle)
			
			playSound('sans/readygas')
			runTimer('SansAttack2',1)
			runTimer('SansHitBox',0.8)
			
		end

		if tag == 'SansAttack2' then
			runTimer('gasSound2', 0.6)
			addLuaSprite('ray2', true) 
			objectPlayAnimation('ray2','Attack1')
			setProperty('ray2.flipX',FlipX2)
			setProperty('ray2.y',getProperty('HeartSans.y')- 170)
			setProperty('ray2.angle',RandomAngle)
			
			playSound('readygas')
			runTimer('SansAttack1',2)
		end
    end

	if tag == 'gasSound' or tag == 'gasSound2' then
		playSound('shootgas')
	end

	if tag == 'SansHitBox' then
		DamageEnable = true
		runTimer('DisableHitBox',0.5)
	end
	
	if tag == 'SansHitBox2' then
		DamageEnable2 = true
		runTimer('DisableHitBox2',0.5)
	end
	if tag == 'DisableHitBox'then
		
	end
	if tag == 'DisableHitBox2'then
		
	end
end

function onStepHit()
	FlipX = math.random(0,1)
	
	if curStep == 408 then
		SansAttack = true
		runTimer('SansAttack1',1)
		addLuaSprite('HeartSans',true)
		setProperty('HeartSans.alpha',0)
	end
	
	if curStep == 662 then
		SansAttack = true
		runTimer('SansAttack1',1)
		addLuaSprite('HeartSans',true)
		setProperty('HeartSans.alpha',0)
   end 
	if curStep == 508 or curStep == 761 then 
		SansAttack = false
	end
end

function onUpdatePost() 
    if getProperty('ray.animation.curAnim.name') == 'Attack1'then
        if getProperty('ray.animation.curAnim.finished') then
		removeLuaSprite('ray',false)
		DamageEnable = false
		end 
	end

	if getProperty('ray2.animation.curAnim.name') == 'Attack1'then
        if getProperty('ray2.animation.curAnim.finished') then
		removeLuaSprite('ray2',false)
		DamageEnable2 = false
		end 
	end
end 


  