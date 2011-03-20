function C = create_c(coords, inc)
  C = zeros(rows(inc));
  r = 1;
  for edg = inc'
    lenx = coords(edg(2),1)-coords(edg(1),1);
    leny = coords(edg(2),2)-coords(edg(1),2);
    len = sqrt(lenx**2 + leny**2);
    C(r,r) = 1/len**2.5;
#     C(r,r) = 1.;
    r++;
  endfor
endfunction