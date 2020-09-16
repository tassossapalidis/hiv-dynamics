
c=3.07;
d=.49;
v0=12000;
f=@(t,y) [-(g.*y(1))-(b.*y(3).*y(1)); (b.*y(3).*y(1))-(d.*y(2)); (c.*d.*y(2))/(b.*p)-(c.*y(3))];
tspan=[0 60];
[t,y]=ode45(@virions, tspan, [.204 .204 12000]);
figure ();
plot(t,y(:,3))
title('Viral Load over Time for Patient 103 with CCR5 Receptor Mutator Treatment');
xlabel('Time (days)');
ylabel('Plasma Virions');

y;
u=size(y,1);
k=zeros(u,1);
for i=1:u
    if y(i,3)<1
    k(i,1)=1;
    end

if y(i,3)>1
   k(i,1)=0;
end
end
k;
u;
percenbelow=sum(k);
j=u-percenbelow;
o=j/u;
answer=o.*60

c=3.07;
d=.49;
v0=12000;
v=zeros(60,1);
for t=1:59
v(t+1)=v0.*exp(-c.*t)+((c.*v0)/(c-d)).*((c/(c-d)).*(exp(-d.*t)-exp(-c.*t))-(d.*t.*exp(-c.*t)));
end
v(1)=v0;
v;

figure();
plot(v)
title('Viral Load over Time for Patient 103 with Protease Inhibitor Treatment');
xlabel('Time (days)');
ylabel('Plasma Virions');

k=zeros(60,1);
for i=1:60
    if v(i,1)<1
    k(i,1)=1;
    end

if v(i,1)>1
   k(i,1)=0;
end
end

k;
percenbelow=sum(k);
60-percenbelow


