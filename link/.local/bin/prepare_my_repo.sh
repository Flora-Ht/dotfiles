blih repository create $1 && \
blih repository setacl $1 ramassage-tek r && \
cp -r ~/rendu/.default $1 && \
cd $1 && \
git init . && \
git remote add origin git@git.epitech.eu:/bazin_q/$1 && \
blih repository getacl $1
