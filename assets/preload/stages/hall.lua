local utSwitchCam = false
function onCreate()
	makeLuaSprite('hall', 'hall', -5, 0);	  
	addLuaSprite('hall', false);
	scaleObject('hall', 1.5, 1.5)
	doTweenColor('bfColorTween', 'boyfriend', 'FF0000', 1, 'linear')
	
end


