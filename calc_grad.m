function grad = calc_grad(positions, incidence, supports, F, changable)
  EPS = 0.000001;
  num_vars = 2*(columns(changable));
  grad = zeros(num_vars, 1);
  A = create_a(positions, incidence, supports);
  C = create_c(positions, incidence, supports);
  w = A*(A'*C*A\F);
  central_value = norm(w);

  for i = 1 : num_vars
    new_positions = positions;
    point = changable(round(i/2));
    whichx = round((i+1)/2) - round(i/2) + 1; #jestli je to x nebo y
    
    new_positions(point, whichx) += EPS;
    A = create_a(new_positions, incidence, supports);
    C = create_c(new_positions, incidence, supports);
    w = A*(A'*C*A\F);
    value = norm(w);
    grad(i) = (value - central_value) / EPS;
  endfor
endfunction