#!/bin/bash -f
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
./accessiblesurfacearea_v07.2d <<eof | tee accessiblesurfacearea_v07.2d.log
input_PDBs/alternate_Bchain_C_term_conformation/glargin_pmL1_alt_conf_5layers-delH.pdb
4.0
eof
echo 'Summary'
grep 'Solvation free energy for chain ' accessiblesurfacearea_v07.2d.log | grep kluge
