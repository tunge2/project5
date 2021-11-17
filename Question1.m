clear all
close all

load S_sphere_path.mat
load S_sphere_path_uniform.mat
cam_def
x_c = [1.2 2.5];

for i=1:length(x_c)
    R_oc = [0 0 -1; -1 0 0; 0 1 0];
    
    P_c = [x_c(i) 0 1/2]';
    T_oc = [R_oc, P_c; 0 0 0 1];
    
    [uv,~,~] = cam_image(cam,T_oc,pS);
    
    figure(i);plot(uv(1,:),uv(2,:),'x','linewidth',2); hold on;
    xlabel('image plane horizontal axis');
    ylabel('image plane vertical axis');
    p_0C=T_oc(1:3,4);
    title(['camera frame location: ',...
        '[',num2str(p_0C(1)),',',num2str(p_0C(2)),',',num2str(p_0C(3)),']']);
    axis([0 cam.uv0(1)*2 0 cam.uv0(2)*2]);
    set ( gca, 'xdir', 'reverse' )
end









