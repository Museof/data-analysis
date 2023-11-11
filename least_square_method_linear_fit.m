%assume x to be exact and only considered the permissible deviation and
%residual variance of y when calc standard deviation of slope

%input x, y, sigma_yi_p, xlabel, ylabel

x = [1,2,3,4,5,6]
y = [40,52,59,71,80,88]
sigma_yi_p = 0 %permissible deviation of y
n = length(x)

%linear fit and draw the curve
model = polyfit(x, y, 1)
fitted_y = polyval(model, x)
plot(x, y, '+', x, fitted_y, '-')
xlabel('t/s')
ylabel('v/m*s^-1')

%calc standard deviation of slope
sigma_squared = sum((y-fitted_y).^2)/(n-2) %residual variance of y
sigma_yi = sqrt(sigma_squared+(sigma_yi_p/sqrt(3))^2)
sigma_a1 = sigma_yi/sqrt(sum((x-mean(x)).^2)) %standard deviation of slope