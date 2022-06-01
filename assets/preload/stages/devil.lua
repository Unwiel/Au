function onCreatePost()

    for i=0,3 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'cumhead')
        setPropertyFromGroup('playerStrums', i, 'texture', 'cumhead') 
    end

end
function onCreate()
	makeLuaSprite('BG0', 'nightmarecupbg', -500, -500);

	makeAnimatedLuaSprite('a', 'CUpheqdshid', 0, 0);
	addAnimationByPrefix('a', 'a', 'Cupheadshit_gif instance 1', 24, true) 
	setObjectCamera('a', 'other') 
	
	
	scaleObject('BG0', 2.7, 2.7)
	
	
	makeLuaSprite('oublack', 'black', 0, 0)
    scaleObject('oublack', 15, 15)
    addLuaSprite('oublack', true) 
    setObjectCamera('oublack', 'hud') 
    setProperty('oublack.alpha', 0) 
    setObjectOrder('oublack', 6)
	

	addLuaSprite('BG0', false);
	addLuaSprite('BG1', false);
	addLuaSprite('Ground', false);	
	addLuaSprite('a', false);	
end

function onBeatHit() 
    if curBeat % 10 == 0 then
        doTweenAlpha('ou', 'oublack', 0.5, 1, 'linear')
    end
    
    if curBeat % 20 == 0 then
        doTweenAlpha('ou', 'oublack', 0, 1, 'linear')
    end 
    
    
end 


