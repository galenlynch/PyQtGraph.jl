__precompile__()
module PyQtGraph

using Compat, PyCall, Dates

export
    # Types
    QtApp,

    # Python modules
    pg,
    qt5,
    qtc,
    qtg,
    qtw,
    rgv,

    # functions
    convert_qdate,
    convert_qdatetime,
    convert_qtime,
    get_viewbox,
    layout_widget,
    link_x_dims,
    linked_subplot_grid,
    plotwindow,
    subplot_grid

const pg = PyNULL()
const qt5 = PyNULL()
const qtc = PyNULL()
const qtg = PyNULL()
const qtw = PyNULL()
const rgv = PyNULL()

include("util.jl")
include("app.jl")
include("subplots.jl")
include("window.jl")

function __init__()
    copy!(qt5, pyimport_conda("PyQt5", "pyqt"))
    copy!(qtw, pyimport("PyQt5.QtWidgets"))
    copy!(pg, pyimport_conda("pyqtgraph", "pyqtgraph"))
    copy!(qtc, pg[:Qt][:QtCore])
    copy!(qtg, pg[:Qt][:QtGui])
    copy!(rgv, pyimport("pyqtgraph.widgets.RemoteGraphicsView"))
end

end # module
