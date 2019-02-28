function [img] = showDensityImg(x, y)
    xmin = min(x);
    xmax = max(x);
    xr = xmax-xmin;
    ymin = min(y);
    ymax = max(y);
    yr = ymax - ymin;
    % scaleԽ���ܶ�ͼ�ֱ���Խ�󣬺�ʱԽ����
    scale = 10;
    %nw: �������ű�����nh���������ű���
    nw = 1; nh = 1;
    w = floor(scale*xr*nw);
    h = floor(scale*yr*nh);
    img = zeros(h, w);
    % sigma����˹���ӣ�Խ���ܶ�Ӱ�췶ΧԽ��
    sigma = 5.0;
    % factor����˹��������
    factor = 0.01;
    H = factor*fspecial('Gaussian',[2*h, 2*w],sigma);
    for n = 1:length(x)
        % ��ʾ�������
        %disp(n);
        newX = w-floor(scale*(x(n)-xmin));
        newY = h-floor(scale*(y(n)-ymin));
        img = img+H(newY+1:newY+h, newX+1:newX+w);
    end
    %figure, surf(img);
    % ѡ����ɫ��
    %colormap('jet');
    % �ر�������
    %shading interp;
    % �Է�����ʾ
    %axis square;
    % ��һ��һ��ʾ
    %axis equal;
end