camnames{1,5}='Camera5'
labelData{5,1}=labelData{1,1};
params{5,1}=params{1,1};
sync{5,1}=sync{1,1};
save dum5_label3d_dannce.mat



%%

pred_add=[]
fname = fieldnames(predictions);
       
for ii=1:16
    pred_add(:,:,ii)=predictions.(fname{ii});
end

skeleton = load('F:\dannce\Label3D\skeletons\rat16.mat');
% Load dannce predictions from a file. pts3d.pred is nFrames x 3 x nKeypoints 
%pts3d = load('F:\dannce\demo\mouse20230129\DANNCE\predict_results\save_data_MAX0.mat')

close all
viewGui = View3D(params, videos, skeleton);

viewGui.loadFrom3D(pred_add(framesToLabel,:,:));






savePath = 'dannce_predict_video.mp4';
viewGui.writeVideo(framesToLabel, savePath, 'FPS', 60, 'Quality', 50);
