
# Definition of all routes of the route tree. 

function fade(x, y, speed, δt)
    return x, y + speed * δt
end

function post(x, y, speed, δt; cut = 10.0, angle = 45.0)
    if y < cut
        return x, y + speed *δt
    else
        return x + speed * δt * cosd(angle), y + speed * δt * sind(angle)
    end
end
