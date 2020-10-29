#!/bin/bash

# Author chmanu@gmail.com

# IMPORTANT : the default shell is dash,  arrays are not supported => bash only !


# works only with motifs named consecutive numbers like 01.png 02.png in motifs subdirectory
# bgcolor is taken randomly
bgcolors=("#55ff55" "#55F" "#F55" "#FF0" "#00cc66" "#00bbdd" "orange" "purple")

if [ "x$1" == "x-bg" ] ; then
        shift
        txt=$@
else
        txt=$@

        c=0
        n=0

        nbmotif=`ls motifs/[0-9]*.png | wc -l `
        for i in `echo $txt | fold -w1 `; do
                c=$((c+1))
                num=$((num+1))
                if [ $c -gt ${nbmotif} ] ; then
                        c=1
                fi
                if [ $c -lt 10 ] ; then
                convert -quiet motifs/0${c}.png +repage ./tmp_gcw1_$num.png
        else
                convert -quiet motifs/${c}.png +repage ./tmp_gcw1_$num.png
                fi

                convert ./tmp_gcw1_$num.png +repage -resize '266x235^' ./tmp_gcw1_$num.png
                convert -background none -size 266x235 -font /usr/share/fonts/truetype/dejavu/DejaVuSansCondensed-Bold.ttf -pointsize 200 -fill white -gravity west "label:\ ${i} " '(' ./tmp_gcw1_$num.png -gravity center -crop 266x235+0+0 +repage ')' +swap -alpha off -compose copy_opacity -composite -compose over -brightness-contrast 0,0 '(' +clone -alpha deactivate -fill black -colorize 100% -alpha on -channel A -blur 0x2.5 -level 0x0 +channel ')' +swap -background none -compose over -layers merge +repage -channel a -morphology erode diamond:1 -blur 0x1 -level 50x100% +channel '(' ')' '(' ')' '(' ')' -fuzz 0% -trim +repage ./tmp_gcw2_$num.png
                convert ./tmp_gcw2_$num.png -background none -flatten -gravity center -bordercolor none -border 0 $num-${i}.png
                rm ./tmp_gcw1_$num.png ./tmp_gcw2_$num.png
        done

fi

sleep 1


cpt=0
nmot=0
bgcolorslength=${#bgcolors[@]}
bgcolorslength=$((bgcolorslength-1))

for i in `echo $txt ` ; do 
        nmot=$((nmot+1))
        files=""
        for l in `echo $i | fold -w1 `; do
                cpt=$((cpt+1))
                files="$files $cpt-${l}.png "
        done
        # in order to switch the random number, let's do a pause
        sleep .05
        rnd=`shuf -i 0-${bgcolorslength} -n1 `
        bgcolor=${bgcolors[$rnd]}
        convert -border 15x15 -bordercolor $bgcolor -resize x140 -background $bgcolor -extent 150x150 -gravity center  +append -frame 3x3 -mattecolor black $files word-$nmot-$i.png
done


