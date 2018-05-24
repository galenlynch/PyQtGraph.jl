struct QtApp
    app::PyObject
end

QtApp() = QtApp(qtg[:QApplication]([]))

function (app::QtApp)
    app.app[:exec_]()
end
