package com.ruoyi.system.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.{{TableName}};

/**
 * {{table_des}}Service业务层处理
 * 
 * @author ruoyi
 */
public interface I{{TableName}}Service
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
     * @return {{table_des}}
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
     * 修改{{table_des}}
     * 
     * @param {{tableName}} {{table_des}}
     * @return 结果
     */
    public int update{{TableName}}({{TableName}} {{tableName}});

    /**
     * 批量删除{{table_des}}
     * 
     * @param {{cols[0]['colName']}}s 需要删除的{{table_des}}ID
     * @return 结果
     */
    public int delete{{TableName}}By{{cols[0]['ColName']}}s({{cols[0]['jtype']}}[] {{cols[0]['colName']}}s);

    /**
     * 删除{{table_des}}信息
     * 
     * @param {{cols[0]['colName']}} {{table_des}}ID
     * @return 结果
     */
    public int delete{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['jtype']}} {{cols[0]['colName']}});
}
