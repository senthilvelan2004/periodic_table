camper: /project$ mkdir periodic_table
camper: /project$ cd periodic_table/
camper: /periodic_table$ git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint: 
hint:   git config --global init.defaultBranch <name>
hint: 
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint: 
hint:   git branch -m <name>
Initialized empty Git repository in /workspace/project/periodic_table/.git/
camper: /periodic_table$ git branch
camper: /periodic_table$ touch element.sh
camper: /periodic_table$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        element.sh

nothing added to commit but untracked files present (use "git add" to track)
camper: /periodic_table$ git branch
camper: /periodic_table$ git add .
camper: /periodic_table$ git commit -m "Initial commit"
[master (root-commit) 4305a0e] Initial commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 element.sh
camper: /periodic_table$ git branch
* master
camper: /periodic_table$ git branch main
camper: /periodic_table$ chmod +x element.sh
camper: /periodic_table$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   element.sh

no changes added to commit (use "git add" and/or "git commit -a")
camper: /periodic_table$ git add .
camper: /periodic_table$ git commit -m "feat: add database connection"
[master 53a7126] feat: add database connection
 1 file changed, 5 insertions(+)
 mode change 100644 => 100755 element.sh
camper: /periodic_table$ ./element.sh 5
5
camper: /periodic_table$ ./element.sh 5
5 hello
camper: /periodic_table$ ./element.sh 
./element.sh: line 13: syntax error: unexpected end of file
camper: /periodic_table$ ./element.sh 
camper: /periodic_table$ ./element.sh 
camper: /periodic_table$ ./element.sh 
./element.sh: line 11: syntax error near unexpected token `fi'
./element.sh: line 11: `  fi'
camper: /periodic_table$ ./element.sh 
Please provide an element as an argument.
camper: /periodic_table$ ./element.sh 5
5
camper: /periodic_table$ man test
camper: /periodic_table$ ./element.sh 
./element.sh: line 15: syntax error near unexpected token `then'
./element.sh: line 15: `    then'
camper: /periodic_table$ ./element.sh 
./element.sh: line 15: syntax error near unexpected token `then'
./element.sh: line 15: `    then'
camper: /periodic_table$ ./element.sh 
Please provide an element as an argument.
camper: /periodic_table$ ./element.sh 1
I could not find that element in the database.
camper: /periodic_table$ ./element.sh H
ERROR:  column "h" does not exist
LINE 1: ...omic_number) JOIN types USING(type_id) WHERE atomic_number=H
                                                                      ^
I could not find that element in the database.
camper: /periodic_table$ ./element.sh 1
I could not find that element in the database.
camper: /periodic_table$ ./element.sh 1
I could not find that element in the database.
camper: /periodic_table$ ./element.sh 1
I could not find that element in the database.
camper: /periodic_table$ ./element.sh 1
I could not find that element in the database.
camper: /periodic_table$ ./element.sh H
ERROR:  column "h" does not exist
LINE 1: ...omic_number) JOIN types USING(type_id) WHERE atomic_number=H
                                                                      ^
I could not find that element in the database.
camper: /periodic_table$ ./element.sh Hydrogen
ERROR:  column "hydrogen" does not exist
LINE 1: ...mber) JOIN types USING(type_id) WHERE atomic_number=Hydrogen
                                                               ^
I could not find that element in the database.
camper: /periodic_table$ ./element.sh 1
I could not find that element in the database.
camper: /periodic_table$ git add .
camper: /periodic_table$ git commit -m "feat: bring element"
[master 7dd7b9b] feat: bring element
 1 file changed, 24 insertions(+)
camper: /periodic_table$ git add .
camper: /periodic_table$ git commit -m "fix: bring separated data"
[master a20c968] fix: bring separated data
 1 file changed, 2 insertions(+), 2 deletions(-)
camper: /periodic_table$ git checkout main
Switched to branch 'main'
camper: /periodic_table$ git merge master
Updating 4305a0e..a20c968
Fast-forward
 element.sh | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 mode change 100644 => 100755 element.sh
camper: /periodic_table$ git status
On branch main
nothing to commit, working tree clean
camper: /periodic_table$ git add .
camper: /periodic_table$  git commit -m "feat: bring data"
[main 12c8962] feat: bring data
 1 file changed, 3 insertions(+), 2 deletions(-)
camper: /periodic_table$ ./element.sh 1
I could not find that element in the database.
camper: /periodic_table$ ./element.sh 2
The element with atomic number 2 is Helium (He). It's a nonmetal, with a mass of 4 amu. Helium has a melting point of -272.2 celsius and a boiling point of -269 celsius.
camper: /periodic_table$ ./element.sh 1
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
camper: /periodic_table$ git checkout mainel
error: pathspec 'mainel' did not match any file(s) known to git
camper: /periodic_table$ ./element.sh H
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
camper: /periodic_table$ git checkout main
M       element.sh
Already on 'main'
camper: /periodic_table$ git merge master
Already up to date.
camper: /periodic_table$ git branch
* main
  master
camper: /periodic_table$ git add .
camper: /periodic_table$  git commit -m "feat: bring data"
[main ba905c3] feat: bring data
 1 file changed, 15 insertions(+), 17 deletions(-)
camper: /periodic_table$ git status
On branch main
nothing to commit, working tree clean
camper: /periodic_table$ pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql
camper: /periodic_table$ 
