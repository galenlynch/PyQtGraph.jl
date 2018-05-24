function get_viewbox(a::PyObject)
    vb = a
    while vb != nothing && vb[:__class__][:__name__] != "ViewBox"
        vb = vb[:getViewBox]()
    end
    return vb
end
