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
        local currentBeat = (songPos / 1000)*(bpm/69)
		for i=0,7 do
            setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.25) * 1.5), i)
            setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0)), i)
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