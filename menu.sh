#!bin/bash

# vars

f_name="<file_name>"
begin="My wide opportunities: \n\n -edit $f_name\n -create $f_name\n -rename $f_name -> <new_f_name>\n -delete $f_name \n -move $f_name -> <new_path>\n -copy <f_name_1> -> <f_name_2> \n -view (to show all files in this directory)\n -exit\n\n"

clear

echo -e  "\t\t I will help you to manage your computer"
echo -e $begin

while true
do

read v

IFS=' ' read -ra params <<< "$v"
#edit file

 if [[ "$v" = "edit"* ]]
 then
 
  vi "${params[1]}"
   
  if [ "$?" = "0" ]
  then
    echo "${params[1]} was edited!"
  else 
    echo "${params[1]} wasn't edited!"
  fi
 
 elif [[ "$v" = "create"* ]]
 then
  touch "${params[1]}"
  if [ "$?" = "0" ]
  then
    echo "${params[1]} was created!"
  else 
    echo "${params[1]} wasn't created!"
  fi
  
 elif [[ "$v" = "rename"* ]]
 then
  mv "${params[1]}" "${params[2]}"
  
  if [ "$?" = "0" ]
  then
    echo "${params[1]} was renamed to ${params[2]}!"
  else 
    echo "${params[1]} wasn't renamed!"
  fi
  
 elif [[ "$v" = "delete"* ]]
 then
  rm "${params[1]}"
  if [ "$?" = "0" ]
  then
    echo "${params[1]} was deleted!"
  else 
    echo "${params[1]} wasn't deleted!"
  fi
 
 elif [[ "$v" = "move"* ]]
 then
  mv "${params[1]}" "${params[2]}"
  
  if [ "$?" = "0" ]
  then
    echo "${params[1]} was moved to ${params[2]}!"
  else 
    echo "${params[1]} wasn't moved!"
  fi
 
  elif [[ "$v" = "copy"* ]]
 then
  cp "${params[1]}" "${params[2]}"
  
  if [ "$?" = "0" ]
  then
    echo "${params[1]} was copied in ${params[2]}!"
  else 
    echo "${params[1]} wasn't copied!"
  fi
  
 elif [[ "$v" = "view"* ]]
 then
  ls
 
 elif [[ "$v" = "exit"* ]]
 then
  break
  
 
 else
  echo "Enter the right command"
 
 fi
done 

