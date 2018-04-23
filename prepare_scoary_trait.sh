#!/usr/bin/bash

# input phenotype csv
file=$1
roary=$2

echo "Name,resistance,heteroresistance">trait.csv
while IFS="," read -r ID resistance hetero
do
        if grep -q "$ID" $roary
        then
                echo "fa_cg_$ID,$resistance,$hetero">> trait.csv
        fi
done < $file
