#!/bin/bash

TITLES_FILE="$1"
ROMS_DIR="$2"

declare -a list_not_found

if [ "$#" -ne 2 ]; then
    echo "arguments: titles_file roms_dir"
    echo "   titles_file - path to text file titles-*.txt"
    echo "   roms_dir  - path to directory with ROMs (only sorted by GoodTools)"
    exit 1
fi

IFS=$'\n' read -d '' -r -a LIST_GAMES < $TITLES_FILE

mkdir -p "$ROMS_DIR/!Selected"

find_roms() {
    if [[ -n $(find $ROMS_DIR -type f -name "$@*(*).*" -exec cp {} $ROMS_DIR/!Selected/ \; | sort -r | head -n 1) ]] &>/dev/null
    then
        echo "Found: $@"
    else
        list_not_found+=("$@")
    fi
}

for rom in "${!LIST_GAMES[@]}"
do    
    if [[ "${LIST_GAMES[$rom]}" == *"/"* ]]; then
        part_after=${LIST_GAMES[$rom]#* / }
        find_roms "$part_after"
    fi
    part_before="${LIST_GAMES[$rom]%%[/\([{|]*}"
    find_roms "$part_before"
done

echo "---"

for i in "${list_not_found[@]}"
do
    echo "NOT found: $i"
done

exit 0
