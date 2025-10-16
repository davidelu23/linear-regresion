function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % TODO: normal_equation implementation
  [m, n] = size(FeatureMatrix);
  Theta = zeros(n,1);
  Y = FeatureMatrix' * Y;
  FeatureMatrix = FeatureMatrix' * FeatureMatrix;

  % check if matrix is symmetric and positively defined
  if !issymmetric(FeatureMatrix)
    return;
  endif
  try
    chol(FeatureMatrix);
  catch
    return;
  end_try_catch

  % clasical conjugate gradient method
  r = Y;
  p = r;
  for k = 1 : iter
    if (r' * r) < tol ^ 2
      break
    endif
    a = r' * r / (p' * FeatureMatrix * p);
    Theta = Theta + a * p;
    rp = r;
    r = r - a * FeatureMatrix * p;
    b = r' * r / (rp' * rp);
    p = r + b * p;
  endfor
  Theta = [double(0); Theta];
end
