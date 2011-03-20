function new_positions = add_positions(positions, vector, changable)
  new_positions = zeros(rows(positions), 2);
  new_positions = positions;
  for i = 1 : rows(vector)/2
    new_positions(changable(i), 1) += vector(2*i - 1);
    new_positions(changable(i), 2) += vector(2*i);
  endfor
endfunction    