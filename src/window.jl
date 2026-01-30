# Make a simple window
function plotwindow(args...; kwargs...)
    PlotWindow(pg.plot(args...; kwargs...))
end
