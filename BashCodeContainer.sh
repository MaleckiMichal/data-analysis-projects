# Tworzenie pliku tekstowego do zapisu kodu Bash:
touch BashCodeContainer.md

# Tworzenie kilku folderów jednocześnie:
mkdir SQL-queries Python-scripts Data-files Reports

# Zamiana znaku "-" na "_" w nazwach folderów:
for file in *; do mv "$file" "${file//-/_}"; done
