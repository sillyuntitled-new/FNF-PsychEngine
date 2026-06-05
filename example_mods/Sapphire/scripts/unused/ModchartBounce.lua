--Made by BlueColorsin#5597
--Inspired by Soulless DX

settings = {
    Camera = {
        TurnIntensity = 0.5, 
        liftOff = 15,
        dragDown = 0
    },
    Icons = {
        TurnIntensity = 5, 
        liftOff = 20,
        dragDown = 10
    }
}

function onCreatePost()
    C4 = crochet / 1000 * (0.75)
	C1 = crochet / 1000 * (0.25)

    value1 = ((downscroll and 8.2 or 569.8) + settings.Icons.dragDown)
    value2 = ((downscroll and 8.2 or 569.8) - settings.Icons.liftOff)
end
function onBeatHit()
        doTweenY('SpeedIsKey', 'iconP1', value1, C1, 'sineIn')
        doTweenY(RNG(), 'iconP2', value1, C1, 'sineIn')
        doTweenY(RNG(), 'camHUD', settings.Camera.liftOff * -1 , C1, 'sineIn')
end

TimesLol = 0
function onTweenCompleted(tag)
    if tag == 'SpeedIsKey' then
        if TimesLol == 2 then TimesLol = 0 end
        TimesLol = TimesLol + 1 
        doTweenY(RNG(), 'iconP1', value2, C4, 'sineOut')
        doTweenY(RNG(), 'iconP2', value2, C4, 'sineOut')
        doTweenY(RNG(), 'camHUD', settings.Camera.dragDown, C4, 'sineOut')
        if TimesLol == 1 then
            doTweenAngle(RNG(), 'iconP1', settings.Icons.TurnIntensity * -1, C4)
            doTweenAngle(RNG(), 'iconP2', settings.Icons.TurnIntensity * -1, C4)
            doTweenAngle(RNG(), 'camHUD', settings.Camera.TurnIntensity * -1, C4)
        elseif TimesLol == 2 then
            doTweenAngle(RNG(), 'iconP1', settings.Icons.TurnIntensity, C4)
            doTweenAngle(RNG(), 'iconP2', settings.Icons.TurnIntensity, C4)
            doTweenAngle(RNG(), 'camHUD', settings.Camera.TurnIntensity, C4)
        end
    end
end

RNG = function () --returns a random number string
	return tostring(math.random())
end