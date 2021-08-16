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
    if beat == 368 then
        swayingintense = false
    end
end

function stepHit (step)

end