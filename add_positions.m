function new_positions = add_positions(positions, vector)
  new_positions = zeros(rows(positions), 2);
  for i = 1 : rows(vector)/2
    new_positions(i, 1) = positions(i, 1) + vector(2*i - 1);
    new_positions(i, 2) = positions(i, 2) + vector(2*i);
  endfor
endfunction    