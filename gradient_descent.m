function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation

  Y = Y';
  Theta = zeros(n,1);
  for k = 1 : iter
    grad =(1/m) * FeatureMatrix' * double(Y - FeatureMatrix * Theta);
    Theta = Theta + alpha * grad;
  endfor
  Theta = [double(0); Theta];
end
