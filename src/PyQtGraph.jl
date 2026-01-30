module PyQtGraph

using Dates: Date, Time, DateTime
using PythonCall: pynew, pycopy!, pyimport, Py, pyconvert, pylist, pyisnone

export
    # Types
    PlotWindow,
    QtApp,

    # Python modules
    pg,
    qt6,
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

const pg = pynew()
const qt6 = pynew()
const qtc = pynew()
const qtg = pynew()
const qtw = pynew()
const rgv = pynew()

include("util.jl")
include("app.jl")
include("subplots.jl")
include("window.jl")

function __init__()
    ENV["PYQTGRAPH_QT_LIB"] = "PyQt6"
    pycopy!(qt6, pyimport("PyQt6"))
    pycopy!(pg, pyimport("pyqtgraph"))
    pycopy!(qtc, pg.Qt.QtCore)
    pycopy!(qtg, pg.Qt.QtGui)
    pycopy!(qtw, pg.Qt.QtWidgets)
    pycopy!(rgv, pyimport("pyqtgraph.widgets.RemoteGraphicsView"))
    return nothing
end

end # module
