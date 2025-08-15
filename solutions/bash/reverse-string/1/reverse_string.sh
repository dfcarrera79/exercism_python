#!/bin/bash

reverse_string() {
    local input="$1"
    local reversed=""
    local len=${#input}

    
    for (( i=len-1; i>=0; i-- )); do
        reversed="${reversed}${input:$i:1}"
    done

    echo "$reversed"
}

reverse_string "$1"
