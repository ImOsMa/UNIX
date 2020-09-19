#!/bin/bash

begin="Please, enter one of this thing: \\n->stone\n->paper\n->scissors\n"

while true
do
  echo -e $begin
  
  cheating=$((RANDOM%100))
  comp=$((RANDOM%3))
  # 0 -stone
  # 1 - paper
  # 2 - scissors
  
  read user
  if [[ "$user" != "paper" ]] && [[ "$user" != "stone" ]] && [[ "$user" != "scissors" ]]
  then
    echo "Please, enter the correct thing."
    continue
  fi
  echo  "---------"
  if [ $cheating -lt 56 ]; then
    if [ "$user" = "paper" ]; then
      echo "$user vs scissors"
    elif [ "$user" = "stone" ]; then
      echo "$user vs paper"
    elif [ "$user" = "scissors" ]; then 
      echo "$user vs stone"
    fi
   echo "You lose without chances"
   
  else
      if [[ "$user" = "paper" ]] && [[ "$comp" = "2" ]]; then
        echo "$user vs scissors"
        echo "You lose with chances"
      elif [[ "$user" = "stone" ]] && [[ "$comp" = "1" ]]; then
        echo "$user vs paper"
        echo "You lose with chances"
      elif [[ "$user" = "scissors" ]] && [[ "$comp" = "0" ]]; then 
        echo "$user vs stone"
        echo "You lose with chances"
      fi
    
      if [[ "$user" = "paper" ]] && [[ "$comp" = "1" ]]; then
        echo "$user vs $user"
        echo "It's draw"
      elif [[ "$user" = "stone" ]] && [[ "$comp" = "0" ]]; then
        echo "$user vs $user"
        echo "It's draw"
      elif [[ "$user" = "scissors" ]] && [[ "$comp" = "2" ]]; then 
        echo "$user vs $user"
        echo "It's draw"
      fi
    
      if [[ "$user" = "paper" ]] && [[ "$comp" = "0" ]]; then
        echo "$user vs stone"
        echo "My congratulations, you win"
        exit
      elif [[ "$user" = "stone" ]] && [[ "$comp" = "2" ]]; then
        echo "$user vs scissors"
        echo "My congratulations, you win"
        exit
      elif [[ "$user" = "scissors" ]] && [[ "$comp" = "1" ]]; then 
        echo "$user vs paper"
        echo "My congratulations, you win"
        exit
      fi  
  fi
  echo "---------"
done
