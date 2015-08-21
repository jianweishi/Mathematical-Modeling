function [distance,path,pathway]=dijkstra(v0,w)
%���·���ĳ��ȡ�ǰһ�㡢·��          Դ�� ��Ȩ�ڽӾ���
n=size(w,1);

%����ֵ
s=v0;      %��������·���Ľ��
distance=w(v0,:);
path=v0*ones(1,n);
u=s(1);
k=1;      %s��

while k<n
   % ���� distance(v) �� path(v)
   for i=1:n
       if distance(i)>distance(u)+w(u,i)
           distance(i)=distance(u)+w(u,i);
           path(i)=u;
      end
   end
   %��v*
   d=distance;   %V-S�о���
   for i=1:n
      for j=1:k
         if i==s(j)
            d(i)=inf;
            break
         end
      end
   end   
   [dmin,v]=min(d);     %V-S����С����
   k=k+1;
   s(k)=v;
   u=s(k);
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