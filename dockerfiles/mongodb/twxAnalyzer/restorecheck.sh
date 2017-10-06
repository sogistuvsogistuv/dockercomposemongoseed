#/bin/bash

if (mongo twxAnalyzer --eval "db.adminCommand('listDatabases')" | grep '\"name\"\s\:\s\"twxAnalyzer\"')
then
 echo "Database is existing"
 if (mongo twxAnalyzer --eval "db.getCollectionNames()" | grep 'config')
 then
   echo "collection there"
 else
   echo "no collection"
   mongorestore --db=twxAnalyzer --collection=config ./config.bson
 fi
else
 echo "Nope"
 #mongorestore -d twxAnalyzer ./
fi
