local iscard = false;
local canattack = false;
local shooting = false;
local scaleshit = true;
local shootsxd = 0;
local updown = {1300, 1250, 1220}
local pea = {'attacks/pea0' , 'attacks/pea1' , 'attacks/pea2' , 'attacks/pea3' , 'attacks/pea4' , 'attacks/pea5' }
local a = {'Shot02 instance 1', 'Shot03 instance 1', 'Shot04 instance 1', 'Shot05 instance 1'}

function onCreate()
      makeLuaSprite('card', 'cardfull', getProperty('healthBarBG.x') +650, getProperty('healthBarBG.y') -50) 
	setObjectCamera('card', 'hud')
	setProperty('card.scale.y', 0.01)
	setProperty('card.alpha', 0)
	addLuaSprite('card', true)
	
	makeAnimatedLuaSprite('shoot', 'characters/Cuphead_Remastered', getProperty('dad.x') -1, getProperty('dad.y') -80)
	addAnimationByPrefix('shoot', 'shoot', 'Shoot instance 1', 24, false) 
	addLuaSprite('shoot', true) 
	scaleObject('shoot', 1.7, 1.7) 
	setProperty('shoot.alpha', 0)
	
	makeAnimatedLuaSprite('cupfuck', 'characters/Nightmare_Cuphead', getProperty('dad.x') -250, getProperty('dad.y') +50)
	addAnimationByPrefix('cupfuck', 'fuck', 'Dodgez instance 1', 24, false) 
	addLuaSprite('cupfuck', true) 
	scaleObject('cupfuck', 1.45, 1.45) 
	setProperty('cupfuck.visible', false)
	
	makeAnimatedLuaSprite('bfattack', 'characters/BoyFriend_NM', getProperty('boyfriend.x') -1500, getProperty('boyfriend.y') +10)
	addAnimationByPrefix('bfattack', 'attack', '0BF attack instance 1', 24, false) 
	addLuaSprite('bfattack', true) 
	scaleObject('bfattack', 1.2, 1.2) 
	setProperty('bfattack.alpha', 0)

	makeAnimatedLuaSprite('cardnotflipped', 'Cardcrap',getProperty('healthBarBG.x') +645, getProperty('healthBarBG.y') -135)  
	addAnimationByPrefix('cardnotflipped', 'popoutnormal', 'Card Normal Pop out instance 1', 24, false);
	addAnimationByPrefix('cardnotflipped', 'popoutparry', 'PARRY Card Pop out  instance 1', 24, false);
	addAnimationByPrefix('cardnotflipped', 'byehaveagreattime', 'Card Used instance 1', 24, false);
	addLuaSprite('cardnotflipped', true)
	setObjectCamera('cardnotflipped', 'hud')
	setProperty('cardnotflipped.alpha', 0)
	
	makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  50, 260);
	scaleObject('attackbutton', 0.5, 0.5) 
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	setProperty('attackbutton.alpha', 0.5)
	addLuaSprite('attackbutton', true)
	
	makeAnimatedLuaSprite('dodgebutton', 'Notmobilegameanymore',  50, 320);
	scaleObject('dodgebutton', 0.5, 0.5) 
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'attack', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('dodgebutton', 'attack')
	setProperty('dodgebutton.alpha', 0.5)
	addLuaSprite('dodgebutton', true)
end

function goodNoteHit(id, d, noteType, isSustainNote)
    if scaleshit and not isSustainNote then
        setProperty('card.scale.y', getProperty('card.scale.y') + 0.01)
        setProperty('card.alpha', 1)
        setProperty('card.y', getProperty('card.y') - 0.5)
    end
    
    if noteType == 'Parry note' and not iscard then
       cardparry()
     end 
end

function onEvent(name, value1, value2) 
	if name == 'A' then
       runTimer('a', 0.15, 0)
       shooting = true;
    end
    
    
end


function onUpdate() 
if getProperty('card.scale.y') > 0.9 then
	      scaleshit = false;         
end
      if canattack and getMouseX('camHUD') > 0 and getMouseX('camHUD') < 100 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') then
         setProperty('bfattack.alpha', 1)
         playSound('pre_shoot', 0.5)
         setProperty('boyfriend.alpha', 0)
         
         runTimer('cupfucked', 0.2)
         objectPlayAnimation('bfattack', 'attack', false) 
         canattack = false;
         objectPlayAnimation('cardnotflipped', 'byehaveagreattime', false) 
         
      end
      if getProperty('dad.animation.curAnim.name') == 'singRIGHT' and shooting then
        if getProperty('dad.animation.curAnim.finished') then
            runTimer('a', 0.15, 0)
            
        end
    end
      
      if getProperty('dad.animation.curAnim.name') == 'singUP' and shooting then
        if getProperty('dad.animation.curAnim.finished') then
            runTimer('a', 0.15, 0)
        end
    end
    
    if getProperty('dad.animation.curAnim.name') == 'singDOWN' and shooting then
        if getProperty('dad.animation.curAnim.finished') then
            runTimer('a', 0.15, 0)
        end
    end

    
    if getProperty('dad.animation.curAnim.name') == 'singLEFT' and shooting then
        if getProperty('dad.animation.curAnim.finished') then
            runTimer('a', 0.15, 0)
        end
    end
    
    
    
end

function opponentNoteHit() 
    if shooting then
      cancelTimer('a') 
    end
    
    cameraShake('hud', 0.01, 0.05) 
    cameraShake('game', 0.010, 0.05) 

    
end 
function onTimerCompleted(tag) 

   
   if tag == 'cupfucked' then
     setProperty('dad.visible', false)
     setProperty('cupfuck.visible', true)
     objectPlayAnimation('cupfuck', 'fuck', false) 
     playSound('attacks/dodge', 1)
  end
  if tag == 'cupfucked' and shooting then
     setProperty('dad.visible', false)
     setProperty('cupfuck.visible', true)
     objectPlayAnimation('cupfuck', 'fuck', false) 
     playSound('attacks/dodge', 1)
     shooting = false;
     canattack = false;
     setProperty('shoot.alpha', 0)
     cancelTimer('a') 
  end
  
  if tag == 'a' then
       shootsxd = shootsxd + 1
       
       characterPlayAnim('dad', 'shoot', false) 
       
       setProperty('health', getProperty('health') -0.10)
       makeAnimatedLuaSprite('blue1'.. shootsxd, 'bull/NMcupheadBull', getProperty('dad.x') +400 , getProperty('dad.y') +50)
       addLuaSprite('blue1'.. shootsxd, true) 
       scaleObject('blue1'.. shootsxd, 1.4, 1.4)
        playSound(pea[getRandomInt(1, #pea)], 0.3)
        
       addAnimationByPrefix('blue1'.. shootsxd, 'tween1', a[getRandomInt(1, #a)], 24, false)
       
       
       
       
       
   end
end

function onUpdatePost() 
      
	if getProperty('cardnotflipped.animation.curAnim.name') == 'byehaveagreattime' then
        if getProperty('cardnotflipped.animation.curAnim.finished') then
            cardgoodbye()
        end
    end
    if getProperty('bfattack.animation.curAnim.name') == 'attack' then
        if getProperty('bfattack.animation.curAnim.finished') then
            setProperty('bfattack.alpha', 0)
            setProperty('boyfriend.alpha', 1)
        end
    end
    
    if getProperty('cupfuck.animation.curAnim.name') == 'fuck' then
        if getProperty('cupfuck.animation.curAnim.finished') then
            setProperty('cupfuck.visible', false)
            setProperty('dad.visible', true)
        end
    end
    
    if getProperty('shit.animation.curAnim.name') == 'tween' then
        if getProperty('shit.animation.curAnim.finished') then
            removeLuaSprite('shit') 
        end
    end
    
    for i = 0,shootsxd do
		if getProperty('blue1' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('blue1' .. i);
			
		end
	
	
		
	end
        
    
end



function cardparry()
     iscard = true;
     setProperty('cardnotflipped.alpha', 1)
     objectPlayAnimation('cardnotflipped', 'popoutparry', false) 
     setProperty('card.scale.y', 0.01)
	setProperty('card.alpha', 0)
	setProperty('card.y', getProperty('healthBarBG.y') -50)
	scaleshit = false;           
	canattack = true;
end

function cardgoodbye()
     iscard = false;
     setProperty('cardnotflipped.alpha', 0)
	scaleshit = true;           
	canattack = false;
end




