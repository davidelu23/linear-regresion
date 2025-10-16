function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation

  file = fopen(file_path, "r");
  if file == -1
    error("Failed to open file");
  endif
  line = fgetl(file);

  line = fgetl(file);
  i = 1;
  while ischar(line)
    Y(i) = cell2mat(textscan(line, "%d"));
    line = line(length(num2str(Y(i)))+2:end);
    row = textscan(line, "%s", "Delimiter", ",");
    InitialMatrix(i,:) = row{1};
    i++;
    line = fgetl(file);
  endwhile
end
