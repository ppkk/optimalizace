function plot_changed(coords, inc, supports, u, stress, mag, max_stress)
  clf
  hold on;
  
  palete = "cgrmm";
  len = max(coords)(1)/4;
  for i=1:4
    plot([len*(i-1), len*i],[-0.5,-0.5], palete(i), 'linewidth', 5)
  endfor
  
  stress = abs(stress);
#   max_stress = max(stress);
  
  ma = max(coords) + ones(1,2);
  mi = min(coords) - ones(1,2);
  axis([mi(1), ma(1), mi(2), ma(2)])
  
  edgind = 1;
  for edg = inc'
    if edg(1) <= rows(coords) - supports
      x1 = coords(edg(1),1) + mag * u(2*edg(1) - 1);
      y1 = coords(edg(1),2) + mag * u(2*edg(1)    );
    else
      x1 = coords(edg(1),1);
      y1 = coords(edg(1),2);
    endif

    if edg(2) <= rows(coords) - supports
      x2 = coords(edg(2),1) + mag * u(2*edg(2) - 1);
      y2 = coords(edg(2),2) + mag * u(2*edg(2)    );
    else
      x2 = coords(edg(2),1);
      y2 = coords(edg(2),2);
    endif
    
    color = palete(round(3*stress(edgind)/max_stress)+1);
    
    plot([x1, x2], [y1, y2], color, 'linewidth', 2)
    edgind++;
  endfor
  hold off
endfunction
