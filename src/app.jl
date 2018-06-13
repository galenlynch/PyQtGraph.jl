struct QtApp
    app::PyObject
end

QtApp() = QtApp(qtg[:QApplication]([]))

function (app::QtApp)(win::PyObject)
    win[:show]()
    app.app[:exec_]()
end

(app::QtApp)() = app.app[:exec_]()
