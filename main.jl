using .Cornerback
using GLMakie

# Receiver runs the chosen route.

# x, y = fade(x, y, speed, δt)
# x, y = post(x, y, speed, δt)

function make_figure(obs)
    # Create figure
    fig = Figure(); display(fig)
    ax = Axis(fig[1, 1])

    # Plot observables
    scatter!(ax, obs)

    # Plot static parameters
    ax.aspect = DataAspect()
    xlims!(ax, -1, 20)
    ylims!(ax, -1, 40)

    return fig, ax
end


function main()
    # Receiver parameters
    speed = 10.0
    δt = 0.01
    x = 0.0
    y = 0.0
    pos = Observable(Point2f(x, y))

    fig, ax = make_figure(pos)

    for i in 1:10000
        x, y = post(x, y, speed, δt; cut = 10.0, angle = 60.0)
        pos[] = Point2f(x, y)
        sleep(0.01)
    end

end

main()