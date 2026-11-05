#!/bin/sh
# sh veilleur/test.sh : vérifie le veilleur en une dizaine de secondes.
ici=$(cd "$(dirname "$0")" && pwd)
t=$(mktemp -d)
mkdir "$t/boite" && touch "$t/boite/deja-la.pdf"
VEILLEUR_INTERVALLE=1 sh "$ici/boite.sh" "$t/boite" > "$t/sortie" &
pid=$!
sleep 2
touch "$t/boite/ticket.jpg" "$t/boite/facture.pdf"
sleep 3
touch "$t/boite/traites.txt"
sleep 3
kill "$pid"
attendu="boite : 2 nouveau(x) fichier(s) dans boite/"
if [ "$(cat "$t/sortie")" = "$attendu" ]; then echo "ok"; else echo "ÉCHEC, sortie :"; cat "$t/sortie"; fi
rm -rf "$t"
