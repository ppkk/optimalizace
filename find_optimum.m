function find_optimum(positions, incidence, supports, F, mag)
  alpha_low = 0;
  alpha_high = 1;
  for i=1:10
    
    A = create_a(positions, incidence, supports);
    C = create_c(positions, incidence);
    S = A'*C*A;
    u = S\F;
    stress = A*u;
    plot_changed(positions, incidence, supports, u, stress, mag)
    
    