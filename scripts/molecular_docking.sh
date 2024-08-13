#! /bin/bash

#PBS -l nodes=1:ppn=36
#PBS -V 
#PBS -e screen_result.err
#PBS -o screen_result.out
#PBS -j oe

module load intel-mpi
module load autodock-4
module load autodock-vina


#Split the files to different ligands

#create the processed folder to hold the ligands that have been processed 

mkdir output/processed

#Get all the files 
COUNT=0
i=0;
RANGE=2; # This the number of files to process at time
FILES=""; # An array to hold the files 

#Save all the files name in an array
for f in ~/Ligands/*.pdbqt
do 
  FILES[$i]=$f;
  i=$((i+1));
  COUNT=$i;
done 

START=0;
END=0;

while [ "$START" -lt "$COUNT"  ] 
do 
  END=$((START+RANGE-1));
  for index in `seq $START $END`;
  do
    if [ "$index" -gt "$COUNT" ] 
    then
        break;
    fi
 
    # get the files 
    f=${FILES[$index]};
 
    b=`basename $f .pdbqt`
    #echo Processing ligand $b
    mkdir -p output/$b
 
    if [ 1 -eq 2 ]
    then 
     echo "submit the job: $f"
    j=${b}.job
    d=`pwd`
    echo "#! /bin/bash" >> $j
    echo "module load intel-mpi" >> $j
    echo "module load autodock-4" >> $j
    echo "module load autodock-vina" >> $j
    echo "cd \$PBS_O_WORKDIR" >> $j
    echo "vina --config conf.txt  --ligand $f --out output/${b}/out.pdbqt --log output/${b}/log.txt" >> $j
    chmod +x $j
    qsub  -l pvmem=8gb -l nodes=1:ppn=10  $j
    rm $j # delete the job file

    
    else 
     echo "Process the job serially: $f"
     vina --config conf.txt --cpu 36  --ligand $f --out output/${b}/out.pdbqt --log output/${b}/log.txt
    fi 
  done

  START=$((START+RANGE)); 
  echo $START
done

