#/bin/bash

if (mongo analysedb --eval "db.adminCommand('listDatabases')" | grep '\"name\"\s\:\s\"analysedb\"')
then
 echo "Database is existing"
 if (mongo analysedb --eval "db.getCollectionNames()" | grep 'config')
 then
   echo "collection found"
   mongo analysedb --eval 'db.configdata.find()'
 else
   echo "collection not found"
 fi
else
 echo "Nope, database not found"
fi
