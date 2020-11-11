#!bin/bash

function value()
{
    echo $1 > file.txt
    
    grep "^[nmNM][oauyOAUY][lL]*" file.txt > file2.txt
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 0
 fi
 
    grep "^[oaeiuOAEIU][dtrnDTRN].*" file.txt > file2.txt
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 1
 fi
 
    grep "^[dtpDTPR][vfhwVFHW]." file.txt > file2.txt
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 2
 fi
   
   grep "^[tpdTD][rlnRN]." file.txt > file2.txt
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 3
 fi   
   grep "^[chstCHST][chstCHST][eiEI][tdTD][yuieYUIE][rR]." file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 4
 fi
   grep "^[pP][yaiYAI][tdnpTDNP]*" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 5
 fi
 
  grep "^[shcSHC][eiaEIA][sczSCZ]\W*" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 6
 fi
 
  grep "^[cszCSZ][eiaEIA][mnltMNLT]\W*" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 7
 fi
 grep "^[vwfVWF][oauyOAUY][sczSCZ][eiaEIA]\W*" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 8
 fi
  grep "^[dtpDTP][eiaEIA][vwfVWF][yiaYIA][tdpTDP]\W*" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 9
 fi
 
 grep "^[ptdfPTDF][lnLN][uyaeUYAE][sczSCZ]" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo "plus"
    echo -n > file.txt
    echo -n > file2.txt
    return 10
 fi
 
 grep "^[nmNM][ieuaIEUA][nmNM][uyaiIEUA][sczSCZ]" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 11
 fi
 
 grep "^[uyUY][mnMN][mnMN][oauyOAUY][zscZSC][yuiYUI][tdTD]\W*" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 12
 fi 
 
 grep "^[dtpDTP][eiEI][lnmLNM][eiEI][tdTDmM]\W*" file.txt > file2.txt
 
 if [ -s file2.txt ]
    then
    echo -n > file.txt
    echo -n > file2.txt
    return 13
 fi 
 
 return 15
}

while true
do
  echo "Enter the first number: "
  read num1
  value $num1
  num1=`echo $?`
  if [ $num1 -gt 9 ]
  then
  echo "Enter the correct variant!"
  elif [ $num1 -le 9 ] 
  then
    break
  fi
done

while true
do 
 echo "Enter the operation"
 read op
 value $op
 op=`echo $?`
 if [ $op == 15 -o $op -le 9  ]
  then
   echo "Enter the correct variant"
  elif [ $op != 15 ] 
  then
  
if [ "$op" == 10 ]
 then
  op="+"
 fi

if [ "$op" == 11 ]
 then
  op="-"
 fi
 
if [ "$op" == 12 ]
 then
  op="*"
 fi
 
if [ "$op" == 13 ]
 then
  op="/"
 fi
  
   break
 fi 
done

while true
do
  echo "Enter the second number: "
  read num2
  value $num2
  num2=`echo $?`
  if [ $num2 -gt 9 ] 
  then
  echo "Enter the correct variant!"
  
  elif [  $num2 == 0  -a  "$op" == "/"  ]
  then
  echo "Enter the correct variant! Division on zero!"
  
  elif [ $num2 -le 9  -a $num2 != 0  -a "$op" != "/" ] 
  then
    break
  
  
  fi
done

 if [ "$op" = "*" ]
  then
    echo "$num1 $exp $num2 = `expr $num1 "*" $num2`"
  else
    echo "$num1 $op $num2 = `expr $num1 $op $num2`"
  fi
