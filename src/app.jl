struct QtApp
    app::Py
end

QtApp() = QtApp(qtw.QApplication(pylist()))

function (app::QtApp)(win::Py)
    win.show()
    pyconvert(Int, app.app.exec())
end

(app::QtApp)() = pyconvert(Int, app.app.exec())
