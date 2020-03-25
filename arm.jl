using RigidBodyDynamics
using RigidBodySim
using MeshCatMechanisms


# get model from urdf file
mechanism = parse_urdf("arm.urdf")

#get state from model
state = MechanismState(mechanism)

#get the joints of the model
shoulder, elbow = joints(mechanism)

#sets velocity vector of shoulder
set_velocity!(state, shoulder, 1.5)
set_velocity!(state, elbow, -.7)






total_time = 10
#simulate the model
#return vector of times, vectors of configuration, vectors of velocity
ts, qs, vs = simulate(state, total_time, Δt = 1e-3);


mvis = MechanismVisualizer(mechanism,URDFVisuals("arm.urdf"))
open(mvis)
MeshCatMechanisms.animate(mvis, ts, qs; realtimerate = 1.)
