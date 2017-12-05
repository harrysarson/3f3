function plot_histogram_mean( pdf, cdf, generateRand )

bin_position = 0;
bin_widths = linspace(0, 2.5 * (2 + bin_position), 100);
N = 1000;
repeats = 20;

means = zeros(size(bin_widths));
var = zeros(size(bin_widths));
counts = zeros(repeats, length(bin_widths));

for i = 1:length(bin_widths)
    
    edges = bin_position + bin_widths(i) * 0.5 * [-1 1];
    
    bin_probability = cdf(edges(2)) - cdf(edges(1));
    means(i) = bin_probability;
    var(i) = means(i) * (1 - bin_probability);
    
    for j = 1:repeats
        [count] = histcounts(generateRand(N), edges);
        counts(j, i) = count / N;
    end
end

figure;
hold on;

a = max(0.5, bin_widths(end) / 3);

plot(bin_widths, means);
plot(bin_widths, mean(counts, 1));
plot([0 a], [0 pdf(bin_position) * a], '--k');

legend(["?"; "?"; "?p(x)"]);
title(sprintf('Histogram bar at x = %g in Gaussian distrubution', bin_position));

end

