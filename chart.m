# Draw iris charts
[];

function show_chart(D, error_data, featureX, featureY, chartTitle)

    hold all

    Dy0 = D( D( :, 5 ) == 0, : );
    scatter(Dy0(:,featureX), Dy0(:,featureY), 'r')

    Dy1 = D( D( :, 5 ) == 1, : );
    scatter(Dy1(:,featureX), Dy1(:,featureY), 'g')

    Dy2 = D( D( :, 5 ) == 2, : );
    scatter(Dy2(:,featureX), Dy2(:,featureY), 'b')

    error_data_r = error_data(error_data(:,5)==0, :);
    scatter(error_data_r(:, featureX), error_data_r(:, featureY), [], 'r', 'filled')

    error_data_g = error_data(error_data(:,5)==1, :);
    scatter(error_data_g(:, featureX), error_data_g(:, featureY), [], 'g', 'filled')

    error_data_b = error_data(error_data(:,5)==2, :);
    scatter(error_data_b(:, featureX), error_data_b(:, featureY), [], 'b', 'filled')

    title(chartTitle)

endfunction

subplot(1,2,1)
show_chart(D, error_data, 1, 2, 'X:Sepal length, Y:Sepal width')

subplot(1,2,2)
show_chart(D, error_data, 3, 4, 'X:Petal length, Y:Petal width')

