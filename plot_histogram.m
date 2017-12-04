function plot_histogram (values, pdf)
% plot_histogram  Plots histogram of values overlayed
%   with the pdf defined by pdf.
    global graph_max t;
    hold on;
    
    histogram(values, 'Normalization', 'pdf', 'FaceAlpha', 0.3);
    
    plot(t, pdf(t), 'LineWidth', 2);
    
    legend('Normalised histogram.', ...
        'Actual pdf.');
    
    ylabel('Normalized Frequency Density');
    xlabel('x');
    ylim([0, graph_max]);
    xlim([t(1) t(end)]);
    
    hold off;
end