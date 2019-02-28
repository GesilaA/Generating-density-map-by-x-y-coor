function [img] = showDensityImg(x, y)
    xmin = min(x);
    xmax = max(x);
    xr = xmax-xmin;
    ymin = min(y);
    ymax = max(y);
    yr = ymax - ymin;
    % scale越大，密度图分辨率越大，耗时越长。
    scale = 10;
    %nw: 横向扩张倍数，nh：纵向扩张倍数
    nw = 1; nh = 1;
    w = floor(scale*xr*nw);
    h = floor(scale*yr*nh);
    img = zeros(h, w);
    % sigma：高斯因子，越大密度影响范围越大
    sigma = 5.0;
    % factor：高斯缩放因子
    factor = 0.01;
    H = factor*fspecial('Gaussian',[2*h, 2*w],sigma);
    for n = 1:length(x)
        % 显示处理进度
        %disp(n);
        newX = w-floor(scale*(x(n)-xmin));
        newY = h-floor(scale*(y(n)-ymin));
        img = img+H(newY+1:newY+h, newX+1:newX+w);
    end
    %figure, surf(img);
    % 选择颜色表
    %colormap('jet');
    % 关闭网格线
    %shading interp;
    % 以方格显示
    %axis square;
    % 按一比一显示
    %axis equal;
end