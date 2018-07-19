struct QtApp
    app::PyObject
end

QtApp() = QtApp(qtg[:QApplication]([]))

function (app::QtApp)(win::PyObject)
    win[:show]()::Void
    app.app[:exec_]()::Int
end

(app::QtApp)() = app.app[:exec_]()::Int
