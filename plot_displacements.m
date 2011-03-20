function plot_displacements(coords, inc, supports, u, mag)
  clf
  hold on;
  ma = max(coords) + ones(1,2);
  mi = min(coords) - ones(1,2);
  axis([mi(1), ma(1), mi(2), ma(2)])
  
  for edg = inc'
    plot([coords(edg(1),1), coords(edg(2),1)], [coords(edg(1),2), coords(edg(2),2)], 'linewidth', 2)
  endfor

  p = 1;
  for point = coords'
    plot(point(1), point(2), 'o')
    if p <= rows(coords) - supports
       plot([point(1), point(1) + mag * u(2*p - 1)], [point(2), point(2) + mag * u(2*p)], 'r', 'linewidth', 2)
    endif
    p++;
  endfor
  hold off
endfunction
