function onCreate()

makeLuaSprite('image', 'flashed', 0, 0);
addLuaSprite('image', false);
doTweenAlpha('birth', 'image', 0, 0.01, 'linear');
setObjectCamera('image', 'other');

keys = {'M', 'O', 'D', 'W', 'H', 'E', 'N'}
curKey = 1
function onUpdatePost()

if getPropertyFromClass("flixel.FlxG","keys.justPressed."..keys[curKey]) then
    curKey = curKey + 1
end

if curKey == #keys+1 then
    doTweenColor('hello', 'image', 'FFFFFFFF', 0.01, 'quartIn');
    runTimer('wait', value2);
    playSound('vineboom', 1);
end
end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'wait' then
    doTweenAlpha('byebye', 'image', 0, 1, 'linear');
end
end
        
function onTweenCompleted(tag)
    if tag == 'byebye' then
    removeLuaSprite('image', true);
end
end