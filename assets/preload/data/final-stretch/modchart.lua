function onCreate() 
  makeLuaSprite('si', 'white', 0, 0)
  scaleObject('si', 55, 55)
  addLuaSprite('si', false) 
  setProperty('si.alpha', 0)
  makeLuaSprite('waterfall', 'Waterfall', 10, 50);	  
	addLuaSprite('waterfall', false);
	setProperty('waterfall.alpha', 0)
	setProperty('waterfall.scale.x', 1.2)
	
	makeLuaSprite('shitup', 'black', -150, -500);	  
	addLuaSprite('shitup', false);
	setObjectCamera('shitup', 'other') 
	
	setProperty('shitup.scale.y', 2)
	setProperty('shitup.scale.x', 10)
	
	makeLuaSprite('shitup2', 'black', -150, 900);	  
	addLuaSprite('shitup2', false);
	setObjectCamera('shitup2', 'other') 
	
	setProperty('shitup2.scale.y', 2)
	setProperty('shitup2.scale.x', 10)
	
	

end

function onStepHit() 
     if curStep == 764 then
          setProperty('camGame.alpha', 0)
          setProperty('waterfall.alpha', 1)
          playSound('countdown', 1)
          setProperty('defaultCamZoom', 0.9)
     end
     
     if curStep == 768 then
         setProperty('camGame.alpha', 1)
     end 
     
     if curStep == 900 then 
         cinematic()
      end
      
       if curStep == 1152 then 
         cinematicout()
      end
      
      if curStep == 1278 then
          setProperty('camGame.alpha', 0) 
          setProperty('defaultCamZoom', 1.00)
          setProperty('waterfall.alpha', 0)
          playSound('countdown', 1)
     end
     
     if curStep == 1282 then
         setProperty('camGame.alpha', 1)
     end 
     
     if curStep == 1794 then 
         cinematic()
        doTweenAlpha('oi', 'si', 1, 1, 'linear') 
        doTweenColor('negro', 'dad', '000000', 1, 'linear')  
        doTweenColor('negro2', 'boyfriend', '000000', 1, 'linear')   
      end
      
       if curStep == 2048 then 
         cinematicout()
         doTweenAlpha('oif', 'si', 0, 1, 'linear') 
         doTweenColor('a', 'hall', 'FFFFFFFF', 1, 'linear') 
        doTweenColor('e', 'dad', 'FFFFFFFF', 1, 'linear')  
        doTweenColor('i', 'boyfriend', 'FFFFFFFF', 1, 'linear')    
      end
end

function cinematic()
      doTweenY('abajo', 'shitup', -400, 1.5, 'linear') 
      doTweenY('arriba', 'shitup2', 800, 1.5, 'linear') 
       noteTweenY('fuck', 0, 120, 1.5, 'linear')
       noteTweenY('fuck2', 1, 118, 1.5, 'linear')
       noteTweenY('fuck3', 2, 118, 1.5, 'linear')
       noteTweenY('fuck33', 3, 118, 1.5, 'linear')
       noteTweenY('fuck4', 4, 118, 1.5, 'linear')
       noteTweenY('fuck5', 5, 118, 1.5, 'linear')
       noteTweenY('fuck6', 6, 118, 1.5, 'linear')
       noteTweenY('fuck7', 7, 118, 1.5, 'linear')
       noteTweenY('fuck8', 8, 118, 1.5, 'linear')
end

function cinematicout()
      doTweenY('abajo', 'shitup', -500, 1.5, 'linear') 
      doTweenY('arriba', 'shitup2', 900, 1.5, 'linear') 
       noteTweenY('fuck', 0, 50, 1.5, 'linear')
       noteTweenY('fuck2', 1, 50, 1.5, 'linear')
       noteTweenY('fuck3', 2, 50, 1.5, 'linear')
       noteTweenY('fuck33', 3, 50, 1.5, 'linear')
       noteTweenY('fuck4', 4, 50, 1.5, 'linear')
       noteTweenY('fuck5', 5, 50, 1.5, 'linear')
       noteTweenY('fuck6', 6, 50, 1.5, 'linear')
       noteTweenY('fuck7', 7, 50, 1.5, 'linear')
       noteTweenY('fuck8', 8, 50, 1.5, 'linear')
end