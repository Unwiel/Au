function onCreate()
    precacheImage('Gaster_blasterss') 
    makeLuaSprite('hall2', 'halldark', 0,0)
    addLuaSprite('hall2', false);
	scaleObject('hall2', 1.5, 1.5)
	makeLuaSprite('battle', 'battle', 0, 0);  
	
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
    if curStep == 374 then
        characterPlayAnim('dad', 'fucku', false) 
    end
    if curStep == 376 then
        setProperty('camGame.alpha', 0)
    end
   
   if curStep == 379 then
        setProperty('camGame.alpha', 1)
        setProperty('boyfriend.x', 100);
        setProperty('boyfriend.y', 2500);
        addLuaSprite('battle', false);   
        setProperty('attackbutton.alpha', 0)
        setProperty('hall.alpha', 0) 
        setProperty('dodgebutton.alpha', 0) 
        canattack = false;
        setProperty('attack.alpha', 0)
        setProperty('dodge.alpha', 0) 
        setProperty("defaultCamZoom", 0.4) 
        setProperty('dad.x', 750);
        setProperty('dad.y', 720); 
        
    end
    
    if curStep == 896 then
    setProperty("defaultCamZoom", 0.9) 
    setProperty('attackbutton.alpha', 0.5)
        setProperty('hall.alpha', 1) 
        setProperty('dodgebutton.alpha', 0.5) 
        setProperty('battle.alpha', 0)
        setProperty('attack.alpha', 1)
        setProperty('dodge.alpha', 1) 
        canattack = true;
   end
   
   if curStep == 1146 then
    setProperty("defaultCamZoom", 0.4) 
    setProperty('attackbutton.alpha', 0)
        setProperty('hall.alpha', 0) 
        setProperty('dodgebutton.alpha', 0) 
        setProperty('battle.alpha', 1)
        setProperty('attack.alpha', 0)
        setProperty('dodge.alpha', 0) 
        canattack = false;
   end
   
   if curStep == 1408 then
    setProperty("defaultCamZoom", 0.9) 
    setProperty('attackbutton.alpha', 0.5)
        setProperty('hall.alpha', 1) 
        setProperty('dodgebutton.alpha', 0.5) 
        setProperty('battle.alpha', 0)
        setProperty('attack.alpha', 1)
        setProperty('dodge.alpha', 1) 
        canattack = true;
   end
   
   if curStep == 1665 then
      doTweenAlpha('ou', 'oublack', 0.5, 10, 'linear')
       doTweenAlpha('ou2', 'oublack2', 0.5, 10, 'linear')
   end 
end