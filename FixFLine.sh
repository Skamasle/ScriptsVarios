#!/bin/bash
# Reemplazar primera linea
# v0.3 
# 2 nov 2015 | Nuevo malware que infecta la primera linea de los archivos
# Autor Maksim Usmanov
# RUN AT YOUR OWN RISK
#############
# This Script clean malware inyected in first line in PHP files
# THis script delete first line if get x61 considence and remplace it for 
# Common php tag <?php
# Modify this x61 if you have any orther malware string, this was made in 2015 fot if 300 k files
# Infected with singular malware, maybe you have something more
##############
check=x61
c=0
find . -name "*.php" -print0 | while read -d $'\0' archivo
do
#Fast search just first line gran, not scan entery file
res=$(head -n2 $archivo  | grep -c $check)
if [ $res -gt 0 ]; then
((c++))
#vamos mostrando archivos editados y cantidad.
echo "$c | $archivo "
sed -i '1 s/^.*$/<?php/g' $archivo
fi
done
