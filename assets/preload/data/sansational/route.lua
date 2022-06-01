local genocide = false;
local pacifist = true;
local canattack = true;
local addattacks = true;
local attacks = 0
function onCreate()
    makeAnimatedLuaSprite('dodgebutton', 'Notmobilegameanymore',  50, 320);
	scaleObject('dodgebutton', 0.5, 0.5) 
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'attack', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('dodgebutton', 'attack')
	setProperty('dodgebutton.alpha', 0.5) 
	addLuaSprite('dodgebutton', true)
	
	makeAnimatedLuaSprite('bfattack', 'characters/BoyFriend_CRshader', getProperty('boyfriend.x') -1100, getProperty('boyfriend.y') +10)
	addAnimationByPrefix('bfattack', 'attack', '0BF attack instance 1', 24, false) 
	addLuaSprite('bfattack', true) 
	setProperty('bfattack.alpha', 0)
	
	makeAnimatedLuaSprite('dodgesans', 'characters/Sans', getProperty('dad.x') -100, getProperty('dad.y') -5)
	addAnimationByPrefix('dodgesans', 'fuck', 'SansDodge instance 1', 20, false) 
	addLuaSprite('dodgesans', true) 
	setProperty('dodgesans.visible', false)
	
	makeAnimatedLuaSprite('si', 'characters/Sans', getProperty('dad.x') -20, getProperty('dad.y') -5)
	addAnimationByPrefix('si', 'fuck', 'Switch to UT mode instance 1', 24, false) 
	addLuaSprite('si', true) 
	setProperty('si.visible', false) 
	
	
   makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  50, 255);
	scaleObject('attackbutton', 0.5, 0.5) 
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackcounter', 'AttackNA instance 1', 20, false);
	objectPlayAnimation('attackbutton', 'attack')
	setProperty('attackbutton.alpha', 0.5)
	addLuaSprite('attackbutton', true)
	makeLuaSprite('battle', 'battle', 0, 0);  
        
end

function onUpdate() 
     if canattack and addattacks == true and getMouseX('camHUD') > 0 and getMouseX('camHUD') < 100 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') or keyPressed('space') then
         setProperty('bfattack.alpha', 1)
         setProperty('boyfriend.visible', false) 
         runTimer('sans', 0.3)
         objectPlayAnimation('bfattack', 'attack', false) 
         objectPlayAnimation('attackbutton', 'attackcounter', false)
         canattack = false;
         attacks = attacks + 1
          playSound('Throw1', 1)
     elseif canattack and addattacks == false and getMouseX('camHUD') > 0 and getMouseX('camHUD') < 100 and getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left') or keyPressed('space') then
         setProperty('bfattack.alpha', 1)
         setProperty('boyfriend.visible', false)
         runTimer('sans', 0.3)
         objectPlayAnimation('bfattack', 'attack', false) 
         objectPlayAnimation('attackbutton', 'attackcounter', false)
         canattack = false;
         playSound('Throw1', 1)
     end
     
     if attacks == 3 then
        addattacks = false;
        playSound('genocide', 1)
        attacks = 0;
        pacifist = false;
        genocide = true;
     end 
     
  for i = 0, getProperty('unspawnNotes.length')-1 do
  
        if genocide == false and getPropertyFromGroup('notes', i, 'noteType') == 'Blue Bone Note 2' then
			setPropertyFromGroup('notes', i, 'texture', 'none');
	    end
		if genocide == false and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blue Bone Note 2' then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			 
		end
		if genocide == true and getPropertyFromGroup('notes', i, 'noteType') == 'Blue Bone Note 2' then
			setPropertyFromGroup('notes', i, 'texture', 'BBONE_assets');
		end
		if genocide == true and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blue Bone Note 2' then
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
		
		if genocide == false and getPropertyFromGroup('notes', i, 'noteType') == 'Orange Bone Note 2' then
			setPropertyFromGroup('notes', i, 'texture', 'none');
	    end
		if genocide == false and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Orange Bone Note 2' then
		    if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end 
		end
		if genocide == true and getPropertyFromGroup('notes', i, 'noteType') == 'Orange Bone Note 2' then
			setPropertyFromGroup('notes', i, 'texture', 'OBONE_assets');
		end
		if genocide == true and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Orange Bone Note 2' then
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
     
 end 
end

function onTimerCompleted(t) 
     if t == 'sans' then
        setProperty('dodgesans.visible', true) 
         setProperty('dad.visible',false) 
         objectPlayAnimation('dodgesans', 'fuck', false)
     end 
end 
function onUpdatePost() 
      
	if getProperty('attackbutton.animation.curAnim.name') == 'attackcounter' then
        if getProperty('attackbutton.animation.curAnim.finished') then
            canattack = true;
            objectPlayAnimation('attackbutton', 'attack', false) 
        end
    end
    
    if getProperty('bfattack.animation.curAnim.name') == 'attack' then
        if getProperty('bfattack.animation.curAnim.finished') then
            setProperty('bfattack.alpha', 0)
            setProperty('boyfriend.visible', true)
        end
    end
    
    if getProperty('dodgesans.animation.curAnim.name') == 'fuck' then
        if getProperty('dodgesans.animation.curAnim.finished') then
            setProperty('dodgesans.visible', false) 
         setProperty('dad.visible', true) 
        end
    end
end 

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Blue Bone Note 2' and genocide == true then
		setProperty('health', -500);
	end
end
-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Orange Bone Note 2' and genocide == true then
		setProperty('health', -500);
	end
end 

function onStepHit() 
    if curStep == 797 and genocide == true then 
        setProperty('si.visible', true) 
        setProperty('dad.alpha', 0) 

        playSound('eye', 1)
    end
    if curStep == 800 and genocide == true then
        setProperty('si.visible', false) 
        setProperty('dad.alpha', 1) 
        triggerEvent('Change Character', 'dad', 'utsans') 
        triggerEvent('Change Character', 'bf', 'utbf') 
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
        setProperty('boyfriend.x', 750);
        setProperty('boyfriend.y', 1500);
        
        
    elseif curStep == 800 and genocide == false then
        setProperty('attackbutton.alpha', 0)
        setProperty('dodgebutton.alpha', 0) 
        setProperty('attack.alpha', 0)
        setProperty('dodge.alpha', 0) 
        canattack = false;
    end
end 
