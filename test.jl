using DelimitedFiles
obj = readdlm("ShoulderCoordinates.csv")

A = readdlm("ShoulderCoordinates.csv",',', Float64, '\n')
