function [] = sl06e01
    %SL06E01 Summary of this function goes here
    %   Detailed explanation goes here
    M = load_off('bun/bun000.off');
    M1 = load_off('bun/bun045.off');

    subplot(1,2,1);
    plot_mesh(M);
    shading interp;

    subplot(1,2,2);
    plot_mesh(M1);
    shading interp;
end

