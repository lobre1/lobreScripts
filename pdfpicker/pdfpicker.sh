#!/bin/bash
swallowbspwm (){
  export hiddenID=$(bspc query -n -N)
	xdo hide ${hiddenID}
	${*}
	xdo show -r ${hiddenID}
}


counter=1
for file in ${PWD}/*/*
do
	convert -thumbnail x1000 -background white -alpha remove ${file}[0] ~/.cache/pdfPics/$((++counter))$(basename ${file}).png
done 
	swallowbspwm mupdf -I ${PWD}/$(find */$(basename $(swallowbspwm ~/.local/bin/picker/picker -to ~/.cache/pdfPics/*) | sed 's/^[0-9]*//' | sed -r 's/\.png//'))
