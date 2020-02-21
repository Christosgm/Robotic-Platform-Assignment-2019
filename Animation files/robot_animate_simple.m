function robot_animate_simple()
  load -ascii simdata.txt;
  t = simdata(:,1); # time
  x = simdata(:,2); # position in X axis
  y = simdata(:,4); # position in Y axis
  psi = simdata(:,6); # orientation about the Z axis
  #=============================================================================
  #           RIGID BODY GEOMETRY
  #=============================================================================
  lAB = 45; # Length of the triangular structure side
  lBC = 35; # Length of the triangular structure base
  dBF = lBC/2;
  dAD = sqrt(lAB^2 - (1/4)*lBC^2);
  dAG = (2/3)*dAD;
  dDG = (1/3)*dAD;
  
  # Create an axes.
  figure;grid on;
  
  # Create the objects you want to parent to the transform object.
  # Draw body frame.
  h(1) = line([0,0],[-2,2],[0,0],'Color',[1 0 0]);
  h(2) = line([-2,2],[0,0],[0,0],'Color',[1 0 0]);
  # Draw triangle.
  h(3) = line([-dDG,-dDG],[-dBF,dBF],[0,0]);
  h(4) = line([-dDG,dAG],[dBF,0],[0,0]);
  h(5) = line([-dDG,dAG],[-dBF,0],[0,0]);
  
  # Create a transform object and parent the model to it.
  model = hgtransform('Parent',gca);
  set(h,'Parent',model);
  axis(gca,"equal");
  axis(gca,[-40 + min(x) 40 + max(x) -40 + min(y) 40 + max(y)]);
  xlabel(gca,'X-axis');ylabel(gca,'Y-axis');
  
  for t = 1:1:length(t)
    # Compute translation to correct linear position coordinates.
    dx = [x(t) y(t) 0]';
    translate = [eye(3) dx; zeros(1, 3) 1];
    # Compute rotation to correct angles. Then, turn this rotation
    # into a 4x4 matrix represting this affine transformation.
    R = [cos(psi(t)) -sin(psi(t)) 0
    sin(psi(t))  cos(psi(t)) 0
    0         0        1];
    rotate = [R zeros(3, 1); zeros(1, 3) 1];
    # Concatenate the transforms and
    # set the transform Matrix property
    set(model, 'Matrix', translate*rotate);
    drawnow;
  endfor
endfunction
