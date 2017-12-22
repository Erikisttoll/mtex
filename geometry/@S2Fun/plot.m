function h = plot(sF,varargin)
%
% Syntax
%
% Input
%
% Output
%
% Options
%
% See also
%

% create a new figure if needed
[mtexFig,isNew] = newMtexFigure('datacursormode',@tooltip,varargin{:});

% generate a grid where the function will be plotted
plotNodes = plotS2Grid(varargin{:});

% evaluate the function on the plotting grid
sF = subsref(sF, substruct('()', {':'}));
values = sF.eval(plotNodes);

[mtexFig,isNew] = newMtexFigure(varargin{:});

for j = 1:numel(sF)
  % plot the function values
  h = plot(plotNodes,values(j, 1, :, :),'contourf', 'parent', mtexFig.gca, 'upper', varargin{:});
  mtexFig.nextAxis;
end

% remove output if not required
if nargout == 0, clear h; end

  function txt = tooltip(varargin)
    
    [r_local,v] = getDataCursorPos(mtexFig);
    %v = sF.eval(r_local);
    
    txt = [xnum2str(v) ' at (' int2str(r_local.theta/degree) ',' int2str(r_local.rho/degree) ')'];
  
  end

end
