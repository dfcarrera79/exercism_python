#!/usr/bin/env bash

# Array of allergens ordered by their bit value
ALLERGENS=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")

# 1. Capture the input score (first argument)
SCORE=$1
ACTION=$2
TARGET_ITEM=$3

# Function to list all allergies for a given score
get_all_allergies() {
    local score=$1
    local list=()

    for i in "${!ALLERGENS[@]}"; do
        local bit_value=$((1 << i))
        if (( (score & bit_value) != 0 )); then
            list+=("${ALLERGENS[$i]}")
        fi
    done

    echo "${list[@]}"
}

# Function to check if a person is allergic to a specific item
is_allergic_to() {
    local score=$1
    local target=$2
    
    for i in "${!ALLERGENS[@]}"; do
        if [[ "${ALLERGENS[$i]}" == "$target" ]]; then
            local bit_value=$((1 << i))
            if (( (score & bit_value) != 0 )); then
                echo "true"
                return 0
            fi
        fi
    done
    echo "false"
    return 0 # Return 0 so the script itself reports success to Bats
}

# --- Command Line Argument Routing ---

if [[ "$ACTION" == "allergic_to" ]]; then
    is_allergic_to "$SCORE" "$TARGET_ITEM"
elif [[ "$ACTION" == "list" ]]; then
    get_all_allergies "$SCORE"
fi