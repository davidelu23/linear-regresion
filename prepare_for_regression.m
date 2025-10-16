function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation

  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);
  for i = 1 : m
    for j = 1 : n
      if sum(isalpha(InitialMatrix(i,j){1})) > 1
        if strcmp(InitialMatrix(i,j), "yes")
          FeatureMatrix(i,j) = 1;
        elseif strcmp(InitialMatrix(i,j), "furnished")
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,n + 1) = 0;
        elseif strcmp(InitialMatrix(i,j), "unfurnished")
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,n + 1) = 1;
        elseif strcmp(InitialMatrix(i,j), "semi-furnished")
          FeatureMatrix(i,j) = 1;
          FeatureMatrix(i,n + 1) = 0;
        endif
      else
        FeatureMatrix(i,j) = str2double(InitialMatrix(i,j){1});
      endif
    endfor
  endfor
  % case for irregular datasets, such as the ones where the furnished state is not the last column
  if !sum(isalpha(InitialMatrix(1,n){1}))
    FeatureMatrix(:,[n,n+1]) = FeatureMatrix(:,[n+1,n]);
  endif
end
