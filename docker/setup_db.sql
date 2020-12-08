-- create tables
create table vertex (id int primary key auto_increment, cluster_id int not null default 0, step_number int default -1);
create table edge (id1 int not null, id2 int not null, primary key (id1,id2));

--populate with 2^20 vertices and ~2^20 edges
insert into vertex values();
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
insert into vertex(cluster_id, step_number) select cluster_id, step_number from vertex;
create table vertex_tmp (id int, cluster_id int not null default 0, step_number int default -1);
insert into vertex_tmp select rn,rn,-1 from (select row_number() over() as rn from vertex)s;
truncate table vertex;
insert into vertex select * from vertex_tmp;
drop table vertex_tmp;


create table edge_tmp (id1 int not null, id2 int not null);
insert into edge_tmp values(1,2);
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge_tmp select floor(rand()*pow(2,20)),floor(rand()*pow(2,20)) from edge_tmp;
insert into edge select distinct id1,id2 from edge_tmp;
drop table edge_tmp;
