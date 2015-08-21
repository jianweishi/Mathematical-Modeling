function [distance,path,pathway]=dijkstra2(v,w)
%���룺Դ��v���ڽӾ���w
%�����Դ�㵽�������С����distance,Դ�㵽������С·�����м���ת�㣨ǰһ�㣩
      %�Լ�·��pathway
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
    %��ʣ�ඥ�����ҳ�����v��С�ĵĵ����
    %����v����������·���Ķ��㼯��Ϊ�����
    [~,number]=min(distance2);
    S=[S,number];
    u=number;
end
%��·��
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