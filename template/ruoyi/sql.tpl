-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('{{table_des}}', '{{menu_parent_id}}', '1', '{{tableName}}', '{{module}}/{{TableName}}', 1, 0, 'C', '0', '0', '{{module}}:{{tableName}}:list', 'build', 'admin', sysdate(), '', null, '{{table_des}}菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('{{table_des}}查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('{{table_des}}新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('{{table_des}}修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('{{table_des}}删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('{{table_des}}导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}:export',       '#', 'admin', sysdate(), '', null, '');

-- ------------------------------------------------api-------------------------------------------------------------

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('前台-{{table_des}}', '{{menu_parent_id}}', '1', '{{tableName}}Api', '{{module}}/{{TableName}}Api', 1, 0, 'C', '1', '0', '{{module}}:{{tableName}}Api:list', 'build', 'admin', sysdate(), '', null, '{{table_des}}菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('前台{{table_des}}查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}Api:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('前台{{table_des}}新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}Api:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('前台{{table_des}}修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}Api:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('前台{{table_des}}删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}Api:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('前台{{table_des}}导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', '{{module}}:{{tableName}}Api:export',       '#', 'admin', sysdate(), '', null, '');