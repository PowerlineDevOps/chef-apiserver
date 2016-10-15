#!/bin/bash
# simple script to package up berks dependencies and push
# to s3 bucket
if [ ! -z $1 ]; then
  PACKAGE="${1}.tar.gz"
else
  PACKAGE="api-server.tar.gz"
fi
echo "Packing ${PACKAGE} ... "
berks package $PACKAGE
aws s3 cp $PACKAGE s3://deployment-data/chef/
echo "Done"
