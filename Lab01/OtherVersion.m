input = imread('flower.jpg');

cb_ref = imref2d(size(input));

tx = 100;
ty = 100;

sx = 1;
sy = 1;

shx = 2;
shy = 2;


T = [ sx   shy   0;
     shx    sy   0;
      tx    ty   1];
  
tform_t = affine2d(T);

deg =  pi/4;
R = [ cosd(deg)  sind(deg)   0;
     -sind(deg)  cosd(deg)   0;
              0         0    1];
tform_r = affine2d(R);

TR = T*R;
tform_tr = affine2d(TR);

[out,out_ref] = imwarp(input,cb_ref,tform_tr);
figure,imshowpair(out,out_ref,input,imref2d(size(input)));
