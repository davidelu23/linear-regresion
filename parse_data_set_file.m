function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_data_set_file implementation

  file = fopen(file_path, "r");
  if file == -1
    error("Failed to open file");
  endif

  line = fgetl(file);
  dim = sscanf(line, '%d %d');
  m = dim(1);
  n = dim(2);

  InitialMatrix = {};
  Y = zeros(1, m);
  for i = 1 : m
    line = fgetl(file);
    row = strsplit(line);
    Y(i) = str2num(row{1});
    row(1) = [];
    InitialMatrix(i,:) = row;
  endfor
end
