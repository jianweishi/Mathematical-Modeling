function [T,c,b]=kruskal2(w)
% ��С������Kruskal�㷨
n=size(w,1);
%���߾���
k=1;
for i=1:(n-1)
    for j=(i+1):n
        if w(i,j)~=inf
            b(:,k)=[i;j;w(i,j)];
            k=k+1;
        end
    end
end
m=size(b,2);
[b,I]=sortrows(b',3),b=b'
%��Ȧ
T=[];%��
c=0;%Ȩ��
t=1:n;%������������С��ŵ�
k=1;%������С���ı���
for i=1:m
    if t(b(1,i))~=t(b(2,i))        
        T(1:2,k)=b(1:2,i);
        c=c+b(3,i);
        tmin=min(t(b(1,i)),t(b(2,i)));  %������������С��ŵ�
        tmax=max(t(b(1,i)),t(b(2,i)));
        for j=1:n
            if t(j)==tmax
                t(j)=tmin;
            end
        end
        k=k+1;
    end
    if k==n
        break;
    end    
end