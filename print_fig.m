function print_fig(file_name)
    % print_fig print current figure to file
    % called file_name.
    
    axes = findall(gcf, 'type', 'axes');
    
    for i = 1:length(axes)
        outerpos = axes(i).OuterPosition;
        ti = axes(i).TightInset; 
        left = outerpos(1) + ti(1);
        bottom = outerpos(2) + ti(2);
        ax_width = outerpos(3) - ti(1) - ti(3);
        ax_height = outerpos(4) - ti(2) - ti(4);
        axes(i).Position = [left bottom ax_width ax_height];
    end
        
    print(gcf, '-dpdf', strrep(file_name, '.', '_'));
end