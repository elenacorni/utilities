#!/bin/bash
echo " "
for sizeMtx in 128 512 2048
do
        for warmup in 0 1
        do
                for proc in 2 4 8 16
                do
                        if [ ${warmup} -eq 0 -a ${proc} -eq 2 ]; then
                                echo mpirun -np ${proc} --allow-run-as-root ./mtxMul.mpi.O3 -rA=${sizeMtx} -cA=${sizeMtx} -cB=${sizeMtx} -w=${warmup}
                        fi
                        # [[20356,1],0]: A high-performance Open MPI point-to-point messaging
                        # module was unable to find any relevant network interfaces:
                        # Module: OpenFabrics (openib)
                        # Aggiungere a mpirun: --mca btl ^openib (es. mpirun -np 16 --mca btl ^openib ./a.out)
                        mpirun -np ${proc} --allow-run-as-root ./mtxMul.mpi.O3 -rA=${sizeMtx} -cA=${sizeMtx} -cB=${sizeMtx} -w=${warmup}
                done
                echo " "
        done
        echo "---------------------------------------------------------"
done
