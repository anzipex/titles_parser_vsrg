#!/bin/bash

TITLES_FILE="$1"
ROMS_DIR="$2"

declare -a list_not_found

if [ "$#" -ne 2 ]; then
    echo "arguments: titles_file roms_dir"
    echo "   titles_file - path to text file titles-*.txt"
    echo "   roms_dir  - path to directory with ROMs (recommended by GoodTools)"
    exit 1
fi

IFS=$'\n' read -d '' -r -a LIST_GAMES < $TITLES_FILE

mkdir -p "$ROMS_DIR/!Selected"

find_roms() {
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(W).*" -exec cp {} "$ROMS_DIR/!Selected" \;
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(U).*" -exec cp {} "$ROMS_DIR/!Selected" \;
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(J).*" -exec cp {} "$ROMS_DIR/!Selected" \;
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(E).*" -exec cp {} "$ROMS_DIR/!Selected" \;
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(W) [*!*].*" -exec cp {} "$ROMS_DIR/!Selected" \;
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(U) [*!*].*" -exec cp {} "$ROMS_DIR/!Selected" \;
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(J) [*!*].*" -exec cp {} "$ROMS_DIR/!Selected" \;
    find $ROMS_DIR -maxdepth 1 -type f -name "*$@*(E) [*!*].*" -exec cp {} "$ROMS_DIR/!Selected" \;
    result=$(find $ROMS_DIR -maxdepth 1 -type f -name "$@*(*)*.*")
    
    for i in "${!result[@]}"
    do
        if [[ -z "${result[$i]}" ]];
        then
            list_not_found+=("$@")
            not_found=$((not_found+1))
        else
            found=$((found+1))
        fi
    done
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

echo "Not found: $not_found titles"
echo ""
echo "List not found:"
printf '%s\n' "${list_not_found[@]}"

exit 0
