function [positions, incidence, supports, F, changable] = construct_derrick(matrix)
  points = 0;
  changables = 0;
  supports = 0;
  for row = 1 : rows(matrix)
    for column = 1 : columns(matrix)
      if matrix(row, column) > 0
        points++;
        positions(points, 1) = column - 1;
        positions(points, 2) = rows(matrix) - row;
        numbers(row, column) = points;
        if matrix(row, column) == 1 || matrix(row, column) == 3
          changable(++changables) = points;
        endif
        if matrix(row, column) == 2
          supports++;
        endif
      endif
    endfor
  endfor
  
  F = zeros(2 * (rows(positions) - supports), 1);
  for row = 1 : rows(matrix)
    for column = 1 : columns(matrix)
      if matrix(row, column) == 3 || matrix(row, column) == 5
        F(2 * numbers(row, column)) = -1;
      endif
    endfor
  endfor
  
  edges = 0;
  
  for row = 1 : rows(matrix)
    for column = 1 : columns(matrix) - 1
      if matrix(row, column) && matrix(row, column + 1)
        edges++;
        incidence(edges, 1) = numbers(row, column);
        incidence(edges, 2) = numbers(row, column + 1);
      endif
    endfor
  endfor
  
  for row = 1 : rows(matrix) - 1
    for column = 1 : columns(matrix)
      if matrix(row, column) && matrix(row + 1, column)
        edges++;
        incidence(edges, 1) = numbers(row, column);
        incidence(edges, 2) = numbers(row + 1, column);
      endif
    endfor
  endfor
  
  for row = 1 : rows(matrix) - 1
    for column = 1 : columns(matrix) - 1
      if matrix(row, column) && matrix(row + 1, column + 1)
        edges++;
        incidence(edges, 1) = numbers(row, column);
        incidence(edges, 2) = numbers(row + 1, column + 1);
      endif
    endfor
  endfor
  
  for row = 1 : rows(matrix) - 1
    for column = 2 : columns(matrix)
      if matrix(row, column) && matrix(row + 1, column - 1)
        edges++;
        incidence(edges, 1) = numbers(row, column);
        incidence(edges, 2) = numbers(row + 1, column - 1);
      endif
    endfor
  endfor
endfunction