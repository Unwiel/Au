-- CODE BY SHADOW MARIO, DO NOT FORGET TO CREDIT
allowStart = false;
dialogueShit = {};
dialogueIsDad = {};

function onEvent(name, value1, value2) 
    if name == 'Senpai_Dialogue_Cutscene' then
       dialogueType = (value1) 
	   type = (value2) 
    end
end 
function onStartCountdown()
	if not allowStart and not seenCutscene then
		doReturn = false;
				startSenpaiCutscene(dialogueType, type);
				doReturn = true;
				
			
		

		if doReturn then
			setProperty('inCutscene', true);
			return Function_Stop;
		end
	end
	return Function_Continue;
end

dialogueLineName = ''
dialogueLineType = ''
dialogueSound = 'pixelText';
dialogueSoundClick = 'clickText';

curDialogue = 0;

dialogueOpened = false;
dialogueStarted = false;
dialogueEnded = false;
dialogueGone = false;
curCharacterIsDad = true;
targetText = 'blah blah coolswag';
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'start senpai dialogue' then
		allowStart = true;
		
		makeAnimatedLuaSprite('portraitLeft', 'weeb/senpaiPortrait', -20, 40);
		pixelThingie('portraitLeft', 5.4, true);
		addAnimationByPrefix('portraitLeft', 'enter', 'Senpai Portrait Enter', 24, false);
		setProperty('portraitLeft.visible', false);
		
		setProperty('camOther._fxFadeAlpha', 0);
		removeLuaSprite('senpaiEvil');
		removeLuaSprite('senpaiBlack');
		setProperty('camHUD.visible', true);
		
		bfImage = 'weeb/bfPortrait';
		if dialogueLineName == 'daftpunk' then
			bfImage = 'daftpunk/bfPortrait';
		elseif dialogueLineName == 'terraria' then
			bfImage = 'terraria/bfPortrait';
		end

		makeAnimatedLuaSprite('portraitRight', bfImage, -20, 40);
		pixelThingie('portraitRight', 5.4, true);
		addAnimationByPrefix('portraitRight', 'enter', 'Boyfriend portrait enter', 24, false);
		setProperty('portraitRight.visible', false);

		if dialogueLineType == 'thorns' then
			spiritImage = 'weeb/spiritFaceForward';
			if dialogueLineName == 'clubpenguin' then
				spiritImage = 'clubpenguin/spiritFaceForward';
			elseif dialogueLineName == 'giygas' then
				spiritImage = 'giygas/spiritFaceForward';
			end

			makeLuaSprite('spiritUgly', spiritImage, 320, 170);
			pixelThingie('spiritUgly', 6, false);
		end

		if dialogueLineType == 'thorns' then
			boxImage = 'weeb/pixelUI/dialogueBox-evil';
			if dialogueLineName == 'giygas' then
				boxImage = 'giygas/dialogueBox-evil';
			end
			
			makeAnimatedLuaSprite('dialogueBox', boxImage, -20, 45);
			addAnimationByPrefix('dialogueBox', 'normalOpen', 'Spirit Textbox spawn', 24, false);
			addAnimationByIndices('dialogueBox', 'normal', 'Spirit Textbox spawn instance 1', '11', 24);
		elseif dialogueLineType == 'roses' then
			boxImage = 'weeb/pixelUI/dialogueBox-senpaiMad';
			if dialogueLineName == 'daftpunk' then
				boxImage = 'daftpunk/dialogueBox-senpaiMad';
			elseif dialogueLineName == 'terraria' then
				boxImage = 'terraria/dialogueBox-senpaiMad';
			end

			makeAnimatedLuaSprite('dialogueBox', boxImage, -20, 45);
			addAnimationByPrefix('dialogueBox', 'normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
			addAnimationByIndices('dialogueBox', 'normal', 'SENPAI ANGRY IMPACT SPEECH instance 1', '4', 24);
		else
			makeAnimatedLuaSprite('dialogueBox', 'weeb/pixelUI/dialogueBox-pixel', -20, 45);
			addAnimationByPrefix('dialogueBox', 'normalOpen', 'Text Box Appear', 24, false);
			addAnimationByIndices('dialogueBox', 'normal', 'Text Box Appear instance 1', '4', 24);
		end
		pixelThingie('dialogueBox', 5.4, true);
		screenCenter('dialogueBox', 'x');
		screenCenter('portraitLeft', 'x');
		
		handImage = 'weeb/pixelUI/hand_textbox';
		if dialogueLineName == 'giygas' then
			handImage = 'giygas/hand_textbox';
		end

		makeLuaSprite('handSelect', handImage, 1042, 590);
		pixelThingie('handSelect', 5.4, true);
		setProperty('handSelect.visible', false);

		if dialogueLineName == 'terraria' then
			setProperty('handSelect.x', -9999);
		end

		makeLuaText('dropText', '', screenWidth * 0.6, 242, 502);
		setTextFont('dropText', 'comic-sans-ms.ttf');
		setTextColor('dropText', 'D89494');
		setTextBorder('dropText', 0, 0);
		setTextSize('dropText', 32);
		setTextAlignment('dropText', 'left');
		addLuaText('dropText');

		makeLuaText('swagDialogue', '', screenWidth * 0.6, 240, 500);
		setTextFont('swagDialogue', 'comic-sans-ms.ttf');
		setTextColor('swagDialogue', '3F2021');
		setTextBorder('swagDialogue', 0, 0);
		setTextSize('swagDialogue', 32);
		setTextAlignment('swagDialogue', 'left');
		addLuaText('swagDialogue');
		
		if dialogueLineType == 'thorns' then
			setTextColor('dropText', '000000');
			setTextColor('swagDialogue', 'FFFFFF');
		end
		--startCountdown();
	elseif tag == 'remove black' then
		setProperty('senpaiBlack.alpha', getProperty('senpaiBlack.alpha') - 0.15);
	elseif tag == 'increase bg fade' then
		newAlpha = getProperty('bgFade.alpha') + (1 / 5) * 0.7;
		if newAlpha > 0.7 then
			newAlpha = 0.7;
		end
		setProperty('bgFade.alpha', newAlpha);
	elseif tag == 'add dialogue letter' then
		setTextString('swagDialogue', string.sub(targetText, 0, (loops - loopsLeft)));
		playSound(dialogueSound, 0.8);

		if loopsLeft == 0 then
			--debugPrint('Text finished!')
			setProperty('handSelect.visible', true);
			dialogueEnded = true;
		end
	elseif tag == 'end dialogue thing' then
		newAlpha = loopsLeft / 5;
		cancelTimer('increase bg fade');
		setProperty('bgFade.alpha', newAlpha * 0.7);
		setProperty('dialogueBox.alpha', newAlpha);
		setProperty('swagDialogue.alpha', newAlpha);
		setProperty('dropText.alpha', newAlpha);
		setProperty('handSelect.alpha', newAlpha);
	elseif tag == 'start countdown thing' then
		allowStart = true;
		removeLuaSprite('bgFade');
		removeLuaSprite('dialogueBox');
		removeLuaSprite('handSelect');
		removeLuaText('swagDialogue');
		removeLuaText('dropText');
		setProperty('inCutscene', false);
		startCountdown();
		dialogueGone = true;

		removeLuaSprite('spiritUgly');
	elseif tag == 'make senpai visible' then
		setProperty('senpaiEvil.alpha', getProperty('senpaiEvil.alpha') + 0.15);
		if loopsLeft == 0 then
			playSound('Senpai_Dies');
			objectPlayAnimation('senpaiEvil', 'die');
			runTimer('start flash', 3.2);
		end
	elseif tag == 'start flash' then
		cameraFade('other', 'FFFFFF', 1.6, true);
	end
end

isEnding = false;
function onUpdate(elapsed)
	if dialogueGone then
		return;
	end

	if getProperty('dialogueBox.animation.curAnim.name') == 'normalOpen' and getProperty('dialogueBox.animation.curAnim.finished') then
		objectPlayAnimation('dialogueBox', 'normal');
		dialogueOpened = true;
	end
	
	if dialogueOpened and not (dialogueStarted) then
		startDialogueThing();
		objectPlayAnimation('portraitLeft', 'enter', true);
		dialogueStarted = true;
	end

	if mousePressed('left') == true then
		if dialogueEnded then
			curDialogue = curDialogue + 1;
			if curDialogue > table.maxn(dialogueShit) then
				if not isEnding then
					removeLuaSprite('portraitLeft');
					removeLuaSprite('portraitRight');
					runTimer('end dialogue thing', 0.2, 5);
					runTimer('start countdown thing', 1.5);
					soundFadeOut(nil, 1.5);
					isEnding = true;
					playSound(dialogueSoundClick, 0.8);
				end
			else
				startDialogueThing();
				playSound(dialogueSoundClick, 0.8);
			end
		elseif dialogueStarted then
			cancelTimer('add dialogue letter');
			onTimerCompleted('add dialogue letter', string.len(targetText), 0);
			playSound(dialogueSoundClick, 0.8);
		end
	end
	setTextString('dropText', getTextString('swagDialogue'));
end

function startDialogueThing()
	reloadDialogue();
	runTimer('add dialogue letter', 0.04, string.len(targetText));
end

function reloadDialogue()
	curCharacterIsDad = dialogueIsDad[curDialogue];
	targetText = dialogueShit[curDialogue];

	setTextString('dropText', '');
	setTextString('swagDialogue', '');
	setProperty('handSelect.visible', false);
	dialogueEnded = false;

	if curCharacterIsDad then
		setProperty('portraitRight.visible', false);
		if getProperty('portraitLeft.visible') == false then
			if dialogueLineType == 'senpai' then
				setProperty('portraitLeft.visible', true);
			end
			objectPlayAnimation('portraitLeft', 'enter');
		end
	else
		setProperty('portraitLeft.visible', false);
		if getProperty('portraitRight.visible') == false then
			setProperty('portraitRight.visible', true);
			objectPlayAnimation('portraitRight', 'enter');
		end
	end
end

function startSenpaiCutscene(dialogueType, type)
	makeLuaSprite('bgFade', nil, -200, -200);
	makeGraphic('bgFade', screenWidth * 1.3, screenHeight * 1.3, 'B3DFD8');
	setProperty('bgFade.alpha', 0);
	setScrollFactor('bgFade', 0, 0);
	setObjectCamera('bgFade', 'hud');
	runTimer('increase bg fade', 0.83, 5);

	if type == 'senpai' then
		makeLuaSprite('senpaiBlack', nil, -100, -100);
		makeGraphic('senpaiBlack', screenWidth * 2, screenHeight * 2, '000000');
		setScrollFactor('senpaiBlack', 0, 0);
		addLuaSprite('senpaiBlack', true);
		runTimer('remove black', 0.3, 7);
	elseif type == 'thorns' then
		makeLuaSprite('senpaiBlack', nil, -100, -100);
		makeGraphic('senpaiBlack', screenWidth * 2, screenHeight * 2, 'FF1B31');
		setScrollFactor('senpaiBlack', 0, 0);
		addLuaSprite('senpaiBlack', true);

		assetName = 'weeb/senpaiCrazy';
		if dialogueType == 'clubpenguin' then
			assetName = 'clubpenguin/senpaiCrazy';
		end

		makeAnimatedLuaSprite('senpaiEvil', assetName, 0, 0);
		addAnimationByIndices('senpaiEvil', 'idle', 'Senpai Pre Explosion instance 1', '0', 24);
		addAnimationByPrefix('senpaiEvil', 'die', 'Senpai Pre Explosion', 24, false);
		scaleObject('senpaiEvil', 6, 6);
		setScrollFactor('senpaiEvil', 0, 0);
		screenCenter('senpaiEvil')
		setProperty('senpaiEvil.x', getProperty('senpaiEvil.x') + 300);
		setProperty('senpaiEvil.antialiasing', false);
		setProperty('senpaiEvil.alpha', 0);
		addLuaSprite('senpaiEvil', true);

		setProperty('camHUD.visible', false);
		runTimer('make senpai visible', 0.3, 7);
	end

	dialogueLineName = dialogueType;
	dialogueLineType = type;
	if dialogueType == 'senpai' then
		dialogueShit[0] = 'Ah, a new fair maiden has come in search of true love!';
		dialogueIsDad[0] = true;
		dialogueShit[1] = 'A serenade between gentlemen shall decide where her beautiful heart shall reside.';
		dialogueIsDad[1] = true;
		dialogueShit[2] = 'Beep bo bop';
		dialogueIsDad[2] = false;
	elseif dialogueType == 'daftpunk' then
		dialogueShit[0] = 'Pas mal pour un gringalet.';
		dialogueIsDad[0] = true;
		dialogueShit[1] = 'Mais cette fois, je vais t\'arracher les couilles pour que ta copine\npuisse savourer les miennes.';
		dialogueIsDad[1] = true;
		dialogueShit[2] = 'Bip boop bi bi skdoowap';
		dialogueIsDad[2] = false;
	elseif dialogueType == 'roses' then
		dialogueShit[0] = 'Not bad for an ugly worm.';
		dialogueIsDad[0] = true;
		dialogueShit[1] = 'But this time I\'ll rip your nuts off right after your girlfriend\nfinishes gargling mine.';
		dialogueIsDad[1] = true;
		dialogueShit[2] = 'Bop beep be be skdoo bep';
		dialogueIsDad[2] = false;
	elseif dialogueType == 'terraria' then
		dialogueShit[0] = 'Skeletron has awoken!';
		dialogueIsDad[0] = true;
		dialogueShit[1] = 'Bop beep be be skdoo bep';
		dialogueIsDad[1] = false;
		dialogueShit[2] = 'A rap battle is brewing...?';
		dialogueIsDad[2] = true;
	elseif dialogueType == 'clubpenguin' then
		dialogueShit[0] = 'Direct contact with real\nfigments, after being banned\nfrom the channel for so long...';
		dialogueIsDad[0] = true;
		dialogueShit[1] = 'and HER of all people.';
		dialogueIsDad[1] = true;
		dialogueShit[2] = 'I\'ll make her grandad pay for\nwhat he\'s done to me and all the others...';
		dialogueIsDad[2] = true;
		dialogueShit[3] = 'I\'ll rip you and make you take my place.';
		dialogueIsDad[3] = true;
		dialogueShit[4] = 'You don\'t mind your jokes being borrowed right? It\'s only fair...';
		dialogueIsDad[4] = true;
	elseif dialogueType == 'giygas' then
		dialogueShit[0] = '...boyfriend...';
		dialogueIsDad[0] = true;
		dialogueShit[1] = '...i\'m h...a...p...p...y...';
		dialogueIsDad[1] = true;
		dialogueShit[2] = '...';
		dialogueIsDad[2] = true;
		dialogueShit[3] = 'it hurts...';
		dialogueIsDad[3] = true;
		dialogueShit[4] = 'it hurts...it hurts...it hurts...';
		dialogueIsDad[4] = true;
	end

	timerTime = 2; --stupid name
	if type == 'thorns' then
		timerTime = 9.2;
	end
	runTimer('start senpai dialogue', timerTime);
end

function pixelThingie(tag, scale, doUpdateHitbox)
	if doUpdateHitbox then
		scaleObject(tag, scale, scale);
	else
		setProperty(tag..'.scale.x', scale);
		setProperty(tag..'.scale.y', scale);
	end
	setScrollFactor(tag, 0, 0);
	setObjectCamera(tag, 'hud');
	setProperty(tag..'.antialiasing', false);
	addLuaSprite(tag, true);
end