#!/bin/sh
echo Downloading iris.data and iris.names.
curl --silent https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data > iris.data
curl --silent https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.names > iris.names
echo
echo Converting iris.data CSV.
echo
node conv-iris-csv.js

