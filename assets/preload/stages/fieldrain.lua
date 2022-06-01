function onCreatePost()

    for i=0,3 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'cumhead')
        setPropertyFromGroup('playerStrums', i, 'texture', 'cumhead') 
    end

end
function onCreate()
	makeLuaSprite('BG0', 'angry/CH-RN-00', 0, -200);
	setLuaSpriteScrollFactor('BG0', 0.5, 0.5);

	makeLuaSprite('BG1', 'angry/CH-RN-01', 0, 0);
	setLuaSpriteScrollFactor('BG1', 0.8, 0.8);

	makeLuaSprite('Ground', 'angry/CH-RN-02', 0, 0);
	makeAnimatedLuaSprite('a', 'CUpheqdshid', 0, 0);
	addAnimationByPrefix('a', 'a', 'Cupheadshit_gif instance 1', 24, true) 
	setObjectCamera('a', 'other') 
	
	scaleObject('BG0', 4, 4)
	scaleObject('BG1', 4, 4)
	scaleObject('Ground', 4, 4)
	
	makeAnimatedLuaSprite('rain1', 'angry/NewRAINLayer01', 0, 0)
	addAnimationByPrefix('rain1', 'rain', 'RainFirstlayer instance 1', 20, true) 
	
	makeAnimatedLuaSprite('rain2', 'angry/NewRAINLayer02', 0, 0)
	addAnimationByPrefix('rain2', 'rain', 'RainFirstlayer instance 1', 20, true) 
	
	scaleObject('rain1', 4, 4)
	scaleObject('rain2', 4, 4)

	addLuaSprite('BG0', false);
	addLuaSprite('BG1', false);
	addLuaSprite('Ground', false);	
	addLuaSprite('rain1', true) 
	addLuaSprite('rain2', true) 
	addLuaSprite('a', false);	
end

