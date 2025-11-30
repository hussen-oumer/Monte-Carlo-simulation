# 2D Monte Carlo Particle Simulation ✨

**Master's coursework: 10 particles in 2D external potential using Metropolis Monte Carlo on 101×101 lattice.**

## 🚀 Quick Start

gfortran main.f90 -o mcarlo
./mcarlo
cat 2Dmcarlo.txt # Acceptance probabilities vs position



## 🧬 Code Modules

| Module | Purpose |
|--------|---------|
| `Array.f90` | Initialize particle positions & occupancy grid |
| `Potential.f90` | Compute 2D external potential `Vext(x,y)` |
| `Initial.f90` | Reset histogram counters `PT` |
| `Move.f90` | **Metropolis MC loop** with trial moves |
| `Probability.f90` | Acceptance probability `min(1,exp(-ΔE))` |
| `Randomnumber.f90` | Clock-based pseudorandom number generator |
| `Reacord.f90` | Record/analyze simulation results |
| `main.f90` | Orchestrate simulation workflow |

## 📊 Simulation Parameters
| Parameter | Value | Description |
|-----------|-------|-------------|
| `N_part` | 10 | Particles |
| `N_steps` | 100k | MC steps |
| `N_site` | 50 | Lattice half-size (±50) |

## 📈 Output


## 🎓 Academic Context
**Master's Computational Physics** - modular Fortran design demonstrating Metropolis algorithm implementation.

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)




