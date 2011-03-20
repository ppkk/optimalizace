function A = create_a(coords, inc, supports)
  A = zeros(rows(inc),2*(rows(coords) - supports));
  r = 1;
  for edg = inc'
    lenx = coords(edg(2),1)-coords(edg(1),1);
    leny = coords(edg(2),2)-coords(edg(1),2);
    len = sqrt(lenx**2 + leny**2);
    cosfi = lenx/len; 
    sinfi = leny/len;
    if edg(1) <= rows(coords) - supports
      A(r, 2*edg(1) - 1) = -cosfi;
      A(r, 2*edg(1)    ) = -sinfi;
    endif
    if edg(2) <= rows(coords) - supports
      A(r, 2*edg(2) - 1) =  cosfi;
      A(r, 2*edg(2)    ) =  sinfi;
    endif    
    r++;
  endfor
    
    