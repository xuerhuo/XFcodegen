import request from '@/utils/request'

// 查询{{table_des}}列表
export function list{{TableName}}(query) {
  return request({
    url: '/{{module}}/{{tableName}}/list',
    method: 'get',
    params: query
  })
}

// 查询{{table_des}}详细
export function get{{TableName}}({{cols[0]['colName']}}) {
  return request({
    url: '/{{module}}/{{tableName}}/' + {{cols[0]['colName']}},
    method: 'get'
  })
}

// 新增{{table_des}}
export function add{{TableName}}(data) {
  return request({
    url: '/{{module}}/{{tableName}}',
    method: 'post',
    data: data
  })
}

// 修改{{table_des}}
export function update{{TableName}}(data) {
  return request({
    url: '/{{module}}/{{tableName}}',
    method: 'put',
    data: data
  })
}

// 删除{{table_des}}
export function del{{TableName}}({{cols[0]['colName']}}) {
  return request({
    url: '/{{module}}/{{tableName}}/' + {{cols[0]['colName']}},
    method: 'delete'
  })
}

// 导出{{table_des}}
export function export{{TableName}}(query) {
  return request({
    url: '/{{module}}/{{tableName}}/export',
    method: 'get',
    params: query
  })
}