local greenshit = false;
local greens = 0;
local DadSingAnims = {'singPewLEFT', 'singPewDOWN', 'singPewUP', 'singPewRight'}
local DadSingDir = 1
local chaser = {'attacks/chaser0' , 'attacks/chaser1' , 'attacks/chaser2' , 'attacks/chaser3' , 'attacks/chaser4'}

function opponentNoteHit(id, direction, noteType, isSustainNote) ---so much random bcs yes
   greens = greens + 1 
   if greenshit == true then
      Updown = getRandomInt(0, 5)
      DadSingDir = direction
		characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
     if Updown == 0 then
          makeAnimatedLuaSprite('green3'.. greens, 'bull/GreenShit', getProperty('dad.x') +270 , getProperty('dad.y') -50)
          addAnimationByPrefix('green3'.. greens, 'shit3', 'Greenshit03 instance 1',26, false)
          addLuaSprite('green3'.. greens, true) 
     elseif Updown == 1 then
          makeAnimatedLuaSprite('green2'.. greens, 'bull/GreenShit', getProperty('dad.x') +270 , getProperty('dad.y') -50)
          addAnimationByPrefix('green2'.. greens, 'shit2', 'GreenShit02 instance 1',26,false) 
          addLuaSprite('green2'.. greens, true) 
     else
          makeAnimatedLuaSprite('green'.. greens, 'bull/GreenShit', getProperty('dad.x') +270 , getProperty('dad.y') -50)
          addAnimationByPrefix('green'.. greens, 'shit1', 'GreenShit01 instance 1',26, false)
          addLuaSprite('green'.. greens, true) 
     end
     setProperty('health', getProperty('health') - 0.010)
     playSound(chaser[getRandomInt(1, #chaser)], 1)
      
end

function onUpdatePost() 
    for i = 0,greens do
     if getProperty('green' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('green' .. i);
     end
     
     if getProperty('green3' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('green3' .. i);
     end
     
     if getProperty('green2' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('green2' .. i);
     end
     end
   end
end 
 

function onStepHit() 
      if curStep == 272 then 
          greenshit = true;
       end
       
       if curStep == 308 then 
          greenshit = false;
       end
       
       if curStep == 656 then 
          greenshit = true;
       end
       
       if curStep == 1104 then 
          greenshit = false;
       end
end
       

      