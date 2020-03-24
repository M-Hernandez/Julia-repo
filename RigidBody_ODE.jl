using RigidBodyDynamics, RigidBodySim

#mechanism = parse_urdf(Float64, "Acrobot.urdf")

function lazycontroller!(τ::AbstractVector, t::Number,
                         state::MechanismState)
    τ .= 0
end

dynamics = Dynamics(mechanism, lazycontroller!)

# create a 5-second simulation
state = MechanismState(mechanism)
problem = ODEProblem(dynamics, state, (0., 5.))
solution = solve(problem, RK4()) # Solve using RK-4 integration

# Animate the result
using MeshCatMechanisms
vis = MechanismVisualizer(mechanism)
setanimation!(vis, solution)
