#/bin/bash

if (mongo analysedb --eval "db.adminCommand('listDatabases')" | grep '\"name\"\s\:\s\"analysedb\"')
then
 echo "Database is existing"
 if (mongo analysedb --eval "db.getCollectionNames()" | grep 'config')
 then
   echo "collection there"
 else
   echo "no collection"
   mongorestore --db=analysedb --collection=config ./config.bson
 fi
else
 echo "Nope"
 #mongorestore -d analysedb ./
fi
