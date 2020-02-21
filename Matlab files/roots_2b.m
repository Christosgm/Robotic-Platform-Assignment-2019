Kpyv=[1e-15 1e-5 1e-3 5e-3 1e-2 5e-2 1e-1 2e-1 5e-1 1e0 2e0 5e0 1e1 2e1 5e1 1e2 5e2 1e3 1e5 1e15];
Kdyv=logspace(-5,5,200);
mz=357000000;
Dz=11835;
r=[];
for i=1:length(Kpyv)
    Kpy=Kpyv(i);
    subplot(4,5,i);
    for j=1:length(Kdyv)
        Kdy=Kdyv(j);
        r=roots([mz/Kpy,(Kdy+Dz)/Kpy,1])
        r1=r(1);
        r2=r(2);
        scatter(real(r1),imag(r1),20,'MarkerFaceColor',[33/255 79/255 255/255],'MarkerEdgeColor',[33/255 79/255 255/255],'LineWidth',1.0);
        hold on;
        scatter(real(r2),imag(r2),20,'MarkerFaceColor',[255/255 15/255 4/255],'MarkerEdgeColor',[255/255 15/255 4/255],'LineWidth',1.0);
        hold on;
     
        grid;
        hold on;
    end
    title(['$$K_{py}=$$', num2str(Kpy)], 'Interpreter', 'Latex');
end