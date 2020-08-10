#!/bin/bash

ass_file=$1

printf "Assemble file size: $(du -h $ass_file |cut -f 1)\n\n"

printf "Total contigs: $(grep -c '>' $ass_file)\n\n"

printf "Total bps: $(grep '>' $ass_file | sed -E 's/.+len=([0-9]*).+/\1/' | paste -s -d+ - | bc )\n\n"

printf "Total assembled reads: $(grep '>' $ass_file | sed -E 's/.+reads=([0-9]*).+/\1/' | paste -s -d+ - | bc )\n\n"

printf "Circular contigs: $(grep 'suggestCircular=yes' $ass_file | wc -l)\n\n"

printf "Repeat contigs: $(grep 'suggestRepeat=yes' $ass_file | wc -l)\n\n"

printf "Bubble contigs: $(grep 'suggestBubble=yes' $ass_file | wc -l)\n\n"

printf "Lengths of top 10 longest contig:\n"
printf "$(grep '>' $ass_file | sed -E 's/.+len=([0-9]*).+/\1/' | sort -g | tail -n 10)"
printf "\n\n"

printf "Reads of top 10 most covered contigs:\n"
printf "$(grep '>' $ass_file | sed -E 's/.+reads=([0-9]*).+/\1/' | sort -g | tail -n 10)"
printf "\n\n"


printf "Lengths of top 10 circular longest contig:\n"
printf "$(grep '>' $ass_file | grep 'suggestCircular=yes' | sed -E 's/.+len=([0-9]*).+/\1/' | sort -g | tail -n 10)"
printf "\n\n"