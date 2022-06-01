local ismugman = false;
function onCreate()
     makeAnimatedLuaSprite('a', 'characters/Nightmare_Cuphead', getProperty('dad.x') -150, getProperty('dad.y') -100)
	addAnimationByPrefix('a', 'shoot', 'Hadoken or Roundabout instance 1', 24, false) 
	addLuaSprite('a', true) 
	scaleObject('a', 1.45, 1.45) 
	setProperty('a.alpha', 0)
	
	
     makeAnimatedLuaSprite('hadoken', 'bull/NMcupheadAttacks', 800, 1350)
     addAnimationByPrefix('hadoken', 'twee3n', 'DeathBlast instance 1', 24, true)
     scaleObject('hadoken', 1.2, 1.2)
     setProperty('hadoken.alpha', 0). 
     candodge = false;
     dodged = false;

end

function onEvent(name, value1, value2) 
	if name == 'hadoken' then
	    setProperty('a.alpha', 1)
	    objectPlayAnimation('a', 'shoot', false) 
	    setProperty('dad.alpha', 0)
	    runTimer('do', 0.3)
    end
end

function onTimerCompleted(tag)
    if tag == 'do' then
        addLuaSprite('hadoken', true) 
	    setProperty('hadoken.alpha', 1)
	    setProperty('hadoken.x', 800) 
	    doTweenX('ae2', 'hadoken', 1600, 0.5, 'linear') 
	    candodge = true 
	    playSound('shoot', 1)
    end
end

function onUpdate()  
     if candodge == true and getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') or keyPressed('space') then
         dodged = true
         candodge = false
         characterPlayAnim('boyfriend', 'dodge', false) 
         playSound('attacks/dodge', 0.8)
     end
     
     if getProperty('hadoken.x') == 1600 and dodged == true then 
           dodged = false 
           doTweenX('ae', 'hadoken', 3050, 1.1, 'linear') 
    elseif getProperty('hadoken.x') == 1600 and dodged == false then
           setProperty('health', getProperty('health') -1)
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
     if t == 'ae' then
        removeLuaSprite('hadoken', false)
     end
end 