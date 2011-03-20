function plot_lines(coords, inc)
  clf
  hold on;
  ma = max(coords) + ones(1,2);
  mi = min(coords) - ones(1,2);
  axis([mi(1), ma(1), mi(2), ma(2)])
  for point = coords'
    plot(point(1), point(2), 'o')
  endfor
  for edg = inc'
    plot([coords(edg(1),1), coords(edg(2),1)], [coords(edg(1),2), coords(edg(2),2)], 'linewidth', 2)
  endfor
  hold off
endfunction
