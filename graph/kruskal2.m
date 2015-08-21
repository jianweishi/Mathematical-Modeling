function [T,c,b]=kruskal2(w)
% 最小生成树Kruskal算法
n=size(w,1);
%求点边矩阵
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
%避圈
T=[];%树
c=0;%权和
t=1:n;%所在子树的最小标号点
k=1;%进入最小树的边数
for i=1:m
    if t(b(1,i))~=t(b(2,i))        
        T(1:2,k)=b(1:2,i);
        c=c+b(3,i);
        tmin=min(t(b(1,i)),t(b(2,i)));  %更新子树的最小标号点
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