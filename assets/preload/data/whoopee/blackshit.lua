function onCreate()
    makeAnimatedLuaSprite('dodgebutton', 'Notmobilegameanymore',  50, 320);
	scaleObject('dodgebutton', 0.5, 0.5) 
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'attack', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('dodgebutton', 'attack')
	setProperty('dodgebutton.alpha', 0.5) 
	addLuaSprite('dodgebutton', true)
	
    makeLuaSprite('oublack', 'black', 0, 0)
    scaleObject('oublack', 15, 15)
    addLuaSprite('oublack', true) 
    setObjectCamera('oublack', 'game') 
    setProperty('oublack.alpha', 0) 
    setObjectOrder('oublack', 6)
    
    makeLuaSprite('oublack2', 'black', 0, 0)
    scaleObject('oublack2', 15, 15)
    setObjectCamera('oublack2', 'other') 
    addLuaSprite('oublack2', true) 
    setProperty('oublack2.alpha', 0) 
    setProperty('gf.alpha', 0) 
   
end

function onStepHit()
    if curStep == 16 then
       doTweenAlpha('ou', 'oublack', 0.5, 5, 'linear')
       doTweenAlpha('ou2', 'oublack2', 0.5, 5, 'linear')
    end
    
    if curStep == 154 then 
        characterPlayAnim('dad', 'fucku', false) 
    end 
    
    if curStep == 160 then
       setProperty('dodgebutton.alpha', 0)
       setProperty('dodge.alpha', 0)
       doTweenAlpha('ou3', 'oublack', 0, 1, 'linear')
       doTweenAlpha('ou4', 'oublack2', 0, 1, 'linear')
    end
   
  
end 