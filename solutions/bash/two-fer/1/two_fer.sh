#!/bin/bash

# Asigna el nombre de la persona aquí; deja vacío si no lo conoces
person_name="$1"

if [ -n "$person_name" ]; then
    echo "One for $person_name, one for me."
else
    echo "One for you, one for me."
fi