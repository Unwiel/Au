function onCreate()
     makeAnimatedLuaSprite('warning', 'DodgeMechs', getProperty('boyfriend.x') -250, getProperty('boyfriend.y') -120)
     addAnimationByPrefix('warning', 'dou1', 'Alarm instance 1', 24, true)
     addLuaSprite('warning', true)
     setProperty('warning.alpha', 0)
    
     makeAnimatedLuaSprite('bones', 'DodgeMechs', getProperty('boyfriend.x') -200, getProperty('boyfriend.y') -100)
     addAnimationByPrefix('bones', 'dou2', 'Bones boi instance 1', 24, false)
     addLuaSprite('bones', true)
     setProperty('bones.alpha', 0)
    
    makeAnimatedLuaSprite('bfdodge', 'DodgeMechs', getProperty('boyfriend.x') -30, getProperty('boyfriend.y') -30)
     addAnimationByPrefix('bfdodge', 'dou3', 'Dodge instance 1', 24, false)
     
    
    
   
    candodge = false 
    dodged = false
   
end
 
function onEvent(name, value1, value2) 
	if name == 'dodgesans' then
	   setProperty('warning.alpha', 1)
	   runTimer('bonesae', 1)
	   candodge = true
	   playSound('notice', 1)
	end 
end 

function onTimerCompleted(t) 
    if t == 'bonesae' and dodged == true then
       addLuaSprite('bfdodge', true)
       setProperty('bones.alpha', 1) 
       setProperty('warning.alpha', 0) 
       setProperty('boyfriend.alpha', 0) 
       setProperty('bfdodge.alpha', 1)
       objectPlayAnimation('bones', 'dou2', false) 
       objectPlayAnimation('bfdodge', 'dou3', false) 
       playSound('sansattack', 1)
       playSound('dodge', 1)
       dodged = false
   elseif t == 'bonesae' and dodged == false then
       setProperty('bones.alpha', 1) 
       objectPlayAnimation('bones', 'dou2', false)
       playSound('sansattack', 1)
       setProperty('warning.alpha', 0)  
       setProperty('health', getProperty('health') -0.5)
       characterPlayAnim('boyfriend', 'singUP-miss', false) 
       candodge = false
   end  
end 
       
function onUpdate() 
    if candodge and getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') or keyPressed('space') then
	    dodged = true
	    candodge = false
	    playSound('dodge', 1)
      end
     
end

function onUpdatePost()
    if getProperty('bones.animation.curAnim.name') == 'dou2' then
        if getProperty('bones.animation.curAnim.finished') then
            setProperty('bones.alpha', 0)
        end
    end
   
   if getProperty('bfdodge.animation.curAnim.name') == 'dou3' then
        if getProperty('bfdodge.animation.curAnim.finished') then
            setProperty('bfdodge.alpha', 0)
            setProperty('boyfriend.alpha', 1)
        end
    end
end 