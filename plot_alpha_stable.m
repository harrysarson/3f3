function plot_alpha_stable(alpha, beta, uniform, expo, range)
% plot_alpha_stable  Generate and plot alpha stable distibution
%   in the range specified by range.

    X = generate_alpha_stable(alpha, beta, uniform, expo);
    
    [f, xi] = ksdensity(X, linspace(-range, range, 1000));
    
    plot(xi, f,  ...
        'DisplayName', sprintf('α = %g, β = %g', alpha, beta), ...
        'LineWidth', 1);
    
    ylabel('p(x)');
    xlabel('x');
end
