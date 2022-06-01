function onCreate()
  --makeLuaSprites
  makeLuaSprite('black', 'black', 297.5, 20)
  makeLuaSprite('gray', 'gray', 303, 25.25)
  makeLuaSprite('red', 'red', 303, 25.25)
  makeLuaSprite('cuphealthbar', 'healthbar/cuphealthbar', 0, 0)

  --scaleObjects
  scaleObject('black', 2, .065)
  scaleObject('gray', 1.965, .035)
  scaleObject('red', 1.965, .035)
  --scaleObject('healthBar', 0.99, 0.99);

   --lol
  setObjectCamera('black', 'hud')
  setObjectCamera('gray', 'hud')
  setObjectCamera('red', 'hud')

  --addLuaSprites
  addLuaSprite('black', true)
  addLuaSprite('gray', true)
  addLuaSprite('red', true)
  addLuaSprite('cuphealthbar', true)
  
  --makeLuaTexts
  makeLuaText('Watermark', 'Indie Cross Psych Port by Ericio', 0, 4, getProperty('healthBarBG.y') + 58);
  
  --addLuaTexts
  addLuaText('Watermark')
  addLuaText("nametext")

end

function onCreatePost()
   --bruh
   makeLuaText("nametext", songName, 0, 600, 19.5)
  setTextAlignment('nametext', 'left')
   
  --addLuaTexts2
  addLuaText("nametext")

   --setObjectOrders
   setObjectOrder('cuphealthbar', 4)
   setObjectOrder('healthBar', 3)
   setObjectOrder('healthBarBG', 2)

   --setPropertys
   setProperty('timeBarBG.visible', false)
   setProperty('laneunderlayOpponent.visible', false)
   setProperty('laneunderlay.visible', false)
   setProperty('timeBar.visible', false)
   setProperty('timeTxt.visible', false)
   setProperty('scoreTxt.visible', true)
   setProperty('versionTxt.visible', true)
   setProperty('cuphealthbar.x', getProperty('healthBar.x') - 20)
   setProperty('healthbar.angle', getProperty('healthBar.angle'))
   setProperty('cuphealthbar.y', getProperty('healthBar.y') - 20)
   setProperty('cuphealthbar.scale.x', getProperty('healthBar.scale.x'))
   setProperty('cuphealthbar.scale.y', getProperty('cuphealthbar.scale.y'))
   setProperty('cuphealthbar.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
   
   --setObjectCameras
   setObjectCamera('cuphealthbar', 'hud')
   --setObjectCamera('healthBarBG', 'other');
   --setObjectCamera('healthBar', 'hud');

   --Text fonts
   setTextFont('scoreTxt', 'text')
   setTextFont('healthCounter', 'rubik.ttf')
   setTextFont('timeTxt', 'rubik.ttf')
   setTextFont('botplayTxt', 'rubik.ttf')
   setTextFont('judgementCounter', 'rubik.ttf')
   setTextFont('Watermark', 'rubik.ttf');
   setTextFont('nametext', 'rubik.ttf');
   
   --Text sizes
   setTextSize('scoreTxt', 17);
   setTextSize('Watermark', 16);
   setTextSize('nametext', 18)

   --moreTextStuff
   setTextBorder('Watermark', 1.75, '000000');
   setTextAlignment('Watermark', 'center');
end

--other stuff
function onUpdate()
    scaleObject('red', 1.965 * getProperty("songPercent"), .035)

    if downscroll then -- downscroll only
        setProperty('black.y', 685)
        setProperty('gray.y', 690)
        setProperty('red.y', 690)
        setProperty('nametext.y', 685)
        setProperty('Watermark.y', -185)
    end
end