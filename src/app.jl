struct PlotWindow
    win::Py
end

struct QtApp
    app::Py
end

QtApp() = QtApp(qtw.QApplication(pylist()))

function (app::QtApp)(win::PlotWindow)
    win.win.show()
    pyconvert(Int, app.app.exec())
end

(app::QtApp)() = pyconvert(Int, app.app.exec())
