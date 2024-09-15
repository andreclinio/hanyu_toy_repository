# /bin/bash

wait_for_enter() {
  echo "Press Enter to continue..."
  read -r  # Wait for Enter key press
}

function main() {
   nextTag=`date +"%Y%m%d-%H%M"`
   echo "Tag a ser criada: $nextTag"
   
   wait_for_enter

   git tag -a $nextTag -m 'Criação da tag $nextTag'
   git push origin $nextTag
}

main
