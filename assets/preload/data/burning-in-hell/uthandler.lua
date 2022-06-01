local genocide = false;
local pacifist = true;
local canattack = true;
local addattacks = true;
local attacks = 0
local Tired = false;
function onCreate()
    makeAnimatedLuaSprite('dodgebutton', 'Notmobilegameanymore',  50, 320);
	scaleObject('dodgebutton', 0.5, 0.5) 
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'attack', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('dodgebutton', 'attack')
	setProperty('dodgebutton.alpha', 0.5) 
	addLuaSprite('dodgebutton', true)
	
	makeAnimatedLuaSprite('bfattack', 'characters/Chara', getProperty('boyfriend.x') -1100, getProperty('boyfriend.y') +10)
	addAnimationByPrefix('bfattack', 'attack', '0BF attack copy instance 1', 24, false) 
	addLuaSprite('bfattack', true) 
	setProperty('bfattack.alpha', 0)
	
	makeAnimatedLuaSprite('dodgesans', 'characters/Sans_Phase_3', getProperty('dad.x') -100, getProperty('dad.y') -5)
	addAnimationByPrefix('dodgesans', 'fuck', 'SansDodge instance 1', 20, false) 
	addAnimationByPrefix('dodgesans', 'fuck2', 'SansDodgeTired instance 1', 20, false) 
	addLuaSprite('dodgesans', true) 
	setProperty('dodgesans.visible', false)
	
	makeAnimatedLuaSprite('si', 'characters/Sans', getProperty('dad.x') -20, getProperty('dad.y') -5)
	addAnimationByPrefix('si', 'fuck', 'Switch to UT mode instance 1', 24, false) 
	addLuaSprite('si', true) 
	setProperty('si.visible', false) 
	
	
   makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  50, 255);
	scaleObject('attackbutton', 0.5, 0.5) 
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackcounter', 'AttackNA instance 1', 20, false);
	objectPlayAnimation('attackbutton', 'attack')
	setProperty('attackbutton.alpha', 0.5)
	addLuaSprite('attackbutton', true)
	makeLuaSprite('battle', 'battle', 0, 0);  
        
end

function onUpdate() 
     if canattack and addattacks == true and getMouseX('camHUD') > 0 and getMouseX('camHUD') < 100 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') or keyPressed('space') then
         setProperty('bfattack.alpha', 1)
         setProperty('boyfriend.visible', false) 
         runTimer('sans', 0.3)
         objectPlayAnimation('bfattack', 'attack', false) 
         objectPlayAnimation('attackbutton', 'attackcounter', false)
         canattack = false;
         attacks = attacks + 1
          playSound('Throw1', 1)
     end
     
     
     if dadName == 'sansfinaltired' then 
         Tired = true;
     end
end

function onTimerCompleted(t) 
     if t == 'sans' then
        setProperty('dodgesans.visible', true) 
         setProperty('dad.visible',false) 
         objectPlayAnimation('dodgesans', 'fuck', false)
      end 
     
     if t == 'sans' and Tired == true then
        setProperty('dodgesans.visible', true) 
         setProperty('dad.visible',false) 
         objectPlayAnimation('dodgesans', 'fuck2 ', false)
     end 
end 
function onUpdatePost() 
      
	if getProperty('attackbutton.animation.curAnim.name') == 'attackcounter' then
        if getProperty('attackbutton.animation.curAnim.finished') then
            canattack = true;
            objectPlayAnimation('attackbutton', 'attack', false) 
        end
    end
    
    if getProperty('bfattack.animation.curAnim.name') == 'attack' then
        if getProperty('bfattack.animation.curAnim.finished') then
            setProperty('bfattack.alpha', 0)
            setProperty('boyfriend.visible', true)
        end
    end
    
    if getProperty('dodgesans.animation.curAnim.name') == 'fuck' then
        if getProperty('dodgesans.animation.curAnim.finished') then
            setProperty('dodgesans.visible', false) 
         setProperty('dad.visible', true) 
        end
    end
    
    if getProperty('dodgesans.animation.curAnim.name') == 'fuck2, ' then
        if getProperty('dodgesans.animation.curAnim.finished') then
            setProperty('dodgesans.visible', false) 
         setProperty('dad.visible', true) 
        end
    end
end 

function onStepHit() 
    if curStep == 1665 then
        Tired = true
    end
end 

