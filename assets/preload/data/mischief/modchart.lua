function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " donwscroll: " .. downscroll)
end


function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/95)
        for i=0,7 do
        setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.25) * 1.5), i)
        end
end

function beatHit (beat)

end