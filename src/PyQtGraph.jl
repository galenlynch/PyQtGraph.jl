__precompile__()
module PyQtGraph

using PyCall

export
    # Types
    QtApp,

    # Python modules
    pg,
    qtc,
    qtg,

    # functions
    layout_widget,
    link_x_dims,
    linked_subplot_grid,
    subplot_grid,
    get_viewbox

const pg = PyNULL()
const qtc = PyNULL()
const qtg = PyNULL()
const qt5 = PyNULL()

include("util.jl")
include("app.jl")
include("subplots.jl")

function __init__()
    copy!(qt5, pyimport("PyQt5"))
    copy!(pg, pyimport("pyqtgraph"))
    copy!(qtc, pg[:Qt][:QtCore])
    copy!(qtg, pg[:Qt][:QtGui])
end

end # module
