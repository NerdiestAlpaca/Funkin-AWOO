package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitBF:FlxSprite;
	var portraitRoxie:FlxSprite;
	var portraitSavannah:FlxSprite;
	var portraitQuincy:FlxSprite;
	var portraitPetula:FlxSprite;
	var portraitJade:FlxSprite;
	var portraitTrip:FlxSprite;
	var portraitAustin:FlxSprite;
	var portraitEdie:FlxSprite;
	var portraitBev:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'mischief':
				FlxG.sound.playMusic(Paths.music('Woolwright'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'free spirit':
				FlxG.sound.playMusic(Paths.music('breakfast'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'dreamboat':
				FlxG.sound.playMusic(Paths.music('givinALittle'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);

			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
				
				case 'satellite' | 'our world' | 'mischief' | 'free spirit' | 'catnap' | 'daredevil' | 'dreamboat' | 'primadonna' | 'swerve on':
					hasDialog = true;
					box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
					box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
					box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
					box.antialiasing = true;
			}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite(-20, 40);
		portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
		portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		portraitBF = new FlxSprite(0, 30);
		portraitBF.frames = Paths.getSparrowAtlas('petshop/boyfriendportrait');
		portraitBF.animation.addByPrefix('enter', 'BF idle dance', 24, false);
		portraitBF.setGraphicSize(Std.int(portraitBF.width * 1));
		portraitBF.updateHitbox();
		portraitBF.scrollFactor.set();
		add(portraitBF);
		portraitBF.visible = false;

		portraitRoxie = new FlxSprite(200, FlxG.height - 525);
		portraitRoxie.frames = Paths.getSparrowAtlas('petshop/roxieportrait');
		portraitRoxie.animation.addByPrefix('enter', 'Roxie Idle', 24, false);
		portraitRoxie.setGraphicSize(Std.int(portraitRoxie.width * 1));
		portraitRoxie.updateHitbox();
		portraitRoxie.scrollFactor.set();
		add(portraitRoxie);
		portraitRoxie.visible = false;
		
		portraitSavannah = new FlxSprite(200, FlxG.height - 525);
		portraitSavannah.frames = Paths.getSparrowAtlas('petshop/savannahportrait');
		portraitSavannah.animation.addByPrefix('enter', 'Savannah Idle', 24, false);
		portraitSavannah.setGraphicSize(Std.int(portraitSavannah.width * 1));
		portraitSavannah.updateHitbox();
		portraitSavannah.scrollFactor.set();
		add(portraitSavannah);
		portraitSavannah.visible = false;

		portraitQuincy = new FlxSprite(200, FlxG.height - 525);
		portraitQuincy.frames = Paths.getSparrowAtlas('petshop/quincyportrait');
		portraitQuincy.animation.addByPrefix('enter', 'Quincy Idle', 24, false);
		portraitQuincy.setGraphicSize(Std.int(portraitQuincy.width * 1));
		portraitQuincy.updateHitbox();
		portraitQuincy.scrollFactor.set();
		add(portraitQuincy);
		portraitQuincy.visible = false;

		portraitPetula = new FlxSprite(200, FlxG.height - 525);
		portraitPetula.frames = Paths.getSparrowAtlas('petshop/petulaportrait');
		portraitPetula.animation.addByPrefix('enter', 'Petula Idle', 24, false);
		portraitPetula.setGraphicSize(Std.int(portraitPetula.width * 1));
		portraitPetula.updateHitbox();
		portraitPetula.scrollFactor.set();
		add(portraitPetula);
		portraitPetula.visible = false;
		
				portraitJade = new FlxSprite(200, FlxG.height - 525);
		portraitJade.frames = Paths.getSparrowAtlas('petshop/jadeportrait');
		portraitJade.animation.addByPrefix('enter', 'Jade Idle', 24, false);
		portraitJade.setGraphicSize(Std.int(portraitJade.width * 1));
		portraitJade.updateHitbox();
		portraitJade.scrollFactor.set();
		add(portraitJade);
		portraitJade.visible = false;
		
		portraitTrip = new FlxSprite(200, FlxG.height - 525);
		portraitTrip.frames = Paths.getSparrowAtlas('petshop/tripportrait');
		portraitTrip.animation.addByPrefix('enter', 'Trip Idle', 24, false);
		portraitTrip.setGraphicSize(Std.int(portraitTrip.width * 1));
		portraitTrip.updateHitbox();
		portraitTrip.scrollFactor.set();
		add(portraitTrip);
		portraitTrip.visible = false;

		portraitAustin = new FlxSprite(200, FlxG.height - 525);
		portraitAustin.frames = Paths.getSparrowAtlas('petshop/austinportrait');
		portraitAustin.animation.addByPrefix('enter', 'Austin Idle', 24, false);
		portraitAustin.setGraphicSize(Std.int(portraitAustin.width * 1));
		portraitAustin.updateHitbox();
		portraitAustin.scrollFactor.set();
		add(portraitAustin);
		portraitAustin.visible = false;

		portraitEdie = new FlxSprite(200, FlxG.height - 525);
		portraitEdie.frames = Paths.getSparrowAtlas('petshop/edieportrait');
		portraitEdie.animation.addByPrefix('enter', 'Edie Idle', 24, false);
		portraitEdie.setGraphicSize(Std.int(portraitEdie.width * 1));
		portraitEdie.updateHitbox();
		portraitEdie.scrollFactor.set();
		add(portraitEdie);
		portraitEdie.visible = false;

        portraitBev = new FlxSprite(200, FlxG.height - 525);
		portraitBev.frames = Paths.getSparrowAtlas('petshop/bevportrait');
		portraitBev.animation.addByPrefix('enter', 'Bev Idle', 24, false);
		portraitBev.setGraphicSize(Std.int(portraitBev.width * 1));
		portraitBev.updateHitbox();
		portraitBev.scrollFactor.set();
		add(portraitBev);
		portraitBev.visible = false;

		box.animation.play('normalOpen');
		box.y = FlxG.height - 285;
		box.x = 20;
		box.setGraphicSize(Std.int(box.width * 1));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns'|| PlayState.SONG.song.toLowerCase() == 'satellite')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'boyfriend':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitBF.visible)
				{
					portraitBF.visible = true;
					portraitBF.animation.play('enter');
				}
			case 'roxie':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitRoxie.visible)
				{
					portraitRoxie.visible = true;
					portraitRoxie.animation.play('enter');
				}
			case 'savannah':
				portraitLeft.visible = false;
				portraitBF.visible = false;
				portraitRight.visible = false;
				portraitRoxie.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitSavannah.visible)
				{
					portraitSavannah.visible = true;
					portraitSavannah.animation.play('enter');
				}
			case 'quincy':
				portraitLeft.visible = false;
				portraitBF.visible = false;
				portraitRight.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				
				if (!portraitQuincy.visible)
				{
					portraitQuincy.visible = true;
					portraitQuincy.animation.play('enter');
				}
			case 'petula':
				portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitPetula.visible)
				{
					portraitPetula.visible = true;
					portraitPetula.animation.play('enter');
				}
			case 'jade':
            	portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitJade.visible)
				{
					portraitJade.visible = true;
					portraitJade.animation.play('enter');
				}
            case 'trip':
            	portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitTrip.visible)
				{
					portraitTrip.visible = true;
					portraitTrip.animation.play('enter');
				}
            case 'austin':
            	portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitEdie.visible = false;
                portraitBev.visible = false;
				if (!portraitAustin.visible)
				{
					portraitAustin.visible = true;
					portraitAustin.animation.play('enter');
				}
            case 'edie':
            	portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitBev.visible = false;
				if (!portraitEdie.visible)
				{
					portraitEdie.visible = true;
					portraitEdie.animation.play('enter');
				}
            case 'bev':
            	portraitLeft.visible = false;
				portraitRight.visible = false;
				portraitBF.visible = false;
				portraitRoxie.visible = false;
				portraitSavannah.visible = false;
				portraitQuincy.visible = false;
				portraitPetula.visible = false;
				portraitJade.visible = false;
                portraitTrip.visible = false;
                portraitAustin.visible = false;
                portraitEdie.visible = false;
				if (!portraitBev.visible)
				{
					portraitBev.visible = true;
					portraitBev.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
