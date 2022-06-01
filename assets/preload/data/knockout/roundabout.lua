function onCreate() 
     makeAnimatedLuaSprite('a', 'characters/Cuphead Pissed', getProperty('dad.x') -450, getProperty('dad.y') -360)
	addAnimationByPrefix('a', 'shoot', 'Hadoken!! instance 1', 24, false) 
	addLuaSprite('a', true) 
	scaleObject('a', 1.7, 1.7) 
	setProperty('a.alpha', 0)
	
     makeAnimatedLuaSprite('roundabout', 'bull/Roundabout', 600, 1350)
     addAnimationByPrefix('roundabout', 'tween', 'Roundabout instance 1', 24, true)
     scaleObject('roundabout', 1.8, 1.8)
     setProperty('hadoken.alpha', 0)
     candodge = false;
     dodged = false;
      regresa = false
end

function onEvent(name, value1, value2) 
	if name == 'roundabout' then
	    setProperty('a.alpha', 1)
	    objectPlayAnimation('a', 'shoot', false) 
	    setProperty('dad.alpha', 0)
	    runTimer('do2', 0.5)
    end
end
function onUpdate()  
doTweenY('up', 'roundabout', 500, 'linear') 
    doTweenY('down', 'roundabout', 2000, 'linear') 
     if candodge == true and getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') or keyPressed('space') then
         dodged = true
         
         playSound('attacks/dodge', 0.8)
         candodge = false
         characterPlayAnim('boyfriend', 'dodge', false) 
     end
     
     if getProperty('roundabout.x') == 2250 and dodged == true and regresa == false then 
           dodged = false 
           doTweenX('ve2', 'roundabout', 3200, 0.6, 'linear') 
    elseif getProperty('roundabout.x') == 2250 and dodged == true and regresa == true then 
           dodged = false 
           regresa = false
           doTweenX('ve4', 'roundabout', -500, 1.5, 'linear')   
    elseif getProperty('roundabout.x') == 2250 and dodged == false then
           setProperty('health', getProperty('health') -1)
    end
    
    
end

function onTimerCompleted(tag)
    if tag == 'do2' then
        addLuaSprite('roundabout', true) 
	    setProperty('roundabout.alpha', 1)
	    setProperty('roundabout.x', 800) 
	    doTweenX('ve1', 'roundabout', 2250, 0.8, 'linear') 
	    candodge = true 
	    playSound('shoot', 1) 
    end
end

function onUpdatePost() 
      if getProperty('a.animation.curAnim.name') == 'shoot' then
        if getProperty('a.animation.curAnim.finished') then
            setProperty('dad.alpha', 1)
            setProperty('a.alpha', 0)
        end
    end 
end

function onTweenCompleted(t)
     if t == 've2' then
       
       regresa = true
       candodge = true 
        doTweenX('ve3', 'roundabout', 2250, 0.5 , 'linear')  
     end
     
     if t =='ve4' then
        removeLuaSprite('roundabout', false)
     end
end 