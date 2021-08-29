local swayingstart = false
local swayingy = false
local swayingx = false
local swayingboth = false
local swayingintense = false

function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " donwscroll: " .. downscroll)
    swayingstart = true
end


function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/95)
    if resetnotes then
        for i = 0, 7 do
            setActorX(_G['defaultStrum'..i..'X'] + 0, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
            setActorAngle(0, i)
            camHudAngle = 0
            setHudPosition(0, 0)
            cameraAngle = 0
        end
    end
    if difficulty == 2 then -- we're on hard mode
        if swayingstart then
            for i=0,7 do
                setActorY(defaultStrum0Y + 8 * math.cos((currentBeat + i*0.2) * 1.4), i)
            end
        end
        if swayingy then
            for i=0,7 do
                setActorY(defaultStrum0Y + 15 * math.cos((currentBeat + i*0.3) * 1.5), i)
            end
        end
        if swayingx then
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 20 * math.sin((currentBeat + i*0.01)), i)
            end
        end
        if swayingboth then
            for i=0,7 do
                setActorY(defaultStrum0Y + 15 * math.cos((currentBeat + i*0.3) * 1.5), i)
                setActorX(_G['defaultStrum'..i..'X'] + 20 * math.sin((currentBeat + i*0.01)), i)
            end
        end
        if swayingintense then
            local currentBeat = (songPos / 1000)*(bpm/70)
            for i=0,7 do
                setActorY(defaultStrum0Y + 18 * math.cos((currentBeat + i*0.25) * 1.8), i)
                setActorX(_G['defaultStrum'..i..'X'] + 24 * math.sin((currentBeat + i*0.02)), i)
            end
        end
    end
    
    if difficulty == 3 then -- we're on rematch mode
        if swayingstart then
            for i=0,7 do
                setActorY(defaultStrum0Y + 8 * math.cos((currentBeat + i*0.2) * 1.4), i)
            end
        end
        if swayingy then
            for i=0,7 do
                setActorY(defaultStrum0Y + 2 * math.cos((currentBeat + i*0.25) * 1.5), i)
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin(currentBeat + i*1), i)
            end
        end
        if swayingx then
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 24 * math.sin((songPos / 1000) * math.pi), i)
                setActorY(_G['defaultStrum'..i..'Y'] + 20 * math.sin((songPos / 1000) * 2 * math.pi), i)
            end
        end
        if swayingboth then
            for i=0,7 do
                setActorY(_G['defaultStrum'..i..'Y'] + 30 * math.sin((songPos / 1000) * 2 * math.pi), i)
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin(currentBeat + i*1.2), i)
            end
        end
        if swayingintense then
            local currentBeat = (songPos / 500)*(bpm/60)
            camHudAngle = 1 * math.cos((currentBeat))
            for i=0,7 do
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.sin(currentBeat + i*1), i)
                setActorX(_G['defaultStrum'..i..'X'] + 24 * math.sin((songPos / 1000) * math.pi), i)
            end
        end
    end
    
    if difficulty == 1 then -- we're on normal
        if swayingstart then
            for i=0,7 do
                setActorY(defaultStrum0Y + 6 * math.cos((currentBeat + i*0.2) * 1.2), i)
            end
        end
        if swayingy then
            for i=0,7 do
                setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.25) * 1.5), i)
            end
        end
        if swayingx then
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)), i)
            end
        end
        if swayingboth then
            for i=0,7 do
                setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.25) * 1.5), i)
                setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)), i)
            end
        end
        if swayingintense then
            local currentBeat = (songPos / 1000)*(bpm/80)
            for i=0,7 do
                setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.25) * 1.5), i)
                setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)), i)
            end
        end
    end
    
    if difficulty == 0 then -- we're on easy
        if swayingstart then
            for i=0,7 do
                setActorY(defaultStrum0Y + 7 * math.cos((currentBeat + i*0.15) * 1), i)
            end
        end
        if swayingy then
            for i=0,7 do
                setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.3) * 1.2), i)
            end
        end
        if swayingx then
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 6 * math.sin((currentBeat + i*0)), i)
            end
        end
        if swayingboth then
            for i=0,7 do
                setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.3) * 1.2), i)
                setActorX(_G['defaultStrum'..i..'X'] + 6 * math.sin((currentBeat + i*0)), i)
            end
        end
        if swayingintense then
            for i=0,7 do
                setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.35) * 1.2), i)
                setActorX(_G['defaultStrum'..i..'X'] + 8 * math.sin((currentBeat + i*0)), i)
            end
        end
    end
end

function beatHit (beat)
    if beat == 32 then
	    swayingy = true	
	end	
    if beat == 96 then
	    swayingy = false	
        swayingx = true
	end	
    if beat == 192 then
		swayingx = false	
        swayingy = true
    end
    if beat == 224 then
		swayingy = false	
        swayingboth = true
    end
    if beat == 288 then
		swayingboth = false	
        swayingy = true
    end
    if beat == 320 then
		swayingy = false	
        swayingintense = true
    end
if difficulty == 3 then
    if beat == 420 then
        resetnotes = true
        swayingintense = false
        for i=0,7 do
            tweenFadeIn(i,0,2)
        end
    end
end
if difficulty == 2 then
    if beat == 368 then
        swayingintense = false
    end
end
if difficulty == 1 then
    if beat == 368 then
        swayingintense = false
    end
end
if difficulty == 0 then
    if beat == 368 then
        swayingintense = false
    end
end
end

function stepHit (step)
    if difficulty == 3 then
        if step == 1 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) + 360, 0.5)
        end
    end
    if step == 16 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) - 360, 0.5)
        end
    end
    if step == 32 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) + 360, 0.5)
        end
    end
    if step == 48 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) - 360, 0.5)
        end
    end
    if step == 64 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) + 360, 0.5)
        end
    end
    if step == 80 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) - 360, 0.5)
        end
    end
    if step == 96 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) + 360, 0.5)
        end
    end
    if step == 112 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) - 360, 0.5)
        end
    end
    if step == 120 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) + 360, 0.2)
        end
    end
    if step == 124 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) - 360, 0.2)
        end
    end
        if step == 383 then
            resetnotes = true
        end
        if step == 384 then
            resetnotes = false
        end
        if step == 1151 then
            resetnotes = true
        end
        if step == 1153 then
            resetnotes = false
            swayingy = false
            swayingstart = true
        end
    end
end