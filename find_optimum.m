function find_optimum(positions, incidence, supports, F, changable, mag)
  P_NORM = 3;
  [u, stress] = calc_u_w(positions, incidence, supports, F);
  func = norm(stress, P_NORM);
  max_stress = 0.8*max(abs(stress));
  
  eps1 = 0.25; eps2 = 0.75;
  
  for i=1:30
    func
    func_old = func;
    plot_changed(positions, incidence, supports, u, stress, mag, max_stress)
     sleep(0.01)
    
    if(i != 1)
      grad_old = grad;
    endif
    grad = calc_grad(positions, incidence, supports, F, changable);

    if(i == 1)          
      s = -grad;
    else
      beta_ = (grad'*grad) / (grad_old'*grad_old);
      s = -grad + beta_ * s;
    endif
    sTg = s'*grad;
    
    alpha_low = 0;
    alpha_high = 0.5;
    do
      alpha_high *= 2;
      positions_ch = add_positions(positions, alpha_high * s, changable);
      [u, stress] = calc_u_w(positions_ch, incidence, supports, F);
      func = norm(stress, P_NORM);  
    until func - func_old >= eps2 * alpha_high * sTg
    
    while true
      alpha = (alpha_low + alpha_high)/2;
      positions_ch = add_positions(positions, alpha * s, changable); 
      [u, stress] = calc_u_w(positions_ch, incidence, supports, F);
      func = norm(stress, P_NORM);  
      
      S2 = ( func - func_old <= eps1 * alpha * sTg);
      S3 = ( func - func_old >= eps2 * alpha * sTg);
      if S2
        if S3
          break;
        else
          alpha_low = alpha;
        endif
      else
        if S3
          alpha_high = alpha;
        else
          printf("neplati ani S2 ani S3\n");
        endif
      endif
    endwhile
    
    positions = positions_ch;
  endfor
endfunction