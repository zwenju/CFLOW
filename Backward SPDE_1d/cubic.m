function yy = cubic(x0,y0,x)
yy = l_1(x0,x) .* y0(1) + l_2(x0,x) .* y0(2) +l_3(x0,x) .* y0(3) +l_4(x0,x) .* y0(4);
end



function yy = l_1(x0,x)
yy = (x-x0(2)) .* (x-x0(3)) .* (x-x0(4))./((x0(1)-x0(2)) .* (x0(1)-x0(3)) .* (x0(1)-x0(4)));
end

function yy = l_2(x0,x)
yy = (x-x0(1)) .* (x-x0(3)) .* (x-x0(4))./((x0(2)-x0(1)) .* (x0(2)-x0(3)) .* (x0(2)-x0(4)));
end

function yy = l_3(x0,x)
yy = (x-x0(1)) .* (x-x0(2)) .* (x-x0(4))./((x0(3)-x0(1)) .* (x0(3)-x0(2)) .* (x0(3)-x0(4)));
end

function yy = l_4(x0,x)
yy = (x-x0(1)) .* (x-x0(2)) .* (x-x0(3))./((x0(4)-x0(1)) .* (x0(4)-x0(2)) .* (x0(4)-x0(3)));
end