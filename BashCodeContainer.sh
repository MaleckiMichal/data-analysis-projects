# Initialization of git repository in main folder
git init

# Checking git status
git status

# Creating a folder with standart structure of projects files
mkdir _StandardProjectStructure

# Change folder name
mv _StandardProjectStructure 000_Standard_Project_Structure

# Creating multiple folders inside previously created one:
cd 000_Standard_Project_Structure       # Go to indicated folder
mkdir SQL-queries Python-scripts Data-files Reports

# Changing character "-" for "_" in folder names:
for file in *; do mv "$file" "${file//-/_}"; done

# Creating a .txt file for some instructions
touch READ_ME_FIRST.txt

# Next folders inside another
cd Data_files
mkdir Input_data Output_data

# Go back to parent folder
cd ..
cd ..       # used twice to go to main folder 

# Creating .gitignore file and adding contains in txt editor
touch .gitignore

**/Data_files/   # ignore all files with name Data_files
**/Reports/
**/READ_ME_FIRST.txt    # ignore all .txt files with name READ_ME_FIRST

# Adding all untracked files to be tracked
git add .

# Commiting changes
git commit -m"Creatin repository and adding gitignore file"

# Checking commits
git log



# Remote repository
git remote add origin https://github.com/....
git branch -M main
git push -u origin main    # if newly created Github repo is empty

# If previously created files are in Github repo - merge needed
git pull origin main --allow-unrelated-histories
# vim editor should open. Do:
#   Press 'i' to insert text
#   Write a commit name
#   Press 'Esc'
#   Write ':wq' ("write" i "quit")
# Push command is now possible
git push -u origin main