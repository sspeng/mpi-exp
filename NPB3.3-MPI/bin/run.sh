#!/bin/bash

# config/suite.def
# This file is used to build several benchmarks with a single command. 
# Typing "make suite" in the main directory will build all the benchmarks
# specified in this file. 
# Each line of this file contains a benchmark name, class, and number
# of nodes. The name is one of "cg", "is", "ep", mg", "ft", "sp", "bt", 
# "lu", and "dt". 
# The class is one of "S", "W", "A", "B", "C", "D", and "E"
# (except that no classes C, D and E for DT, and no class E for IS).
# The number of nodes must be a legal number for a particular
# benchmark. The utility which parses this file is primitive, so
# formatting is inflexible. Separate name/class/number by tabs. 
# Comments start with "#" as the first character on a line. 
# No blank lines. 
# The following example builds 1 processor sample sizes of all benchmarks. 

rpath=$1

mpirun --np 128 --bynode --machinefile ~/mpi-exp/machinefile --mca btl_tcp_if_include 10.10.1.0/24 ft.B.128 >> ${rpath}.ft.txt
mpirun --np 144 --bynode --machinefile ~/mpi-exp/machinefile --mca btl_tcp_if_include 10.10.1.0/24 sp.A.144 >> ${rpath}.sp.txt
mpirun --np 128 --bynode --machinefile ~/mpi-exp/machinefile --mca btl_tcp_if_include 10.10.1.0/24 lu.A.128 >> ${rpath}.lu.txt
mpirun --np 144 --bynode --machinefile ~/mpi-exp/machinefile --mca btl_tcp_if_include 10.10.1.0/24 bt.A.144 >> ${rpath}.bt.txt
mpirun --np 128 --bynode --machinefile ~/mpi-exp/machinefile --mca btl_tcp_if_include 10.10.1.0/24 is.D.128 >> ${rpath}.is.txt
mpirun --np 128 --bynode --machinefile ~/mpi-exp/machinefile --mca btl_tcp_if_include 10.10.1.0/24 ep.C.128 >> ${rpath}.ep.txt
mpirun --np 128 --bynode --machinefile ~/mpi-exp/machinefile --mca btl_tcp_if_include 10.10.1.0/24 cg.B.128 >> ${rpath}.cg.txt
