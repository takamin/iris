#
# Classification of iris using liner regression
#

# Clear all mat
clear

D = csvread('iris.csv');        # Load iris.csv
D = D(randperm(size(D,1)),:);   # Sort random

#
# Select training dataset
#
Dt = D(1:150, :);
Xt = Dt(:, 1:4);    # Input
Xt = [ones(size(Xt,1),1) Xt];
Yt = Dt(:, 5);      # Result

#
# Select validation dataset
#
Dv = D(1:150, :);
Xv = Dv(:, 1:4);
Xv = [ones(size(Xv,1),1) Xv];
Yv = Dv(:, 5);

training_data_count = size(Xt,1);
learning_rate = 0.005     # learning rate
iteration = 100000

#
# Training
#
theta = [1,1,1,1,1]; # factor
numOfParam = size(theta, 2);
update = [1, numOfParam];
for n = 1:iteration
    diff = Xt * theta' - Yt;
    for j = 1:numOfParam
        update(1,j) = sum((diff .* Xt(:,j)));
    endfor
    theta = theta - learning_rate * update / training_data_count;
    if mod(n,10000) == 0
        cost = sum(diff .* diff) / ( 2 * size(Xt,1) )
    endif
endfor

#
# Validation
#
y = Xv * theta';
diff = y - Yv;
#validationResult = [Yv round(y)]

error_count = 0;
for i = 1:size(diff,1)
    diffI = diff(i,1);
    if(diffI * diffI >= 0.5 * 0.5)
        error_index = i
        error_count = error_count + 1;
    endif
endfor
theta
validationErrorRate = error_count / size(Xv, 1)
validationTotalCost = sum(diff .* diff) / ( 2 * size(Xv,1) )

