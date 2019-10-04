%% Defining Rotations
%
% Rotations are the basic concept to understand crystal orientations and
% crystal symmetries.
%%
% Rotations are represented in MTEX by the class *@rotation* which is
% inherited from the class <quaternion_index.html quaternion> and allow to
%
%% Euler Angles
%
% There are several ways to specify a rotation in MTEX. A
% well known possibility are the so called *Euler angles*. In texture
% analysis the following conventions are commonly used
%
% * Bunge (phi1,Phi,phi2)       - ZXZ
% * Matthies (alpha,beta,gamma) - ZYZ
% * Roe (Psi,Theta,Phi)
% * Kocks (Psi,Theta,phi)
% * Canova (omega,Theta,phi)
%
% *Defining a Rotation by Bunge Euler Angles*
%
% The default Euler angle convention in MTEX are the Bunge Euler angles.
% Here a rotation is determined by three consecutive rotations,
% the first about the z-axis, the second about the y-axis, and the third
% again about the z-axis. Hence, one needs three angles to define an
% rotation by Euler angles. The following command defines a rotation by its
% three Bunge Euler angles

rot = rotation.byEuler(30*degree,50*degree,10*degree)


%%
% *Defining a Rotation by Other Euler Angle Conventions*
%
% In order to define a rotation by a Euler angle convention different to
% the default Euler angle convention you to specify the convention as an
% additional parameter, e.g.

rot = rotation.byEuler(30*degree,50*degree,10*degree,'Roe')


%%
% *Changing the Default Euler Angle Convention*
%
% The default Euler angle convention can be changed by the command
% *setpref*, for a permanent change the
% <matlab:edit('mtex_settings.m') mtex_settings> should be edited. Compare

setMTEXpref('EulerAngleConvention','Roe')
rot

%%
setMTEXpref('EulerAngleConvention','Bunge')
rot

%% Other Ways of Defining a Rotation
%
% *The axis angle parametrisation*
%
% A very simple possibility to specify a rotation is to specify the
% rotation axis and the rotation angle.

rot = rotation.byAxisAngle(xvector,30*degree)

%%
% *Four vectors defining a rotation*
%
% Given four vectors u1, v1, u2, v2 there is a unique rotation q such that
% q u1 = v1 and q u2 = v2.

rot = rotation.map(xvector,yvector,zvector,zvector)

%%
% If only two vectors are specified, then the rotation with the smallest
% angle is returned and gives the rotation from first vector onto the
% second one.

rot = rotation.map(xvector,yvector)

%%
% *A fibre of rotations*
%
% The set of all rotations that rotate a certain vector u onto a certain
% vector v define a fibre in the rotation space. A discretisation of such a
% fibre is defined by

u = xvector;
v = yvector;
rot = rotation(fibre(u,v))


%%
% *Defining an rotation by a 3 times 3 matrix*

rot = rotation('matrix',eye(3))

%%
% *Defining an rotation by a quaternion*
%
% A last possibility is to define a rotation by a quaternion, i.e., by its
% components a,b,c,d.


rot = rotation('quaternion',1,0,0,0)

%%
% Actually, MTEX represents internally every rotation as a quaternion.
% Hence, one can write

q = quaternion(1,0,0,0)
rot = rotation(q)


