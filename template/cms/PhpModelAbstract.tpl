<?php
namespace Cms\Model;
use Cms\core\db;
use Cms\core\Model;
use Cms\Model\{{TableName}}Model;
use Cms\Common\Util\SqlUtil;
/**
* {{TableName}} {{table_des}}
* @author {{author}}
* @date {{year}}年{{month}}月{{day}}日 {{hour}}:{{minute}}:{{second}}
* @mail 824851582@qq.com
*/
abstract class {{TableName}}ModelAbstract extends Model
{
/************************  {{table_des}}数据CURD  *****************************/
/**
     * 添加{{table_des}}数据
{% for col in cols %}{% if not loop.first %}     * @param {{col['colname']}} {{col['comment']}}
{% endif %}{% endfor %}     */
     public function add{{TableName}}($data){
        $sql = 'insert into {pre}{{table_raw}} ({% for col in cols %}{% if not loop.first %}`{{col['col_name_raw']}}`{% if not loop.last %},{% endif %}{% endif %}{% endfor %})values({% for col in cols %}{% if not loop.first %}:{{col['col_name_raw']}}{% if not loop.last %} , {% endif %}{% endif %}{% endfor %})';
{% for col in cols %}{% if not loop.first %}
        $param[':{{col['col_name_raw']}}'] = $data['{{col['col_name_raw']}}'];
{% endif %}{% endfor %}
        $ret = $this->exec($sql,$param);
        if ($ret){
            return $this->getLastInsertId();
        }
        return $ret;
    }
/**
     * 删除{{table_des}}数据
{% for col in cols %}{% if loop.first %}* @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
     */
    public function del{{TableName}}By{{cols[0]['Colname']}}(${{cols[0]['colname']}}){
        $sql = 'delete from {pre}{{table_raw}} where {{cols[0]['col_name_raw']}}=:{{cols[0]['col_name_raw']}}';
        $param[':{{cols[0]['col_name_raw']}}'] = ${{cols[0]['colname']}};
        return $this->exec($sql,$param);
    }
/**
     * 删除{{table_des}}数据
{% for col in cols %}{% if loop.first %}
     * @param {{col['colname']}} {{col['comment']}}{% endif %}
{% endfor %}
     */
    public function del{{TableName}}($data){
        $sql = 'delete from {pre}{{table_raw}} where 1';
        $pdo_param = [];
{% for col in cols %}
        if(isset($data['{{col['col_name_raw']}}'])){
            if (!is_array($data['{{col['col_name_raw']}}'])) {
                $sql .= ' and {{col['col_name_raw']}}=:{{col['col_name_raw']}}';
                $pdo_param[':{{col['col_name_raw']}}'] = $data['{{col['col_name_raw']}}'];
            }else if (count($data['{{col['col_name_raw']}}'])>0){
                $tempsql = SqlUtil::appenIn($data['{{col['col_name_raw']}}'],'{{col['col_name_raw']}}');
                $sql.=sprintf(' and {{col['col_name_raw']}} in (%s)',$tempsql[0]);
                $pdo_param = $pdo_param+$tempsql[1];
            }
        }
{% endfor %}
        return $this->exec($sql,$pdo_param);
    }
/**
     * 通过{{cols[0]['col_name_raw']}}修改{{table_des}} Model
     * 添加{{table_des}}数据
{% for col in cols %}    * @param {{col['colname']}} {{col['comment']}}
{% endfor %}
     */
    public function update{{TableName}}By{{cols[0]['Colname']}}($data){
        $sql = 'update {pre}{{table_raw}} set ';
{% for col in cols %}{% if not loop.first %}      if (isset($data['{{col['col_name_raw']}}'])){
            $sql = $sql.' {{col['col_name_raw']}}=:{{col['col_name_raw']}},';
            $param[':{{col['col_name_raw']}}'] = $data['{{col['col_name_raw']}}'];
        }
{% endif %}{% endfor %}
        $sql = trim($sql,',');
        $sql = $sql.' where {{cols[0]['col_name_raw']}}=:{{cols[0]['col_name_raw']}}';
        $param[':{{cols[0]['col_name_raw']}}'] = $data['{{cols[0]['col_name_raw']}}'];
return $this->exec($sql,$param);
    }
    /**
     * 增减{{table_des}} Model
     **/
    public function expr($field,$num,${{cols[0]['col_name_raw']}}){
        $num = intval($num);
        $pdo = [];
        if($num>0)
        $sql = 'update {pre}{{table_raw}} set `'.$field.'`='.$field.'+'.$num.' where {{cols[0]['col_name_raw']}}=:{{cols[0]['col_name_raw']}};';
        if($num<0)
        $sql = 'update {pre}{{table_raw}} set `'.$field.'`='.$field.'-'.abs($num).' where {{cols[0]['col_name_raw']}}=:{{cols[0]['col_name_raw']}};';
        $pdo[':{{cols[0]['col_name_raw']}}'] = ${{cols[0]['col_name_raw']}};
        return $this->exec($sql,$pdo);
    }
    /**
     * 查询{{table_des}}数据
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    public function query{{TableName}}($pagesize=50, $p=1,$search=false,$orderby = false){
        $sql = 'select {{table_abbr}}.* from {pre}{{table_raw}} {{table_abbr}} WHERE 1';
        $pdo_param = [];
{% for col in cols %}
        if(isset($search['{{col['col_name_raw']}}'])){
            if (!is_array($search['{{col['col_name_raw']}}'])) {
                $sql .= ' and {{table_abbr}}.{{col['col_name_raw']}}=:{{col['col_name_raw']}}';
                $pdo_param[':{{col['col_name_raw']}}'] = $search['{{col['col_name_raw']}}'];
            }else if (count($search['{{col['col_name_raw']}}'])>0){
                $tempsql = SqlUtil::appenIn($search['{{col['col_name_raw']}}'],'{{col['col_name_raw']}}');
                $sql.=sprintf(' and {{table_abbr}}.{{col['col_name_raw']}} in (%s)',$tempsql[0]);
                $pdo_param = $pdo_param+$tempsql[1];
            }
        }
{% endfor %}
        if($orderby) {
            if ( $orderby == 'new' ) {
                $sql.=' order by {{table_abbr}}.{{cols[0]['col_name_raw']}} desc';
            }
        }
        $data = $this->page_query($sql,$pdo_param,$pagesize, $p);
        $data['result'] = $this->format{{TableName}}($data['result']);
        return $data;
    }
    /**
     * 查询所有{{table_des}}数据
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    public function query{{TableName}}All($search=false,$orderby = false){
        $sql = 'select {{table_abbr}}.* from {pre}{{table_raw}} {{table_abbr}} WHERE 1';
        $pdo_param = [];
{% for col in cols %}
        if(isset($search['{{col['col_name_raw']}}'])){
            if (!is_array($search['{{col['col_name_raw']}}'])) {
                $sql .= ' and {{table_abbr}}.{{col['col_name_raw']}}=:{{col['col_name_raw']}}';
                $pdo_param[':{{col['col_name_raw']}}'] = $search['{{col['col_name_raw']}}'];
            }else if (count($search['{{col['col_name_raw']}}'])>0){
                $tempsql = SqlUtil::appenIn($search['{{col['col_name_raw']}}'],'{{col['col_name_raw']}}');
                $sql.=sprintf(' and {{table_abbr}}.{{col['col_name_raw']}} in (%s)',$tempsql[0]);
                $pdo_param = $pdo_param+$tempsql[1];
            }
        }
{% endfor %}
        if($orderby) {
            if ( $orderby == 'new' ) {
                $sql.=' order by {{table_abbr}}.{{cols[0]['col_name_raw']}} desc';
            }
        }
        $data = $this->select($sql,$pdo_param);
        $data = $this->format{{TableName}}($data);
        return $data;
    }
    /**
     * 通过{{cols[0]['col_name_raw']}}单条查询 Model
     * @param {{cols[0]['col_name_raw']}}
     */
    public function find{{TableName}}By{{cols[0]['Colname']}}(${{cols[0]['colname']}}){
        $sql = 'select * from {pre}{{table_raw}} where {{cols[0]['col_name_raw']}}=:{{cols[0]['col_name_raw']}}';
        $param[':{{cols[0]['col_name_raw']}}'] = ${{cols[0]['colname']}};
        $data = $this->find($sql,$param);
        $data = $this->format{{TableName}}([$data])[0];
        return $data;
    }
/**
     * 格式化数据
     * @param $rows
     * @return mixed
     */
    abstract function format{{TableName}}($rows);
}