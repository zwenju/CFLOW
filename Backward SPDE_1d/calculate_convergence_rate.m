function rates = calculate_convergence_rate ( errors, name )
%% the errors is column-oriented

disp(name)

N = max ( size (errors(1,:)) );

for i = 1 : N - 1
    
    rates (i) = log( errors(i) ./ errors(i+1) ) ./ log (2);
    
end

end