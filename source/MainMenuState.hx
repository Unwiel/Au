package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.5.1'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		#if ACHIEVEMENTS_ALLOWED 'awards', #end
		'credits',
		'options'
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	
	var storymode:FlxSprite;
	var freeplay:FlxSprite;
	var options:FlxSprite;
	var credits:FlxSprite;
	var awards:FlxSprite;
    
    

	var menuSketch:FlxSprite;
	var bg:FlxSprite;	

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		
		storymode = new FlxSprite(-100, -400).loadGraphic(Paths.image('mainmenu/opened/Storymode'));
		storymode.scrollFactor.set();
		storymode.antialiasing = ClientPrefs.globalAntialiasing;
		storymode.setGraphicSize(Std.int(storymode.width * 0.7));
		storymode.y += 230;		
		storymode.x -= 200;
		storymode.alpha = 0.60;
		add(storymode);
		
		freeplay = new FlxSprite(-100, -400).loadGraphic(Paths.image('mainmenu/opened/Freeplay'));
		freeplay.scrollFactor.set();
		freeplay.antialiasing = ClientPrefs.globalAntialiasing;
		freeplay.setGraphicSize(Std.int(freeplay.width * 0.7));
		freeplay.y += 230;		
		freeplay.x -= 200;
		freeplay.alpha = 0.60;
		add(freeplay);

		options = new FlxSprite(-100, -400).loadGraphic(Paths.image('mainmenu/opened/Options'));
		options.scrollFactor.set();
		options.antialiasing = ClientPrefs.globalAntialiasing;
		options.setGraphicSize(Std.int(options.width * 0.7));
		options.y += 230;
		options.x -= 200;
		options.alpha = 0.60;
		add(options);

		credits = new FlxSprite(-100, -400).loadGraphic(Paths.image('mainmenu/opened/Credits'));
		credits.scrollFactor.set();
		credits.antialiasing = ClientPrefs.globalAntialiasing;
		credits.setGraphicSize(Std.int(credits.width * 0.7));
		credits.y += 230;
		credits.x -= 200;
		credits.alpha = 0.60;
		add(credits);

		awards = new FlxSprite(-100, -400).loadGraphic(Paths.image('mainmenu/opened/Achievements'));
		awards.scrollFactor.set();
		awards.antialiasing = ClientPrefs.globalAntialiasing;
		awards.setGraphicSize(Std.int(awards.width * 0.7));
		awards.y += 230;
		awards.x -= 200;
		awards.alpha = 0.60;			
        add(awards);	

		var sketch:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('mainmenu/sketch/sketch'));
		sketch.frames = Paths.getSparrowAtlas('mainmenu/sketch/sketch');
		sketch.animation.addByPrefix('bump', 'menu bru', 3); 
		sketch.animation.play('bump');
		sketch.setGraphicSize(Std.int(sketch.width * 0.7));
		sketch.x -= 300;
		sketch.y -= 200;
		add(sketch);
		
		var IndieLogo:FlxSprite = new FlxSprite(-310, -170).loadGraphic(Paths.image('mainmenu/LOGO'));
		IndieLogo.updateHitbox();
		IndieLogo.setGraphicSize(Std.int(IndieLogo.width * 0.7));
		IndieLogo.antialiasing = ClientPrefs.globalAntialiasing;
		add(IndieLogo);

		
		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		

		FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Indie Cross Psych Port' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

                #if android
		addVirtualPad(UP_DOWN, A_B);
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
	
		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										MusicBeatState.switchState(new options.OptionsState());
								}
							});
						}
					});
				}
			}
			else if (FlxG.keys.anyJustPressed(debugKeys)) 
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
		}

		super.update(elapsed);

		
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		switch (optionShit[curSelected])
		{
		    case 'story_mode':
		        storymode.alpha = 1;  
				freeplay.alpha = 0.6; 
				awards.alpha = 0.6;				
				credits.alpha = 0.6;  
				options.alpha = 0.6; 	 
			case 'freeplay':
				freeplay.alpha = 1; 
				awards.alpha = 0.6;				
				credits.alpha = 0.6;  
				options.alpha = 0.6; 				
			case 'options':			
				options.alpha = 1; 
				freeplay.alpha = 0.6;
				awards.alpha = 0.6;  
				credits.alpha = 0.6; 
			case 'credits':		
				credits.alpha = 1; 
				options.alpha = 0.6; 
				freeplay.alpha = 0.6;
				awards.alpha = 0.6;  
			case 'awards':	
				awards.alpha = 1;				
				credits.alpha = 0.6; 
				options.alpha = 0.6; 
				freeplay.alpha = 0.6; 		
       } 		
	}
}
