% Create arrays to store results
pth_values = 0:500:15000;
num_pth = length(pth_values);
costs = zeros(1, num_pth);
fprintf('Total %f steps\n ', num_pth);
% Loop over all Pth values
for i = 1:num_pth
    pth = pth_values(i);
    
    fprintf('Step %f in progress\n ', i);
    % Set the value of 'pth' into Simulink workspace
    assignin('base', 'pth', pth);
    
    % Run simulation
    simOut = sim('BD_HESS_K.slx', 'ReturnWorkspaceOutputs', 'on');
    
    % Calculate financial cost from output
    % You must define how to calculate cost here using outputs
    % Example: sum of P_bat or some financial cost output from model
    cost = max(simOut.HESS_total_cost); 
    
    % Store the cost
    costs(i) = cost;
end

% Find the best threshold
[min_cost, idx] = min(costs);
optimal_pth = pth_values(idx);

fprintf('Optimal Threshold: %.2f W\n', optimal_pth);
fprintf('Minimum Cost: %.2f\n', min_cost);