using RigidBodyDynamics
using RigidBodySim
using MeshCatMechanisms
using MeshCat


mechanism = parse_urdf("test.urdf")

state = MechanismState(mechanism)

shoulder, elbow = joints(mechanism)

set_velocity!(state, shoulder, 1.5)


total_time = 10
ts, qs, vs = simulate(state, total_time, Δt = 1e-3);


mvis = MechanismVisualizer(mechanism,URDFVisuals("test.urdf"))
open(mvis)
MeshCatMechanisms.animate(mvis, ts, qs; realtimerate = 1.);
