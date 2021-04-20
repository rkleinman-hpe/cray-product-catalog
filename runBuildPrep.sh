# Copyright 2021 Hewlett Packard Enterprise LP
VERSION=`cat .version`
sed -i s/@VERSION@/${VERSION}/g kubernetes/cray-product-catalog/Chart.yaml

