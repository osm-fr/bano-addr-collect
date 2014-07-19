# téléchargement des fichiers depuis le serveur FTP de la DILA
wget -nd -r ftp://echanges.dila.gouv.fr:6370/ASSOCIATIONS/

# décompression des .tar.gz initiaux
for f in *.tar.gz; do tar xzf $f; done

# extraction des .xml depuis les fichiers .taz (tar.gz) et suppression de ceux-ci après traitement
for f in *.taz; do tar xzf $f --exclude *.htm;  rm $f; done

# suppression des fichiers XML rédisuels
rm *.extr.xml
rm M*.xml

# extraction uniquement des adresses des sièges sociaux des associations
grep '<SIEGE_SOCIAL>.*</SIEGE_SOCIAL>' -oh *.xml | sed 's/<SIEGE_SOCIAL>//' | sed 's/&#32;/ /g' | sed 's/<\/SIEGE_SOCIAL>//' > addresses.txt

# conversion globale vers un unique fichier CSV
for a in {2004..2014}; do cp -f header.txt out/associations_$a.csv; for f in $a*.xml; do sed 's/\&infin\;/#infin#/' $f | sed 's/\&sk\=info//' > tmp; xsltproc xml2csv.xsl tmp >> out/associations_$a.csv; done; done
