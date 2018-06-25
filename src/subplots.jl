layout_widget() =  pg[:GraphicsLayoutWidget]()

function linked_subplot_grid(
    win::PyObject, args::Vararg{AbstractArray}; kwargs...
)
    plot_handles = subplot_grid(win, args...; kwargs...)
    link_x_dims(plot_handles)
    plot_handles
end
function linked_subplot_grid(args::Vararg{AbstractArray}; kwargs...)
    win = layout_widget()
    (win, linked_subplot_grid(win, args...; kwargs...))
end

function link_x_dims(handles::AbstractArray{PyObject})
    length(handles) <= 1 && return
    for handle in handles[2:end]
        handle[:setXLink](handles[1])
    end
end

function subplot_grid(
    layout::PyObject,
    rowspec::AbstractArray{<:Integer} = [1];
    titles::AbstractVector{<:AbstractString} = Vector{String}()
)
    n_row = length(rowspec)
    plot_handles = Vector{PyObject}(n_row)
    use_titles = length(titles) == n_row
    for (i, row_height) in enumerate(rowspec)
        kwargs = use_titles ? ((:title, titles[i]),) : ()
        i > 1 && layout[:nextRow]()
        plot_handles[i] = layout[:addPlot](;kwargs...)
        layout[:ci][:layout][:setRowStretchFactor](i - 1, row_height)
    end
    plot_handles
end

function subplot_grid(rowspec::AbstractArray = [1])
    win = layout_widget()
    plot_handles = subplot_grid(win, rowspec)
    (win, plot_handles)
end
