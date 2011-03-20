function [u, w] = calc_u_w(positions, incidence, supports, F)
  A = create_a(positions, incidence, supports);
  C = create_c(positions, incidence);
  S = A'*C*A;
  u = S\F;
  w = A*u;
endfunction
