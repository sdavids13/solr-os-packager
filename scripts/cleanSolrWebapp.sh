SOLR_WEBAPP_DIR=/opt/solr/server/solr-webapp

if [ -d "$SOLR_WEBAPP_DIR" ]; then
  echo "Old solr-webapp already exploded at location $SOLR_WEBAPP_DIR - removing..."
  rm -rf "$SOLR_WEBAPP_DIR"
fi