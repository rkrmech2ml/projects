function value = rose_step
x = [-1.2,1]';
x1=x;
max_iter = 20; %to set a limit for iteration
step_length= 1;
e=0.001;
 

nor = double (1) ; n = x; k = 1;x3=[0,0]';

 
while (k <= max_iter)
    % calculate gradient:
    d_k = (inv(hess(n)))*grad1(n); % decent direction
    g_d = grad1(n);
     nor = norm(g_d);
    % direction of the step 
    nnew = n - step_length*d_k;
    x3 = [x3,nnew];
    % plotting points
   
    if (norm(g_d)<=(e*norm(x)))
        break ;
    end    
    % loop updation
    k = k + 1;
    n = nnew;
    
    
end
fprintf ('The gradient value is:\n');
display (g_d);
fprintf ('Number of iterations:\n');
display (k);
fprintf ('Norm of the gradient is:\n');
display (nor);
fprintf ('Solution for rosenbrock for given condition:\n');

display(n);
figure 
plot(x3(1,:),x3(2,:),"r*");
display(x3)
hold on 
[P Q] = meshgrid(-8:0.1:8);
R = 100.*(Q-P.^2).^2+(1-P).^2;
contour(P,Q,R);
hold off
 
 
% define the grad function
function g = grad1(n)
g = [ 2*n(1) - 400*n(1)*(- n(1)^2 + n(2)) - 2
             - 200*n(1)^2 + 200*n(2)];
end
    function h = hess(x)
h= [1200*x(1)^2-400*x(2)+2,-400*x(1);-400*x(1),200];
end
end