<?php
namespace Cms\Service;
use Cms\common\ErrorCode;
use Cms\core\db;
use Cms\core\Service;
use Cms\Model\{{TableName}}Model;
/**
* {{TableName}} {{table_des}}
* @author {{author}}
* @date {{year}}年{{month}}月{{day}}日 {{hour}}:{{minute}}:{{second}}
* @mail 824851582@qq.com
*/
class {{TableName}}Service extends {{TableName}}ServiceAbstract
{
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
    public function del{{TableName}}By{{cols[0]['Colname']}}($data){
        return parent::del{{TableName}}By{{cols[0]['Colname']}}($data);
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
     * 增减{{table_des}} Service
     **/
    public function expr($field,$num,${{cols[0]['col_name_raw']}}){
        return parent::expr($field,$num,${{cols[0]['col_name_raw']}});
    }
    /**
     * 查询{{table_des}}数据
     * @param pagesize 分页大小
     * @param p 当前分页
{% for col in cols %}
     * @param {{col['colname']}} {{col['comment']}}{% endfor %}
     */
    public function query{{TableName}}($data){
        return parent::query{{TableName}}($data);
    }
    /**
     * 查询{{table_des}} 所有数据
     * @param pagesize 分页大小
     * @param p 当前分页
{% for col in cols %}
     * @param {{col['colname']}} {{col['comment']}}{% endfor %}
     */
    public function query{{TableName}}All($data){
        return parent::query{{TableName}}All($data);
    }
/**
     * 通过{{cols[0]['col_name_raw']}}单条查询 Service
     * @param {{cols[0]['col_name_raw']}}
     */
    public function find{{TableName}}By{{cols[0]['Colname']}}($data){
        return parent::find{{TableName}}By{{cols[0]['Colname']}}($data);
    }
}