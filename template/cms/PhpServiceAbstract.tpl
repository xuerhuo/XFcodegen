<?php
namespace Cms\Service;
use Cms\core\db;
use Cms\common\ErrorCode;
use Cms\core\Service;
use Cms\Model\{{TableName}}Model;
/**
* {{TableName}} {{table_des}}
* @author {{author}}
* @date {{year}}年{{month}}月{{day}}日 {{hour}}:{{minute}}:{{second}}
* @mail 824851582@qq.com
*/
abstract class {{TableName}}ServiceAbstract extends Service
{
/**
     * 添加{{table_des}}数据
{% for col in cols %}{% if not loop.first %}
     * @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
     */
     public function add{{TableName}}($data){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->add{{TableName}}($data);
        if(!$ret){
            return $this->reply(ErrorCode::InsertError);
        }
        return $this->reply('',$ret);
    }
/**
     * 删除{{table_des}}数据
{% for col in cols %}{% if loop.first %}
     * @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
     */
    public function del{{TableName}}By{{cols[0]['Colname']}}($data){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->del{{TableName}}By{{cols[0]['Colname']}}($data['{{cols[0]['col_name_raw']}}']);
        if(!$ret){
            return $this->reply(ErrorCode::DeleteError);
        }
        return $this->reply('',$ret);
    }
/**
     * 删除{{table_des}}数据
{% for col in cols %}{% if loop.first %}
     * @param {{col['colname']}} {{col['comment']}}
{% endif %}
{% endfor %}
     */
    public function del{{TableName}}($data){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->del{{TableName}}($data);
        if(!$ret){
            return $this->reply(ErrorCode::DeleteError);
        }
        return $this->reply('',$ret);
    }
/**
     * 通过{{cols[0]['col_name_raw']}}修改{{table_des}} Model
     * 添加{{table_des}}数据
{% for col in cols %}
     * @param {{col['colname']}} {{col['comment']}}{% endfor %}
     */
    public function update{{TableName}}By{{cols[0]['Colname']}}($data){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->update{{TableName}}By{{cols[0]['Colname']}}($data);
        if(!$ret){
            return $this->reply(ErrorCode::UpdateError);
        }
        return $this->reply('',$ret);
    }
    /**
     * 增减{{table_des}} Service
     **/
    public function expr($field,$num,${{cols[0]['col_name_raw']}}){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->expr($field,$num,${{cols[0]['col_name_raw']}});
        if(!$ret){
            return $this->reply(ErrorCode::UpdateError);
        }
        return $this->reply('',$ret);
    }
    /**
     * 查询{{table_des}}数据
     * @param pagesize 分页大小
     * @param p 当前分页
{% for col in cols %}
     * @param {{col['colname']}} {{col['comment']}}{% endfor %}
     */
    public function query{{TableName}}($data){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->query{{TableName}}($data['pagesize'], $data['p'],$data,$data['orderby']);
        if(!$ret['result']){
            return $this->reply(ErrorCode::NODATA);
        }
        return $this->reply('',$ret);
    }
    /**
     * 查询{{table_des}} 所有数据
     * @param pagesize 分页大小
     * @param p 当前分页
{% for col in cols %}
     * @param {{col['colname']}} {{col['comment']}}{% endfor %}
     */
    public function query{{TableName}}All($data){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->query{{TableName}}All($data,$data['orderby']);
        if(!$ret){
            return $this->reply(ErrorCode::NODATA);
        }
        return $this->reply('',$ret);
    }
/**
     * 通过{{cols[0]['col_name_raw']}}单条查询 Service
     * @param {{cols[0]['col_name_raw']}}
     */
    public function find{{TableName}}By{{cols[0]['Colname']}}($data){
        $m_{{tableName}} = new {{TableName}}Model();
        $ret = $m_{{tableName}}->find{{TableName}}By{{cols[0]['Colname']}}($data['{{cols[0]['col_name_raw']}}']);
        if(!$ret){
            return $this->reply(ErrorCode::NODATA);
        }
        return $this->reply('',$ret);
    }
}