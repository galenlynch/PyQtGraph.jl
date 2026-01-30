function get_viewbox(a::Py)
    vb = a
    while !pyisnone(vb) && pyconvert(String, vb.__class__.__name__) != "ViewBox"
        vb = vb.getViewBox()
    end
    return vb
end

function convert_qdate(qdate::Py)
    Date(pyconvert(Int, qdate.year()), pyconvert(Int, qdate.month()), pyconvert(Int, qdate.day()))
end

function convert_qtime(qtime::Py)
    Time(
        pyconvert(Int, qtime.hour()),
        pyconvert(Int, qtime.minute()),
        pyconvert(Int, qtime.second()),
        pyconvert(Int, qtime.msec())
    )
end

function convert_qdatetime(qdatetime::Py)
    qdate = qdatetime.date()
    qtime = qdatetime.time()
    DateTime(convert_qdate(qdate)) + convert_qtime(qtime).instant
end
