function [distance,path,pathway]=dijkstra2(v,w)
%输入：源点v，邻接矩阵w
%输出：源点到各点的最小距离distance,源点到各点最小路径的中间周转点（前一点）
      %以及路径pathway
n=length(w);
S=v;
u=S(1);
distance=w(v,:);
path=v*ones(1,n);
while length(S)<n
    for j=1:n
        if distance(u)+w(u,j)<distance(j)
            distance(j)=distance(u)+w(u,j);
            path(j)=u;
        end
    end
    distance2=distance;
    distance2(S)=inf;
    %从剩余顶点中找出距离v最小的的点可以
    %先令v到已求出最短路径的顶点集合为无穷大
    [~,number]=min(distance2);
    S=[S,number];
    u=number;
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

% pathway=zeros(n,1);pathway2=[];
% for i=1:n
%     dot=path(i);
%     pathway(i,:)=i;
%     pathway2=i;
%     while dot~=1
%         pathway2=[dot,pathway2];
%         dot=path(dot);
%     end
% end