#图论算法
tags:图论 MATLAB 算法
*matlab代码托管于[github](https://github.com/jianweishi/Mathematical-Modeling/tree/master)*
### Floyd算法
 *基本思想:*

>- 递推产生一个邻接矩阵序列$A_1,A_2,\dots,A_k$[^A(i,j)]$,$$\dots,A_n$[^n]。
- 计算时用迭代公式：$$A_k(i,j)=min(A_{k-1}(i,j),A_{k-1}(i,k)+A_{k-1}(k,j))$$[^k]
- 最后，当$k=n时,A_n$即是各顶点之间的最短通路值

[^A(i,j)]:$A_k(i,j)$表示从定点$v_i$到顶点$v_j$的路径上所经过的定点序号不大于$k$的最短路径长度。

[^n]:$n$表示邻接矩阵的秩。

[^k]:$k$是迭代次数。$i,j=1,2,\dots,n$;

*伪代码*
```
A is the adjacency matrix
create a new matrix path with the same size of A
//the matrix path records the edges of every step 
B=A;
length=A.length;
for i=1 to length
    for j=1 to length
        path(i,j)=j;
for k=1 to length
    for i=1 to length
        for j=1 to length
            if B(i,j)>B(i,k)+B(k,j)
               B(i,j)=B(i,k)+B(k,j)
               path(i,j)=k;
return (B,path);
```
###Dijkstra算法[^distance]
*算法思想*
>设$G=(V,E)$是一个带权有向图，把图中顶点集合$V$分成两组，第一组为已求出最短路径的顶点集合（用$S$表示，初始时$S$中只有一个源点，以后每求得一条最短路径就将加入到集合$S$中，直到全部顶点都加入到$S$中，算法就结束了），第二组为其余未确定最短路径的顶点集合（用$U$表示），按最短路径长度的递增次序依次把第二组的顶点加入$S$中。在加入的过程中，总保持从源点$v$到$S$中各顶点的最短路径长度不大于从源点$v$到$U$中任何顶点的最短路径长度。

*算法步骤*
>-  初始时，$S$只包含源点，即$S={v},v$的距离为$0$，$U$包含除$V$以外的其他顶点，若$v$与$U$中顶点$u$有边，则$<u,v>$正常有权值，若$u$不是$v$的出边邻接点，则$<u,v>$权值为∞。
- 从$U$中选取一个距离$v$最小的顶点$k$,把$k$加入$S$中（该选定的距离就是$v$到$k$的最短路径长度)。
- 以$k$为新考虑的中间点，修改$U$中各顶点的距离；若从源点$v$到顶点$u（u,U）$的距离（经过顶点$k$)比原来距离（不经过顶点$k$）短，则修改顶点$u$的距离值，修改后的距离值的顶点$k$的距离加上边上的权。  
- 重复步骤$2和3$直到所有顶点都包含在S中。

*伪代码*

- 初始化
> $INITIALIZE-SINGLE-SOURCE(G,s)$
 $for$ $each$ $vertex$ $v$ $\in$ $G.v$
$\qquad$$v.d=\infty$
$\qquad$$v.\pi=NIL$
$s.d=0$       

- 松弛
>$RELAX(u,v,w)$
$if\quad v.d>u.d+w(u,v)$
$\qquad v.d=u.d+w(u,v)$
$\qquad v.\pi=u$

- $Dijkstra$算法
> $DIJKSTRA(G,w,s)$
$INITIALIZE-SINGLE-SOURCE(G,s)$
$S=\emptyset$
$Q=G.V$
$while\ Q\neq\emptyset$
$\qquad\ \ u=EXTRACT-MIN(Q)$
$\qquad\ \ S=S\bigcup\left\{u\right\} $
$\qquad\ \ for\ each\ vertex\ v \in G.Adj[u] $
$\qquad\qquad\ RELAX(u,v,w)$

[^distance]:距离的定义：每个顶点对应一个距离，$S$中的顶点的距离就是从$v$到此顶点的最短路径长度，$U$中的顶点的距离，是从$v$到此顶点只包括$S$中的顶点为中间顶点的当前最短路径长度。




