using MeshCat
using GeometryTypes
using CoordinateTransformations


# create a  3d plane visualizer
vis = Visualizer()

#open 3d plane on localhost in a browser window
open(vis)

#renders visualizer created
#render(vis)


setobject!(vis[:s1], Sphere(Point(1.0,1.0,1.0),.10))
setobject!(vis[:s2], Sphere(Point(-1.0,-1.0,1.0),.10))

# anim = Animation(30)
# atframe(anim, vis, 0) do frame
#     settransform!(frame, LinearMap(RotZ(pi)))
# end
# atframe(anim, vis, 30) do frame
#     settransform!(frame, LinearMap(RotZ(pi)))
# end
# setanimation!(vis, anim)



#move sphere down -.25
#settransform!(vis, Translation(0, 0, -0.25))
