using MeshCat
using GeometryTypes
using CoordinateTransformations
using StaticArrays

include("CSVtoCoordinates.jl")
using .CSVtoVector

include

HeadCoordinates = CSVtoVector.getCoordinates("HeadCoordinates.csv")
ChestCoordinates = CSVtoVector.getCoordinates("ChestCoordinates.csv")

RightShoulderCoordinates = CSVtoVector.getCoordinates("RightShoulderCoordinates.csv")
RightElbowCoordinates = CSVtoVector.getCoordinates("RightElbowCoordiates.csv")
RightWristCoordinates = CSVtoVector.getCoordinates("RightWristCoordinates.csv")

LeftShoulderCoordinates = CSVtoVector.getCoordinates("LeftShoulderCoordinates.csv")
LeftElbowCoordinates = CSVtoVector.getCoordinates("LeftElbowCoordiates.csv")
LeftWristCoordinates = CSVtoVector.getCoordinates("LeftWristCoordinates.csv")

LeftWaistCoordinates = CSVtoVector.getCoordinates("LeftWaist.csv")
RightWaistCoordinates = CSVtoVector.getCoordinates("RightWaist.csv")

LeftKneeCoordinates = CSVtoVector.getCoordinates("LeftKnee.csv")
RightKneeCoordinates = CSVtoVector.getCoordinates("RightKnee.csv")

LeftAnkleCoordinates = CSVtoVector.getCoordinates("LeftAnkleCoordinates.csv")
RightAnkleCoordinates = CSVtoVector.getCoordinates("RightAnkleCoordinates.csv")


vis = Visualizer()

DataLength = 65525

open(vis)

setobject!(vis[:Head][:Head], Sphere(Point(0.0,0.0,0.0),.05))
setobject!(vis[:Torso][:Chest], Sphere(Point(0.0,0.0,0.0),.05))

setobject!(vis[:RightHand][:Shoulder], Sphere(Point(0.0,0.0,0.0),.05))
setobject!(vis[:RightHand][:Elbow], Sphere(Point(0.,0,0),.05))
setobject!(vis[:RightHand][:Wrist], Sphere(Point(0.,0,0),.05))

setobject!(vis[:LeftHand][:Shoulder], Sphere(Point(0.0,0.0,0.0),.05))
setobject!(vis[:LeftHand][:Elbow], Sphere(Point(0.,0,0),.05))
setobject!(vis[:LeftHand][:Wrist], Sphere(Point(0.,0,0),.05))

setobject!(vis[:RightLeg][:Waist], Sphere(Point(0.0,0.0,0.0),.05))
setobject!(vis[:LeftLeg][:Waist], Sphere(Point(0.0,0.0,0.0),.05))

setobject!(vis[:RightLeg][:Knee], Sphere(Point(0.0,0.0,0.0),.05))
setobject!(vis[:LeftLeg][:Knee], Sphere(Point(0.0,0.0,0.0),.05))

setobject!(vis[:RightLeg][:Ankle], Sphere(Point(0.0,0.0,0.0),.05))
setobject!(vis[:LeftLeg][:Ankle], Sphere(Point(0.0,0.0,0.0),.05))


anim = Animation()


atframe(anim, 0) do

    settransform!(vis[:Head][:Head], Translation(HeadCoordinates[1]))
    settransform!(vis[:Torso][:Chest], Translation(ChestCoordinates[1]))

    settransform!(vis[:RightHand][:Shoulder], Translation(RightShoulderCoordinates[1]))
    settransform!(vis[:RightHand][:Elbow], Translation(RightElbowCoordinates[1]))
    settransform!(vis[:RightHand][:Wrist], Translation(RightWristCoordinates[1]))

    settransform!(vis[:LeftHand][:Shoulder], Translation(LeftShoulderCoordinates[1]))
    settransform!(vis[:LeftHand][:Elbow], Translation(LeftElbowCoordinates[1]))
    settransform!(vis[:LeftHand][:Wrist], Translation(LeftWristCoordinates[1]))

    settransform!(vis[:RightLeg][:Waist], Translation(RightWaistCoordinates[1]))
    settransform!(vis[:RightLeg][:Knee], Translation(RightKneeCoordinates[1]))
    settransform!(vis[:RightLeg][:Ankle], Translation(RightAnkleCoordinates[1]))

    settransform!(vis[:LeftLeg][:Waist], Translation(LeftWaistCoordinates[1]))
    settransform!(vis[:LeftLeg][:Knee], Translation(LeftKneeCoordinates[1]))
    settransform!(vis[:LeftLeg][:Ankle], Translation(LeftAnkleCoordinates[1]))
end
atframe(anim, 120) do
    for i in DataLength

        settransform!(vis[:Head][:Head], Translation(HeadCoordinates[i]))
        settransform!(vis[:Torso][:Chest], Translation(ChestCoordinates[i]))

        settransform!(vis[:RightHand][:Shoulder], Translation(RightShoulderCoordinates[i]))
        settransform!(vis[:RightHand][:Elbow], Translation(RightElbowCoordinates[i]))
        settransform!(vis[:RightHand][:Wrist], Translation(RightWristCoordinates[i]))

        settransform!(vis[:LeftHand][:Shoulder], Translation(LeftShoulderCoordinates[i]))
        settransform!(vis[:LeftHand][:Elbow], Translation(LeftElbowCoordinates[i]))
        settransform!(vis[:LeftHand][:Wrist], Translation(LeftWristCoordinates[i]))

        settransform!(vis[:RightLeg][:Waist], Translation(RightWaistCoordinates[i]))
        settransform!(vis[:RightLeg][:Knee], Translation(RightKneeCoordinates[i]))
        settransform!(vis[:RightLeg][:Ankle], Translation(RightAnkleCoordinates[i]))

        settransform!(vis[:LeftLeg][:Waist], Translation(LeftWaistCoordinates[i]))
        settransform!(vis[:LeftLeg][:Knee], Translation(LeftKneeCoordinates[i]))
        settransform!(vis[:LeftLeg][:Ankle], Translation(LeftAnkleCoordinates[i]))


    end
end
setanimation!(vis, anim)
