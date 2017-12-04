function plot_ksdensity (values, pdf)
% plot_ksdensity  Plots ksdensity approximation of pdf overlayed
%   with the pdf defined by pdf.
    
    global graph_max t;
    hold on;
    
    [f,xi] = ksdensity(values);
    
    plot(xi, f, 'LineWidth', 2);
    plot(t, pdf(t), 'LineWidth', 2);
    
    legend('ksdensity approximation.', ...
        'Actual pdf.');
    ylabel('p(x)');
    xlabel('x');
    
    ylim([0, graph_max]);
    xlim([t(1) t(end)]);
    
    hold off;
end