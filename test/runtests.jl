using PyQtGraph
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

app = QtApp()
(win, p1) = subplot_grid()
p1 = subplot_grid(win)[1]
(win, (p1, p2)) = subplot_grid([1, 2])

link_x_dims([p1, p2])

(win, (p1, p2)) = linked_subplot_grid([1, 2])
