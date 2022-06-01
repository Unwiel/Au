local iscard = false;
local canattack = false;
local shooting = false;
local scaleshit = true;
local shootsxd = 0;
local updown = {1300, 1250, 1220}
local pea = {'attacks/pea0' , 'attacks/pea1' , 'attacks/pea2' , 'attacks/pea3' , 'attacks/pea4' , 'attacks/pea5' }
function onCreate()
      makeLuaSprite('card', 'cardfull', getProperty('healthBarBG.x') +650, getProperty('healthBarBG.y') -50) 
	setObjectCamera('card', 'hud')
	setProperty('card.scale.y', 0.01)
	setProperty('card.alpha', 0)
	addLuaSprite('card', true)
	
	makeAnimatedLuaSprite('shoot', 'characters/Cuphead_Remastered', getProperty('dad.x') -120, getProperty('dad.y') -80)
	addAnimationByPrefix('shoot', 'shoot', 'Shoot instance 1', 24, false) 
	addLuaSprite('shoot', true) 
	scaleObject('shoot', 1.7, 1.7) 
	setProperty('shoot.alpha', 0)
	
	makeAnimatedLuaSprite('cupfuck', 'characters/Cuphead_Remastered', getProperty('dad.x') -280, getProperty('dad.y') -200)
	addAnimationByPrefix('cupfuck', 'fuck', 'Hurt instance 1', 24, false) 
	addLuaSprite('cupfuck', true) 
	scaleObject('cupfuck', 1.7, 1.7) 
	setProperty('cupfuck.alpha', 0)
	
	makeAnimatedLuaSprite('bfattack', 'characters/BoyFriend_Cuphead', getProperty('boyfriend.x') -1100, getProperty('boyfriend.y') +10)
	addAnimationByPrefix('bfattack', 'attack', '0BF attack instance 1', 24, false) 
	addLuaSprite('bfattack', true) 
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
       runTimer('a', 0.13, 0)
       shooting = true;
    end
    
    
end


function onUpdate() 
if getProperty('card.scale.y') > 0.9 then
	      scaleshit = false;         
end
      if canattack and getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') then
         setProperty('bfattack.alpha', 1)
         
         setProperty('boyfriend.alpha', 0)
         
         runTimer('cupfucked', 0.1)
         objectPlayAnimation('bfattack', 'attack', false) 
         objectPlayAnimation('attackbutton', 'attackclick', false) 
         
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
      setProperty('dad.visble', true)
    end
    
    
end 
function onTimerCompleted(tag) 

   
   if tag == 'cupfucked' then
     setProperty('dad.alpha', 0)
     setProperty('cupfuck.alpha', 1)
     objectPlayAnimation('cupfuck', 'fuck', false) 
     setProperty('health', getProperty('health') +1)
     playSound('attacks/hurt', 1)
  end
  if tag == 'cupfucked' and shooting then
     setProperty('dad.alpha', 0)
     setProperty('cupfuck.alpha', 1)
     objectPlayAnimation('cupfuck', 'fuck', false) 
     setProperty('health', getProperty('health') +1)
     playSound('attacks/hurt', 1)
     shooting = false;
     canattack = false;
     setProperty('shoot.alpha', 0)
     cancelTimer('a') 
  end
  
  if tag == 'a' then
       shootsxd = shootsxd + 1
       makeAnimatedLuaSprite('shit', 'bull/Cupheadshoot', getProperty('dad.x') +250 , getProperty('dad.y'))
       addAnimationByPrefix('shit', 'tween', 'BulletFlashFX instance 1', 24, false) 
       addLuaSprite('shit', true) 
       characterPlayAnim('dad', 'shoot', false) 
       setObjectCamera('blue'.. shootsxd, 'game') 
       makeAnimatedLuaSprite('blue'.. shootsxd, 'bull/Cupheadshoot', getProperty('dad.x') +250 , updown[getRandomInt(1, #updown)]) 
       addAnimationByPrefix('blue'.. shootsxd, 'tween', 'BulletFX_H-Tween_02 instance 1', 24, false) 
       addLuaSprite('blue'.. shootsxd, true) 
       playSound(pea[getRandomInt(1, #pea)], 0.5)
       setProperty('health', getProperty('health') -0.10)
       
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
            setProperty('dad.alpha', 1)
            setProperty('cupfuck.alpha', 0)
        end
    end
    
    if getProperty('shit.animation.curAnim.name') == 'tween' then
        if getProperty('shit.animation.curAnim.finished') then
            removeLuaSprite('shit') 
        end
    end
    
    if getProperty('attackbutton.animation.curAnim.name') == 'attackclick' then
        if getProperty('attackbutton.animation.curAnim.finished') then
            objectPlayAnimation('attackbutton', 'attack', false) 
        end
    end
    
    
        
    for i = 0,shootsxd do
		if getProperty('blue' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('blue' .. i);
			
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

