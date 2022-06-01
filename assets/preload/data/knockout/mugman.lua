
function onCreate()
     makeAnimatedLuaSprite('a2', 'characters/Cuphead Pissed', 950, 1100)
	addAnimationByPrefix('a2', 'shoot', 'Hadoken!! instance 1', 24, false) 
	addAnimationByPrefix('a2', 'ups', 'Phase 2 starts instance 1', 24, false) 
	addLuaSprite('a2', true) 
	scaleObject('a2', 1.7, 1.7) 
	setProperty('a2.visible', false)
	
	
	
     makeAnimatedLuaSprite('mugman', 'characters/Mugman Fucking dies', 2400, 1400)
     addAnimationByPrefix('mugman', 'helo', 'Mugman instance 1', 22, false)
     addAnimationByPrefix('mugman', 'boom', 'MUGMANDEAD YES instance 1', 24, false)
     addLuaSprite('mugman', true) 
     setProperty('mugman.alpha', 0)
     makeAnimatedLuaSprite('hadoken2', 'bull/Cuphead Hadoken', 800, 1350)
     addAnimationByPrefix('hadoken2', 'tween', 'Hadolen instance 1', 24, true)
     addAnimationByPrefix('hadoken2', 'boom', 'BurstFX instance 1', 24, false)
     
     makeAnimatedLuaSprite('dead', 'knock', 100, 100)
     addAnimationByPrefix('dead', 'dead', 'A KNOCKOUT!0', 12, false) 
     setObjectCamera('dead', 'hud') 
     addLuaSprite('dead', false) 
     setProperty('hadoken2.alpha', 0)
     setProperty('dead.alpha', 0)
     candodge = false;
     dodged = false;
     ok = false;

end

function onEvent(name, value1, value2) 
	if name == 'mugman' then
	    setProperty('mugman.alpha', 1)
	    objectPlayAnimation('mugman', 'helo', false)  
    end
end
function onUpdate()  
     if candodge == true and getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') or keyPressed('space') then
         dodged = true
         candodge = false
         characterPlayAnim('boyfriend', 'dodge', false) 
         playSound('attacks/dodge', 0.8)
     end
     
     if getProperty('hadoken2.x') == 1600 and dodged == true then 
           dodged = false 
           objectPlayAnimation('hadoken2', 'boom', false) 
           objectPlayAnimation('mugman', 'boom', false) 
           objectPlayAnimation('a2', 'ups', false) 
           objectPlayAnimation('dead', 'dead', false) 
           playSound('attacks/hurt', 1)
           playSound('knockout', 1)
           cameraSetTarget('dad')
           setProperty('dead.alpha', 1)
           setProperty('hadoken2.y', 800)
           setProperty('hadoken2.x', 1300)
                    setProperty('a2.y', 1400)
           setProperty('a2.x', 1350)
           runTimer('goodbye', 2)
    elseif getProperty('hadoken2.x') == 1600 and dodged == false then
           setProperty('health', -1)
           objectPlayAnimation('hadoken2', 'boom', false) 
           objectPlayAnimation('mugman', 'boom', false) 
           objectPlayAnimation('a2', 'ups', false) 
           objectPlayAnimation('dead', 'dead', false) 
           playSound('attacks/hurt', 1)
           setProperty('dead.alpha', 1)
           playSound('knockout', 1)
           cameraSetTarget('dad')
           setProperty('hadoken2.y', 800)
           setProperty('hadoken2.x', 1500)
           setProperty('a2.y', 1400)
           setProperty('a2.x', 1350)
           runTimer('goodbye', 4)
           setProperty('health', getProperty('health') -1)
       end
end

function onStepHit() 
      if curStep == 1170 then
         setProperty('a2.visible', true)
         setProperty('dad.x', 350)
         doTweenAlpha('dou', 'dad', 0, 0.01, 'linear') 
	    objectPlayAnimation('a2', 'shoot', false) 
	    
	    runTimer('do3', 0.5)
       end
       if curStep == 1194 then
          setProperty('dad.x', 1400)
          setProperty('a2.visible', false)
      end 
end

function onTimerCompleted(tag)
    if tag == 'do3' then
        addLuaSprite('hadoken2', true) 
	    setProperty('hadoken2.alpha', 1)
	    setProperty('hadoken2.x', 800) 
	    doTweenX('ae2', 'hadoken2', 1600, 0.5, 'linear') 
	    candodge = true 
	    playSound('shoot', 1)
    end
    
    if tag == 'goodbye' then 
       doTweenAlpha('ueuwuw', 'dead', 0, 2.5, 'linear') 
    end
end

function onUpdatePost() 
    
    if getProperty('hadoken2.animation.curAnim.name') == 'boom' then
        if getProperty('hadoken2.animation.curAnim.finished') then
            removeLuaSprite('hadoken2', false)
        end
    end 
end