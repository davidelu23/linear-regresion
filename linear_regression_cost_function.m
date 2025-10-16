function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  Theta = Theta(2:end);
  [m,n] = size(FeatureMatrix);
  Error = norm(Y - FeatureMatrix * Theta) ^ 2 / (2 * m);
end
