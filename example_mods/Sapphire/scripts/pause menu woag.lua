-- painfully made by kommit ft some copy pasting because me when states and haxe :sadge:
-- yt: @kommitisstupid, gbanana: iwanttokommitdead, discord: @kommit. or kommit#2406
-- please credit, this took me a good while

-----------------------------------
----------------------------------

-- custom music, make sure to put it in mods/sounds. if left blank, it will not play anything
local pauseMusic = 'sapphire'

-- put custom fonts in mods/fonts, dont forget to add .ttf
-- the font of the Score is vcr.ttf, but personally i like PhantomMuff.ttf more so i included it here
local txtFont = 'Planet-Joy.ttf'

-- how many seconds your song takes so it loops properly
local songEnd = 60

-- custom path for sprites so its not all over main mods/ folder
local folderPath = 'pause'

-- character image that shows up on the right side
-- please use template.png for accurate size else its gonna have weird positions lol
local charThumbnail = 'sapphire'

-- splash texts, put any message you want + you can put more than one text. put \n to make a line break
local splashText = {'Fun Fact! FNF Gemstone is. Never.', 'sapphire aproved message', 'hi chat'};

-- credits text (or extra space), just follow the template or see for yourself in game how it looks
-- if you dont want to use this, leave it blank
-- to do a space, add \n
local creditStuff = ' > credits:\nHey Two!\nMusic originally by BFDI 26\nChart by BFDI 26\nCover made by LookyReviewsTiktok'

----------------------------------
----------------------------------





-- uh oh, spaghetti code

-- sprites and yknow
function onCreate()
    precacheSound(pauseMusic)
    precacheSound('scrollMenu')
    precacheSound('clickText')

	-- bg sprite
    makeLuaSprite('bgFade', nil, 0, 0)
    makeGraphic("bgFade", 1280, 720, '000000')
    setObjectCamera('bgFade', 'camOther')
    screenCenter('bgFade','xy')
    addLuaSprite('bgFade', true)
    setProperty('bgFade.alpha', 0)

	--character sprite
	makeLuaSprite('chrimg', folderPath..'/'..charThumbnail, 1000, 20);
	setObjectCamera('chrimg', 'camOther');
	--screenCenter('chrimg','y')
    setProperty('chrimg.alpha', 0)
    addLuaSprite("chrimg", true)

    -- splash texts
    makeLuaText('splashTxt', 'where did the splash messages go?', 500, 725, -20)
    setTextFont('splashTxt', txtFont)
    setTextColor("splashTxt", "FFFF00")
    setTextSize("splashTxt", 15)
    setTextAlignment("splashTxt", 'center')
    setObjectCamera("splashTxt", 'camOther')
    setProperty('splashTxt.alpha', 0)
    addLuaText('splashTxt')

    -- credit text and stuff
    makeLuaText('creditsTxt', '', 500, 20, 0)
    setTextString('creditsTxt', creditStuff)
    setTextFont('creditsTxt', txtFont)
    setTextColor("creditsTxt", "CCCCCC")
    setTextSize("creditsTxt", 15)
    setTextAlignment("creditsTxt", 'left')
    setObjectCamera("creditsTxt", 'camOther')
    setProperty('creditsTxt.alpha', 0)
    addLuaText('creditsTxt')
end

option = {'Resume', 'Restart', 'Options', 'Exit'}

-- state
function onPause()
    openCustomSubstate('pauseState', true);
    return Function_Stop;
end
function onCustomSubstateCreate(name)
    if name == 'pauseState' then
        playSound(pauseMusic, 0, 'pauseSongTag')
        soundFadeIn('pauseSongTag', 15)
        runTimer('loopPauseTag', songEnd, 0)
    end
end
function onCustomSubstateSoundFinished(name)
    if name == 'pauseState' then
        playSound(pauseMusic, 1, 'pauseSongTag')
        runTimer('loopPauseTag', songEnd, 0)
    end
end
function onCustomSubstateUpdate(name)
    if keyJustPressed('back') then
        closePause()
    end
end


-- state start
function onCustomSubstateCreatePost(name)
    if name == 'pauseState' then

-- bg backdrop
    doTweenAlpha("bgalpha", "bgFade", 0.5, 0.4, 'linear')

-- character thumbnail thing
    doTweenAlpha('chrimgalpha', 'chrimg', 1, 0.5, 'linear')
    doTweenX("chrimgmove", "chrimg", 675, 0.5, 'sineOut')

-- splash tweeee
    doTweenAlpha('splashTxtAlpha', 'splashTxt', 1, 0.5, 'linear')
    doTweenY("splashTxtMove", "splashTxt", 20, 0.5, 'sineOut')
    setTextString('splashTxt', splashText[getRandomInt(1, #splashText)])

-- credit yipe
    doTweenAlpha('creditsTxtAlpha', 'creditsTxt', 1, 0.5, 'linear')
    doTweenY("creditsTxtMove", "creditsTxt", 60, 0.5, 'sineOut')

-- option buttons
    -- resume (pause screen on)
    makeLuaText('resumeTxt', 'Resume Game', 0, 50, 365)
    setTextFont('resumeTxt', txtFont)
    setTextSize("resumeTxt", 40)
    setObjectCamera("resumeTxt", 'camOther')
    setProperty('resumeTxt.alpha', 0)
    addLuaText('resumeTxt')
    -- tweens (pause screen on)
    doTweenY('resumeTxtPause', 'resumeTxt', 415, 0.5, 'sineOut')
    doTweenAlpha('resumeTxtAlpha', 'resumeTxt', 1, 0.5, 'sineOut')

    -- restart (pause screen on)
    makeLuaText('restartTxt', 'Restart Song', 0, 50, 440)
    setTextFont('restartTxt', txtFont)
    setTextSize("restartTxt", 40)
    setObjectCamera("restartTxt", 'camOther')
    setProperty('restartTxt.alpha', 0)
    addLuaText('restartTxt')
    -- tweens (pause screen on)
    doTweenY('restartTxtPause', 'restartTxt', 490, 0.5, 'sineOut')
    doTweenAlpha('restartTxtAlpha', 'restartTxt', 1, 0.5, 'sineOut')

    -- options (pause screen on)
    makeLuaText('optionsTxt', 'Options', 0, 50, 515)
    setTextFont('optionsTxt', txtFont)
    setTextSize("optionsTxt", 40)
    setObjectCamera("optionsTxt", 'camOther')
    setProperty('optionsTxt.alpha', 0)
    addLuaText('optionsTxt')
    -- tweens (pause screen on)
    doTweenY('optionsTxtPause', 'optionsTxt', 565, 0.5, 'sineOut')
    doTweenAlpha('optionsTxtAlpha', 'optionsTxt', 1, 0.5, 'sineOut')

    -- exit (pause screen on)
    makeLuaText('exitTxt', 'Exit to Menu', 0, 50, 590)
    setTextFont('exitTxt', txtFont)
    setTextSize("exitTxt", 40)
    setObjectCamera("exitTxt", 'camOther')
    setProperty('exitTxt.alpha', 0)
    addLuaText('exitTxt')
    -- tweens (pause screen on)
    doTweenY('exitTxtPause', 'exitTxt', 640, 0.5, 'sineOut')
    doTweenAlpha('exitTxtAlpha', 'exitTxt', 1, 0.5, 'sineOut')

    changeDiscordPresence("Paused", songName..' - ('..difficultyName..')', nil, 0, 0.0)

    playSound('clickText', 0.5)

    end
end

function onCustomSubstateTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopPauseTag' then
        playSound(pauseMusic, 1, 'pauseSongTag')
	end
end

function onCustomSubstateUpdatePost(name)
    if name == 'pauseState' then
        if keyboardJustPressed('ENTER') and optionSelected == 1 then
            stopSound('pauseSongTag')
            cancelTimer('loopPauseTag')
            closeCustomSubstate();

            for i = 1,#option do
                removeLuaText('option_'..i,false);
            end

            -- bye chr
            doTweenAlpha('chrimgalpha', 'chrimg', 0, 0.1, 'linear')
            doTweenX("chrimgmove", "chrimg", 800, 0.1, 'QuadOut')

            -- bye backdrop
            doTweenAlpha("bgalpha", "bgFade", 0, 0.3, 'linear')

            -- bye splas
            doTweenAlpha('splashTxtAlpha', 'splashTxt', 0, 0.5, 'linear')
            doTweenY("splashTxtMove", "splashTxt", -20, 0.5, 'sineOut')

            -- bye credits people
            doTweenAlpha('creditsTxtAlpha', 'creditsTxt', 0, 0.5, 'linear')
            doTweenY("creditsTxtMove", "creditsTxt", 0, 0.5, 'sineOut')

            -- bye txt
            doTweenY('resumeTxtPause', 'resumeTxt', 465, 0.5, 'sineOut')
            doTweenAlpha('resumeTxtAlpha', 'resumeTxt', 0, 0.5, 'sineOut')
            doTweenY('restartTxtPause', 'restartTxt', 540, 0.5, 'sineOut')
            doTweenAlpha('restartTxtAlpha', 'restartTxt', 0, 0.5, 'sineOut')
            doTweenY('optionsTxtPause', 'optionsTxt', 615, 0.5, 'sineOut')
            doTweenAlpha('optionsTxtAlpha', 'optionsTxt', 0, 0.5, 'sineOut')
            doTweenY('exitTxtPause', 'exitTxt', 690, 0.5, 'sineOut')
            doTweenAlpha('exitTxtAlpha', 'exitTxt', 0, 0.5, 'sineOut')
        end

        if keyboardJustPressed('ENTER') and optionSelected == 2 then
            stopSound('pauseSongTag')
	        playSound('scrollMenu')
            restartSong(false);
        end

        if keyboardJustPressed('ENTER') and optionSelected == 3 then
            runHaxeCode([[
                import options.OptionsState;
                import backend.MusicBeatState;
                game.paused = true; // For lua
                game.vocals.volume = 0;
                MusicBeatState.switchState(new OptionsState());
                if (ClientPrefs.data.pauseMusic != 'None') {
                    FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), game.modchartSounds('pauseMusic').volume);
                    FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.8);
                    FlxG.sound.music.time = game.modchartSounds('pauseMusic').time;
                }
                OptionsState.onPlayState = true;
            ]])
        end

        if keyboardJustPressed('ENTER') and optionSelected == 4 then
            stopSound('pauseSongTag')
	        playSound('scrollMenu')
            exitSong(false);
        end

        -- options selection thing
        if optionSelected == 1 then
            doTweenColor('resumeTxtCol', 'resumeTxt', '00CCFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', 'FFFFFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 55, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 50, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 50, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 50, 0.1, 'linear')

        elseif optionSelected == 2 then
            doTweenColor('resumeTxtCol', 'resumeTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', '00CCFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', 'FFFFFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 50, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 55, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 50, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 50, 0.1, 'linear')

        elseif optionSelected == 3 then
            doTweenColor('resumeTxtCol', 'resumeTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', '00CCFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', 'FFFFFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 50, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 50, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 55, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 50, 0.1, 'linear')

        elseif optionSelected == 4 then 
            doTweenColor('resumeTxtCol', 'resumeTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('restartTxtCol', 'restartTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('optionsTxtCol', 'optionsTxt', 'FFFFFF', 0.1, 'linear')
            doTweenColor('exitTxtCol', 'exitTxt', '00CCFF', 0.1, 'linear')

            doTweenX('resumeTxtSelect', 'resumeTxt', 50, 0.1, 'linear')
            doTweenX('restartTxtSelect', 'restartTxt', 50, 0.1, 'linear')
            doTweenX('optionsTxtSelect', 'optionsTxt', 50, 0.1, 'linear')
            doTweenX('exitTxtSelect', 'exitTxt', 55, 0.1, 'linear')
        end

        -- keyboard presses
        if keyboardJustPressed('W') then
            chooseOption(-1)
	        playSound('scrollMenu')
        elseif keyboardJustPressed('S') then
            chooseOption(1)
	        playSound('scrollMenu')
        end
        if keyboardJustPressed('UP') then
            chooseOption(-1)
	        playSound('scrollMenu')
        elseif keyboardJustPressed('DOWN') then
            chooseOption(1)
	        playSound('scrollMenu')
        end
    end
end

-- song loop timer
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopPauseTag' then
		playSound(pauseMusic, 1, 'pauseSongTag') -- loop song
	end
end

-- option default select (resume)
optionSelected = 1
function chooseOption(choose)
    optionSelected = optionSelected + choose;

    if optionSelected >= #option + 1 then
        optionSelected = 1;
    elseif optionSelected <= 0 then
        optionSelected = #option;
    end
end

-- for some reason, discord rich presence timer completely goes wack when using this script but
-- i cant be bothered to fix that /shrug