clear 
clc
a = 0.9;
t0 = 100; tf = 1; t = t0;
Markov_length = 1000;
load_system('longmendiao_SA');
fit_list=zeros(1,100000);
count=0;

Kp=70;Td=26;
set_param('longmendiao_SA/Td','Gain',num2str(Td));
set_param('longmendiao_SA/Kp','Gain',num2str(Kp));
sol_new = [Kp Td];

E_current = inf;
E_best = inf;

sol_current = sol_new;
sol_best = sol_new;
p = 1; 
while t >= tf 
   
    for r = 1:Markov_length 
        count=count+1;
        
        sol_new(1,1)=sol_new(1,1)+10*rand-5;
        sol_new(1,2)=sol_new(1,2)+10*rand-5;
        
 
        
            Kp=sol_new(1,1);Td=sol_new(1,2);
            set_param('longmendiao_SA/Td','Gain',num2str(Td));
            set_param('longmendiao_SA/Kp','Gain',num2str(Kp));
            inner=sim('longmendiao_SA'); 
            E_new = inner.data_itae.signals.values(end);
       
        if E_new < E_current
            E_current = E_new;
            sol_current = sol_new;
            if E_new < E_best
                pre_E_best = E_best;
                E_best = E_new;
                sol_best = sol_new;
            end
        else
       
            if rand < exp(-(E_new - E_current)./t)
                E_current = E_new;
                sol_current = sol_new;
            else
                sol_new = sol_current;
            end
            
        end
    fit_list(1,count) = E_best;    
    end
    t =t*a;
end
figure(2)
iter = 1:count;
y_value = fit_list(1,1:count);
plot(iter,y_value)
title('Optimal')
xlabel('Iteration')
ylabel('Current Optimal') 

disp('Optimal:Kp=');disp(sol_best(1,1));disp(',Td=');disp(sol_best(1,2));

fprintf('\n');
disp('ITAE:')
disp(E_best);