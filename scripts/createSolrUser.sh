SOLR_USER=solr

solr_uid=`id -u $SOLR_USER`
if [ $? -ne 0 ]; then
  echo "Creating new user: $SOLR_USER"
  adduser --system $SOLR_USER
fi