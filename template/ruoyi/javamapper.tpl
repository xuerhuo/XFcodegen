package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.{{TableName}};

/**
 * {{table_des}} 数据层
 *
 * @author ruoyi
 */
public interface {{TableName}}Mapper
{
   /**
     * 查询{{table_des}}
     *
     * @param {{cols[0]['colName']}} {{table_des}}ID
     * @return {{table_des}}
     */
    public {{TableName}} select{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['jtype']}} {{cols[0]['colName']}});

    /**
     * 查询{{table_des}}列表
     *
     * @param {{tableName}} {{table_des}}
     * @return {{table_des}}集合
     */
    public List<{{TableName}}> select{{TableName}}List({{TableName}} {{tableName}});

    /**
     * 新增{{table_des}}
     *
     * @param {{tableName}} {{table_des}}
     * @return 结果
     */
    public int insert{{TableName}}({{TableName}} {{tableName}});

    /**
     * 批量新增{{table_des}}
     *
     * @param {{tableName}}List {{table_des}}
     * @return 结果
     */
    public int insert{{TableName}}Batch(List<{{TableName}}> {{tableName}}List);

    /**
     * 修改{{table_des}}
     *
     * @param {{tableName}} {{table_des}}
     * @return 结果
     */
    public int update{{TableName}}({{TableName}} {{tableName}});

    /**
     * 删除{{table_des}}
     *
     * @param {{cols[0]['colName']}} {{table_des}}ID
     * @return 结果
     */
    public int delete{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['jtype']}} {{cols[0]['colName']}});

    /**
     * 批量删除{{table_des}}
     *
     * @param {{cols[0]['colName']}}s 需要删除的数据ID
     * @return 结果
     */
    public int delete{{TableName}}By{{cols[0]['ColName']}}s({{cols[0]['jtype']}}[] {{cols[0]['colName']}}s);
}
