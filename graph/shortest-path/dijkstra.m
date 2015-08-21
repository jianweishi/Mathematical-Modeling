function [distance,path,pathway]=dijkstra(v0,w)
%最短路径的长度、前一点、路径          源点 带权邻接矩阵
n=size(w,1);

%赋初值
s=v0;      %已求得最短路径的结点
distance=w(v0,:);
path=v0*ones(1,n);
u=s(1);
k=1;      %s长

while k<n
   % 更新 distance(v) 和 path(v)
   for i=1:n
       if distance(i)>distance(u)+w(u,i)
           distance(i)=distance(u)+w(u,i);
           path(i)=u;
      end
   end
   %求v*
   d=distance;   %V-S中距离
   for i=1:n
      for j=1:k
         if i==s(j)
            d(i)=inf;
            break
         end
      end
   end   
   [dmin,v]=min(d);     %V-S中最小距离
   k=k+1;
   s(k)=v;
   u=s(k);
end

%求路径
pathway=zeros(n);pathway(1:n,1:2)=[v0*ones(n,1),(1:n)'];
for i=1:n
    q=i;
    while path(q)~=v0
        pathway(i,2:n)=[path(q),pathway(i,2:(n-1))];
        q=path(q);
    end
end
for j=n:-1:1
    if pathway(:,j)==0
        pathway(:,j)=[];
    end
end