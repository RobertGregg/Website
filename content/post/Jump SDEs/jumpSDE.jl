using DiffEqJump, Catalyst

#Create a grid for animals to live on
dim = (64,64) #size of grid
numberOfNodes = prod(dim) #number of locations
grid = CartesianGrid(dim) #grid object

#"Reactions" for the Lotka–Volterra equations
#Note: β̄ = β - δ
LV_model = @reaction_network begin
    α,     x --> 2x
    β̄,     x + y --> y
    δ,     x + y --> 2y
    γ,     y --> ∅
end α β̄ δ γ

#Record the number of species in the model (2 in this case)
numberOfSpecies = numspecies(LV_model)

#Create an initial grid for each species
prey = zeros(Int,dim)
prey[1:dim[1]÷2,1:dim[2]÷2] .= 5  #all prey in bottom left corner
predators = reverse(prey) #all predators in top right corner

#Input requires each row in initial condition to be flattened
u₀ = zeros(Int, numberOfSpecies, numberOfNodes)
u₀[1,:] = prey[:] 
u₀[2,:] = predators[:]

#Parameters and timespan for the model
p = (2.0, 0.02, 0.02, 1.06) #α β̄ δ γ
tspan = (0.0,20.0)

#How easy is it for species to move between locations?
hopConstants = ones(numberOfSpecies, numberOfNodes) #all set to one for now

#Create a mass action jump object
reactantStoich = [filter(x-> 0 ∉ x, 1:numberOfSpecies .=> col)  for col in eachcol(substoichmat(LV_model))]
netStoich = [filter(x-> 0 ∉ x , 1:numberOfSpecies .=> col)  for col in eachcol(netstoichmat(LV_model))]
massActionJumps = MassActionJump(reactantStoich, netStoich; param_idxs=1:numparams(LV_model))

#Generate the JumpProblem
prob  = DiscreteProblem(u₀, tspan, p)
alg = DirectCRDirect() #could use NSM()
jumpProb = JumpProblem(prob, alg, massActionJumps, hopping_constants=hopConstants, spatial_system = grid, save_positions=(false, false))

#Solve the JumpProblem
sol = solve(jumpProb, SSAStepper(), saveat=0.1)


using Plots, Printf

#Plot an animation of the pedators and prey interacting
anim = @animate for (currState,t) in tuples(sol)
    currTime = @sprintf "Time: %.2f" t

    p1 = heatmap( reshape(currState[1,:],dim), alpha=1.0, c=:Blues_9, clims=(0,400), framestyle = :box, aspect_ratio=:equal, xlims=(1,dim[1]),ylims=(1,dim[1]), xlabel="Prey", title=currTime)
    p2 = heatmap( reshape(currState[2,:],dim), alpha=1.0, c=:Oranges_9, clims=(0,400),framestyle = :box, aspect_ratio=:equal,xlims=(1,dim[1]),ylims=(1,dim[1]), xlabel="Predators")
    plot(p1,p2, layout=(1,2))
end

gif(anim, "anim.gif")