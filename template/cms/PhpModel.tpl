<?php
namespace Cms\Model;
/**
* {{TableName}} {{table_des}}
* @author {{author}}
* @date {{year}}年{{month}}月{{day}}日 {{hour}}:{{minute}}:{{second}}
* @mail 824851582@qq.com
*/
class {{TableName}}Model extends {{TableName}}ModelAbstract
{
/************************  {{table_des}}数据CURD  *****************************/
/**
     * 添加{{table_des}}数据
{% for col in cols %}{% if not loop.first %}
     * @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
     */
    public function add{{TableName}}($data){
       return parent::add{{TableName}}($data);
    }
/**
     * 删除{{table_des}}数据
{% for col in cols %}{% if loop.first %}
     * @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
     */
    public function del{{TableName}}By{{cols[0]['Colname']}}(${{cols[0]['colname']}}){
               return parent::del{{TableName}}By{{cols[0]['Colname']}}(${{cols[0]['colname']}});
    }
    /**
     * 删除{{table_des}}数据
{% for col in cols %}{% if loop.first %}
     * @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
     */
    public function del{{TableName}}($data){
               return parent::del{{TableName}}($data);
    }
/**
     * 通过{{cols[0]['col_name_raw']}}修改{{table_des}} Model
     * 添加{{table_des}}数据
{% for col in cols %}
     * @param {{col['colname']}} {{col['comment']}}{% endfor %}
     */
    public function update{{TableName}}By{{cols[0]['Colname']}}($data){
        return parent::update{{TableName}}By{{cols[0]['Colname']}}($data);
    }
    /**
     * 增减{{table_des}} Model
     **/
    public function expr($field,$num,${{cols[0]['col_name_raw']}}){
        return parent::expr($field,$num,${{cols[0]['col_name_raw']}});
    }
    /**
     * 查询{{table_des}}数据
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    public function query{{TableName}}($pagesize=50, $p=1,$search=false,$orderby = false){
       return parent::query{{TableName}}($pagesize, $p,$search,$orderby);
    }
    /**
     * 查询{{table_des}}数据
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    public function query{{TableName}}All($search=false,$orderby = false){
       return parent::query{{TableName}}All($search,$orderby );
    }
    /**
     * 通过{{cols[0]['col_name_raw']}}单条查询 Model
     * @param {{cols[0]['col_name_raw']}}
     */
    public function find{{TableName}}By{{cols[0]['Colname']}}(${{cols[0]['colname']}}){
        return parent::find{{TableName}}By{{cols[0]['Colname']}}(${{cols[0]['colname']}});
    }
/**
     * 格式化数据
     * @param $rows
     * @return mixed
     */
    public function format{{TableName}}($rows){
        if(is_array($rows)&&array_filter($rows)){
          //  $s_select = new SelectService();
          //  $dat = $s_select->querySelectkv('auth_rule_type');
            foreach ((array)$rows as $k=>$data)
            {
                //$rows[$k]['type_f'] = $dat[$data['type']];
                //do sth
            }
        }
        return $rows;
    }
}