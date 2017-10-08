FROM mongo:latest

ENV RESTORE=/home/restorefolder/
RUN mkdir $RESTORE
COPY dockerfiles/mongodb/analysedb/* $RESTORE

RUN pwd
RUN cd $RESTORE
RUN mkdir -p /data/db && mongod --fork --logpath=$RESTORE/mongodb.log && sleep 10 && mongoimport --host=127.0.0.1 --db analysedb --collection configdata --type json --file $RESTORE/init.json --jsonArray --verbose
RUN chmod +x $RESTORE/restorecheck.sh && $RESTORE/restorecheck.sh

#CMD ["mongod"]
