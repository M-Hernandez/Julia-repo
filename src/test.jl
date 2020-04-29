using MeshCat


vis = Visualizer()

open(vis)

# setobject!(vis[:Head][:Head], Sphere(Point(0.0,2,0.0),.05))
#
#
# settransform!(vis["/Cameras/default"], Translation(0., 0, 2) )

anim = Animation()

atframe(anim, 0) do
    setprop!(vis["/Cameras/default/rotated/<object>"], "zoom", 1)
end

atframe(anim, 30) do
   settransform!(vis["/Cameras/default"], Translation(0., 0, 1))
   setprop!(vis["/Cameras/default/rotated/<object>"], "zoom", 0.5)
end

setanimation!(vis, anim)
