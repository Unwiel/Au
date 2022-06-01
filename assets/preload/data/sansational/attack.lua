
state = true;
shouldAdd = true;

function onUpdate(elapsed)
	if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 100) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') then
		objectPlayAnimation('attack', 'Pressed', false);
	else
		objectPlayAnimation('attack', 'nonPress', false);
	end
end

function onCreate()  --random shit lol
	makeAnimatedLuaSprite('attack', 'button', 0, 582.5);
	addAnimationByPrefix('attack', 'nonPress', 'nonPress', 24, false);
	addAnimationByPrefix('attack', 'Pressed', 'Pressed', 12, false);
	addLuaSprite('attack', false);
	setObjectCamera('attack', 'other');
end