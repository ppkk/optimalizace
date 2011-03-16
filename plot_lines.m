function plot_lines(coords, inc)
  clf
  hold on
  ma = max(coords) + ones(1,2);
  mi = min(coords) - ones(1,2);
  axis([mi(1), ma(1), mi(2), ma(2)])
  for i = coords'
    plot(i(1), i(2), 'o')
  endfor
  for i = inc'
    plot([coords(i(1),1), coords(i(2),1)], [coords(i(1),2), coords(i(2),2)], 'linewidth', 2)
  endfor
  hold off
endfunction