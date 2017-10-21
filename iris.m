#
# Classification of iris using linear regression
#

# Clear all mat
clear

D = csvread('iris.csv');        # Load iris.csv
# D = D(randperm(size(D,1)),:); # Sort random

#
# Select training dataset
#
Dt = D(1:size(D, 1), :);    # Dt = D(1:2*size(D, 1)/3, :);
Xt = Dt(:, 1:(size(Dt,2)-1));    # Input
Xt = [ones(size(Xt,1),1) Xt];
Yt = Dt(:, size(Dt,2));      # Result

#
# Select validation dataset
#
Dv = D(1:size(D, 1), :);    # Dv = D(2*size(D, 1)/3+1:size(D,1), :);
Xv = Dv(:, 1:(size(Dv,2)-1));
Xv = [ones(size(Xv,1),1) Xv];
Yv = Dv(:, size(Dv,2));

training_data_count = size(Xt,1);
learning_rate = 0.01     # learning rate
iteration = 10000
report_interval = round(iteration / 10);

#
# Training
#
theta = ones(1, size(Xt,2)); # factor
numOfParam = size(theta, 2);
update = [1, numOfParam];
for n = 1:iteration
    diff = Xt * theta' - Yt;
    for j = 1:numOfParam
        update(1,j) = diff' * Xt(:,j);
    endfor
    theta = theta - learning_rate * update / training_data_count;
    if mod(n,report_interval) == 0
        cost = (diff' * diff) / ( 2 * size(Xt,1) )
    endif
endfor

#
# Validation
#
y = Xv * theta';
diff = y - Yv;
#validationResult = [Yv round(y)]

error_data = [];

for i = 1:size(diff,1)
    diffI = diff(i,1);
    if(diffI * diffI >= 0.5 * 0.5)
        error_index = i
        if(size(error_data, 1) == 0)
            error_data = D(i,:);
        else
            error_data = [ error_data; D(i,:) ];
        endif
    endif
endfor
theta
validationErrorRate = size(error_data,1) / size(Xv, 1)
validationTotalCost = diff' * diff / ( 2 * size(Xv,1) )
