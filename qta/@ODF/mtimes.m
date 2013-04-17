function odf = mtimes(x,y)
% scaling of the ODF
%
% overload the * operator, i.e. one can now write x*@ODF or @ODF*y in order
% to scale an ODF
%
%% See also
% ODF_index ODF/plus

if isa(x,'ODF') && isa(y,'double')
  odf = x;
  f = y;
elseif isa(y,'ODF') && isa(x,'double')
  odf = y;
  f = x;
end

for i = 1:length(odf)
  odf(i).c_hat = f*odf(i).c_hat;
  odf(i).c = f*odf(i).c;
end
