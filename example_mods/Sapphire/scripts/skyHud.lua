local mf = false
function onCreatePost()
	luaDebugMode = true;

	setProperty("showComboNum", false)
    setProperty("showRating", false)

	if stringStartsWith(songName, 'Manifest') then
		mf = true
	end

	if not mf then
		makeLuaSprite('reduxHealthBarBG', 'ui/hud/normal/Healthbar', 0, getProperty('healthBar.y') - 100)
		setObjectCamera('reduxHealthBarBG', 'camHUD')
		screenCenter('reduxHealthBarBG', 'x')
		scaleObject('reduxHealthBarBG', 0.5, 0.5, false)

		makeLuaSprite('popupBackdrop', 'ui/hud/normal/RatingBackdrop', 0, getProperty('healthBar.y') - 70)
		setObjectCamera('popupBackdrop', 'camHUD')
		scaleObject('popupBackdrop', 0.6, 0.6, true)
		setProperty('popupBackdrop.x', screenWidth - getProperty('popupBackdrop.width'))

		makeAnimatedLuaSprite('ratingPopup', 'ui/hud/normal/sky_ratings', getProperty('popupBackdrop.x') - 135, getProperty('popupBackdrop.y') - 25)
		setObjectCamera('ratingPopup', 'camHUD')
		scaleObject('ratingPopup', 0.45, 0.45, false)
		addAnimationByPrefix('ratingPopup', 'killer', 'killer', 0, true)
		addAnimationByPrefix('ratingPopup', 'sweet', 'sweet', 0, true)
		addAnimationByPrefix('ratingPopup', 'lame', 'lame', 0, true)
		addAnimationByPrefix('ratingPopup', 'wtf', 'wtf', 0, true)
		playAnim('ratingPopup', 'killer')

		makeLuaText('skyComboTxt', '000', screenWidth, -10, getProperty('ratingPopup.y') + 85)
		setObjectCamera('skyComboTxt', 'camHUD')
		setTextFormat('skyComboTxt', 'sky.ttf', 40, '002eaf', 'right', 'outline', 'FFFFFF', 5)

		makeLuaSprite('timerBackdrop', 'ui/hud/normal/TimerBackdrop', 0, 0)
		setObjectCamera('timerBackdrop', 'camHUD')
		scaleObject('timerBackdrop', 0.5, 0.5, false)
		screenCenter('timerBackdrop', '0x01')
		setProperty('timerBackdrop.x', getProperty('timerBackdrop.x') - 5)
		setProperty('timerBackdrop.y', -10)
		setProperty('timerBackdrop.alpha', 0)

		setTextFormat('timeTxt', 'Planet-Joy.ttf', 35, '002eaf', 'center')
		setProperty('timeTxt.x', getProperty('timerBackdrop.x') - 28)
		setProperty('timeTxt.y', getProperty('timerBackdrop.y') + 42)
		if getPropertyFromClass('backend.ClientPrefs', 'timeBarType') == 'Song Name' then
			setGraphicSize('timerBackdrop', getTextWidth('timeTxt'), getProperty('timerBackdrop.height')/2, false)
		end
		setProperty('timeBar.visible', false)

		addLuaSprite('reduxHealthBarBG')
		addLuaSprite('popupBackdrop')
		addLuaSprite('ratingPopup')
		addLuaText('skyComboTxt')
		setObjectOrder('skyComboTxt', getObjectOrder('ratingPopup')+1)
		addLuaSprite('timerBackdrop')
		
		setTextFont('scoreTxt', 'Planet-Joy.ttf')
		setTextBorder('scoreTxt', 2, '002eaf')
		setProperty('scoreTxt.y', getProperty('scoreTxt.y')+10)
	else
		makeLuaSprite('reduxHealthBarBG', 'ui/hud/manifest/MF_Healthbar', 0, getProperty('healthBar.y') - 70)
		setObjectCamera('reduxHealthBarBG', 'camHUD')
		screenCenter('reduxHealthBarBG', 'x')
		scaleObject('reduxHealthBarBG', 0.5, 0.5, false)

		makeLuaSprite('popupBackdrop', 'ui/hud/manifest/MF_RatingsBackdrop', 0, getProperty('healthBar.y') - 70)
		setObjectCamera('popupBackdrop', 'camHUD')
		scaleObject('popupBackdrop', 0.6, 0.6, true)
		setProperty('popupBackdrop.x', screenWidth - getProperty('popupBackdrop.width'))

		makeAnimatedLuaSprite('ratingPopup', 'ui/hud/manifest/manifest_sky_ratings', getProperty('popupBackdrop.x') - 135, getProperty('popupBackdrop.y') - 25)
		setObjectCamera('ratingPopup', 'camHUD')
		scaleObject('ratingPopup', 0.45, 0.45, false)
		addAnimationByPrefix('ratingPopup', 'killer', 'killer', 0, true)
		addAnimationByPrefix('ratingPopup', 'sweet', 'sweet', 0, true)
		addAnimationByPrefix('ratingPopup', 'lame', 'lame', 0, true)
		addAnimationByPrefix('ratingPopup', 'wtf', 'wtf', 0, true)
		playAnim('ratingPopup', 'killer')

		makeLuaText('skyComboTxt', '000', screenWidth, -10, getProperty('ratingPopup.y') + 85)
		setObjectCamera('skyComboTxt', 'camHUD')
		setTextFormat('skyComboTxt', 'sky.ttf', 40, 'cc0045', 'right', 'outline', 'FFFFFF', 5)

		makeLuaSprite('timerBackdrop', 'ui/hud/manifest/MF_TimerBackdrop', 0, 0)
		setObjectCamera('timerBackdrop', 'camHUD')
		scaleObject('timerBackdrop', 0.5, 0.5, false)
		screenCenter('timerBackdrop', '0x01')
		setProperty('timerBackdrop.x', getProperty('timerBackdrop.x') - 5)
		setProperty('timerBackdrop.y', -10)
		setProperty('timerBackdrop.alpha', 0)

		setTextFormat('timeTxt', 'Planet-Joy.ttf', 35, 'ffffff', 'center')
		setProperty('timeTxt.x', getProperty('timerBackdrop.x') - 28)
		setProperty('timeTxt.y', getProperty('timerBackdrop.y') + 42)
		if getPropertyFromClass('backend.ClientPrefs', 'timeBarType') == 'Song Name' then
			setGraphicSize('timerBackdrop', getTextWidth('timeTxt'), getProperty('timerBackdrop.height')/2, false)
		end
		setProperty('timeBar.visible', false)

		addLuaSprite('reduxHealthBarBG')
		addLuaSprite('popupBackdrop')
		addLuaSprite('ratingPopup')
		addLuaText('skyComboTxt')
		setObjectOrder('skyComboTxt', getObjectOrder('ratingPopup')+1)
		addLuaSprite('timerBackdrop')
	end
	setProperty('healthBar.visible', false)
	runHaxeCode([[
			import flixel.ui.FlxBar;
			import flixel.ui.FlxBarFillDirection;

			reduxHealthBar = new FlxBar(0, game.getLuaObject('reduxHealthBarBG').y, FlxBarFillDirection.RIGHT_TO_LEFT, 1200, 80, null, 'health', 0, 2);
        	reduxHealthBar.y += !isMF ? 60 : 30;
        	reduxHealthBar.camera = game.camHUD;
        	reduxHealthBar.createFilledBar(!isMF ? 0xFF]]..getColorFromHex(RGBtoHex(getProperty('dad.healthColorArray')))..[[ : 0xFFFF0000, 0xFF]]..getColorFromHex(RGBtoHex(getProperty('boyfriend.healthColorArray')))..[[);
        	reduxHealthBar.scale.set(0.5, 0.5);
        	reduxHealthBar.screenCenter(0x01);
    		game.insert(game.members.indexOf(game.getLuaObject('reduxHealthBarBG')), reduxHealthBar);
		]], {isMF = mf})
end
function onSongStart()
	doTweenAlpha('timeFadeIn', 'timerBackdrop', 1, 0.6, 'quadOut')
end
function goodNoteHit(i, d, t, s)
	if not s then
		if ratingName == 'Sick!' then
			playAnim('ratingPopup', 'killer', true)
		elseif ratingName == 'Good' then
			playAnim('ratingPopup', 'sweet', true)
		elseif ratingName == 'Bad' then
			playAnim('ratingPopup', 'lame', true)
		elseif ratingName == 'Shit' then
			playAnim('ratingPopup', 'wtf', true)
		end
		scaleObject('ratingPopup', 0.5, 0.5, false)
	end
end
function onUpdate(elapsed)
	if getProperty('ratingPopup.scale.x') > 0.45 then
		setProperty('ratingPopup.scale.x', getProperty('ratingPopup.scale.x') - 0.5 * elapsed)
		setProperty('ratingPopup.scale.y', getProperty('ratingPopup.scale.y') - 0.5 * elapsed)
	end
	setTextString('skyComboTxt', combo)
	runHaxeCode([[
		reduxHealthBar.percent = game.health * 50
	]])
end
function setTextFormat(tag, font, size, color, alignment, borderStyle, borderColor, borderSize)
	setTextFont(tag, font)
	setTextSize(tag, size)
	setTextColor(tag, color)
	setTextAlignment(tag, alignment)
	setTextBorder(tag, borderSize, borderColor, borderStyle)
end
function RGBtoHex(RGB)
    return string.format("%02X%02X%02X", RGB[1], RGB[2], RGB[3])
end