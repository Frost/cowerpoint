#!/usr/bin/env bash

slidesdir="$1"
number_of_slides=$(ls -1 $slidesdir| wc -l)
index=1

# find slide $index (alphabetically according to your file system) in
# $slidesdir, and run it through cowsay.
# The first line of the file may contain options to cowsay.
# If not, it should be left empty
view_slide() {
  slide="$slidesdir/$(ls -1 $slidesdir | tail -n +${index} | head -n 1)"
  read -a options <<< "$(head -1 $slide)"
  command() { cowsay "${@}"; }
  tail -n +2 $slide | command ${options[@]}
}

update_index() {
  read -sn 1 input
  case "$input" in
    j|n) index=$(( index + 1 ))
      ;;
    k|p) index=$(( index - 1 ))
      ;;
    q) index=$(( number_of_slides + 1 ))
      exit 0
      ;;
    *)
      if [[ $input -eq " " ]]; then
        index=$(( index + 1 ))
      fi
      ;;
  esac
  index=$(( index > number_of_slides ? number_of_slides + 1 : index ))
  index=$(( index < 1 ? 1 : index ))

  if [[ $index -le "0" ]]; then
    echo -n 0;
  else
    echo -n $index
  fi
}

view_slides() {
  while [ true ]; do
    clear
    if [ $index -gt $number_of_slides ]; then
      cowsay -d "<end of slides>"
    else
      view_slide $index
    fi
    update_index
  done
}

view_slides

