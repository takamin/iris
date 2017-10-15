Classify iris by linear regression with octave
==============================================

This is my personal repository to learn the machine-learning, linear regression and octave.
So, I do not guarantee that the program work correctly.


```console
$ sh get-iris-csv # download iris.data and convert it to csv
Downloading iris.data and iris.names.

Converting iris.data CSV.

The class values in column 5:
0: Iris-setosa
1: Iris-versicolor
2: Iris-virginica

$ octave -q
octave:1> cd <path-to-this-repo>
cd <path-to-this-repo>
octave:2> iris
iris
learning_rate =  0.0050000
iteration =  100000
cost =  0.023792
cost =  0.023476
cost =  0.023328
cost =  0.023257
cost =  0.023223
cost =  0.023207
cost =  0.023200
cost =  0.023196
cost =  0.023194
cost =  0.023193
error_index =  30
error_index =  101
error_index =  118
error_index =  120
theta =

   0.206248  -0.111832  -0.045483   0.227252   0.610735

validationErrorRate =  0.026667
validationTotalCost =  0.023193
octave:3>
```

