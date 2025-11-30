# A 2D Monte Carlo Particle simulation
A 10 particle in a 2D external potential using Metropolis Montecarlo on 101*101 lattice



# Key modules & function

Array.f90	        #  Initialize particle positions & occupancy grid
Potential.f90	        #  Compute 2D external potential Vext(x,y)
Initial.f90     	#  Reset histogram counters PT
Move.f90         	#  Metropolis Monte Carlo loop with trial moves
Probability.f90    	#  Calculate acceptance probability min(1,exp(-ΔE))
Randomnumber.f90        #  Clock-based pseudorandom number generator
Reacord.f90	        #  Record/analyze simulation results
main.f90	        #  Orchestrate simulation workflow


#Quick start 
#compile
gfortran -o mcarlo main.f90
#runs
./mcarlo






