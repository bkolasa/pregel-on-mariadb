import sys

import mariadb

from timer import timer


def get_count(cur, table_name):
    cur.execute(f"select count(*) from {table_name}")
    return cur.fetchone()[0]


def drop_table(cur, table_name):
    cur.execute(f"drop table {table_name}")


def rename_table(cur, table_name, new_name):
    cur.execute(f"alter table {table_name} rename to {new_name}")


def truncate_table(cur, table_name):
    cur.execute(f"truncate table {table_name}")


def create_vertex_type_table(cur, table_name):
    cur.execute(f"create table if not exists {table_name} (id int primary key, cluster_id int, step_number int)")


@timer
def do_pregel_step(cur, table_name, step_number):
    cur.execute(
        f"insert into {table_name} select v2.id, min(v1.cluster_id), {step_number} from vertex v1 inner join edge on v1.id=edge.id1"
        f" inner join vertex v2 on v2.id=edge.id2 where v1.step_number={step_number-1} group by v2.id,v2.cluster_id having v2.cluster_id > min(v1.cluster_id) ")


@timer
def merge_tables(cur, base_table, update_table, merge_table):
    cur.execute(
        f"insert into {merge_table} select b.id, coalesce(u.cluster_id, b.cluster_id), coalesce(u.step_number, b.step_number) from {base_table} b left join {update_table} u on b.id=u.id")


def get_cursor():
    try:
        conn = mariadb.connect(
            user="root",
            password="my-secret-pw",
            host="127.0.0.1",
            port=3306,
            database="mysql"
        )
        return conn.cursor()
    except mariadb.Error as e:
        print(f"Error connecting to MariaDB Platform: {e}")
        sys.exit(1)


cur = get_cursor()
step_number = 0

update_vertex_table_name = "updated_vertex"
temporary_merge_table = "vertex_tmp"
create_vertex_type_table(cur, update_vertex_table_name)
truncate_table(cur, update_vertex_table_name)
create_vertex_type_table(cur, temporary_merge_table)
truncate_table(cur, temporary_merge_table)
count = 0

while True:
    print(f'Doing step {step_number}')
    do_pregel_step(cur, update_vertex_table_name, step_number)
    count = get_count(cur, update_vertex_table_name)
    print(f"{count} vertices were updated", flush=True)
    if count == 0:
        break
    merge_tables(cur, 'vertex', update_vertex_table_name, temporary_merge_table)
    drop_table(cur, 'vertex')
    rename_table(cur, temporary_merge_table, 'vertex')
    create_vertex_type_table(cur, temporary_merge_table)
    truncate_table(cur, update_vertex_table_name)
    step_number += 1
