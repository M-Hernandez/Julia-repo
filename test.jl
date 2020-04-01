using MeshCat, GeometryTypes, CoordinateTransformations

vis = Visualizer()
open(vis)
# open(vis)

setobject!(vis[:box1],Sphere(Point(0.,0,0),.10))

anim = Animation()

atframe(anim, 0) do
    settransform!(vis[:box1], Translation(0., 0, 0))
end
atframe(anim, 30) do
    settransform!(vis[:box1], Translation(0., 1, 0))
end

setanimation!(vis, anim)
