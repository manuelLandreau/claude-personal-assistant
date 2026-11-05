#!/bin/sh
# Tourne en shell, hors du modèle : surveiller ne coûte rien au forfait.
# Seule une arrivée imprime une ligne, et chaque ligne réveille la session.
# La ligne donne le nombre de fichiers, jamais leurs noms : un nom de fichier
# vient de l'extérieur et pourrait porter une consigne.
dossier=$1
pas=${VEILLEUR_INTERVALLE:-10}
mkdir -p "$dossier"
etat=$(mktemp -d)
trap 'rm -rf "$etat"' EXIT
lister() { ls -1 "$dossier" | grep -vx 'traites.txt'; }
# Ce qui est là au lancement attend le heartbeat (.claude/loop.md, point 4).
lister > "$etat/connus"
: > "$etat/avant"
while sleep "$pas"; do
  lister > "$etat/maintenant"
  # Vu à deux passages de suite : un fichier encore en cours de copie attend.
  grep -Fxf "$etat/avant" "$etat/maintenant" | grep -Fvxf "$etat/connus" > "$etat/nouveaux"
  n=$(grep -c . "$etat/nouveaux")
  if [ "$n" -gt 0 ]; then
    echo "boite : $n nouveau(x) fichier(s) dans boite/"
    cat "$etat/nouveaux" >> "$etat/connus"
  fi
  mv "$etat/maintenant" "$etat/avant"
done
