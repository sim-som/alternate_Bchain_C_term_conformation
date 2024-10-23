#!/bin/bash -f

echo $1     # input pdb file
echo $2     # input pH value


rm -f dotfile.pdb
rm -f sasaisolated.pdb
rm -f sasafolded.pdb
rm -f aburied.pdb
rm -f sfesasathres20.pdb
rm -f sfekluge7.2.pdb
rm -f hbonds.pml
rm -f aspkluge7.2.pdb
rm -f pctsideburied.pdb
rm -f sfekluge7.2.sumperresid.pdb
rm -f accessiblesurfacearea_v07.2d.log
rm -f hbunsatisfied.pdb
/home/simon/software/standard_free_energy/accessiblesurfacearea_v07.2d << EOF | tee accessiblesurfacearea_v07.2d.log
$1
$2
EOF

echo 'Summary'
grep 'Solvation free energy for chain' accessiblesurfacearea_v07.2d.log | grep kluge