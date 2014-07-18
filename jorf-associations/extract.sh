# téléchargement des fichiers depuis le serveur FTP de la DILA
wget -nd -r ftp://echanges.dila.gouv.fr:6370/ASSOCIATIONS/

# décompression des .tar.gz initiaux
for f in *.tar.gz; do tar xzf $f; done

# extraction des .xml depuis les fichiers .taz (tar.gz) et suppression de ceux-ci après traitement
for f in *.taz; do tar xzf $f --exclude *.htm;  rm $f; done

# extraction des adresses des sièges sociaux des associations
grep '<SIEGE_SOCIAL>.*</SIEGE_SOCIAL>' -oh *.xml | sed 's/<SIEGE_SOCIAL>//' | sed 's/<\/SIEGE_SOCIAL>//' > addresses.txt
