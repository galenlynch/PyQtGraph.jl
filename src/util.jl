function get_viewbox(a::PyObject)
    vb = a
    while vb != nothing && vb.__class__.__name__ != "ViewBox"
        vb = vb.getViewBox()
    end
    return vb
end

function convert_qdate(qdate::PyObject)
    Date(qdate.year()::Int, qdate.month()::Int, qdate.day()::Int)
end

function convert_qtime(qtime::PyObject)
    Time(
        qtime.hour()::Int,
        qtime.minute()::Int,
        qtime.second()::Int,
        qtime.msec()::Int
    )
end

function convert_qdatetime(qdatetime::PyObject)
    qdate = qdatetime.date()::PyObject
    qtime = qdatetime.time()::PyObject
    DateTime(convert_qdate(qdate)) + convert_qtime(qtime).instant
end
