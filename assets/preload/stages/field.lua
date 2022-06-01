function onCreatePost()

    for i=0,3 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'cumhead')
        setPropertyFromGroup('playerStrums', i, 'texture', 'cumhead') 
    end

end

function onCreate()
	makeLuaSprite('BG0', 'BG-00', 0, -200);
	setLuaSpriteScrollFactor('BG0', 0.5, 0.5);

	makeLuaSprite('BG1', 'BG-01', 0, 0);
	setLuaSpriteScrollFactor('BG1', 0.8, 0.8);

	makeLuaSprite('Ground', 'Foreground', 0, 0);
	makeAnimatedLuaSprite('a', 'CUpheqdshid', 0, 0);
	addAnimationByPrefix('a', 'a', 'Cupheadshit_gif instance 1', 24, true) 
	setObjectCamera('a', 'other') 
	
	scaleObject('BG0', 4, 4)
	scaleObject('BG1', 4, 4)
	scaleObject('Ground', 4, 4)
	
	
	

	addLuaSprite('BG0', false);
	addLuaSprite('BG1', false);
	addLuaSprite('Ground', false);	
	addLuaSprite('a', false);	
end

