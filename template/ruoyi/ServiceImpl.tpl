package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.{{TableName}}Mapper;
import com.ruoyi.system.domain.{{TableName}};
import com.ruoyi.system.service.I{{TableName}}Service;
import com.ruoyi.common.utils.SecurityUtils;


/**
 * {{table_des}}Service业务层处理
 * 
 * @author ruoyi
 */
@Service
public class {{TableName}}ServiceImpl implements I{{TableName}}Service 
{
    @Autowired
    private {{TableName}}Mapper {{tableName}}Mapper;

    /**
     * 查询{{table_des}}
     * 
     * @param {{cols[0]['colName']}} {{table_des}}ID
     * @return {{table_des}}
     */
    @Override
    public {{TableName}} select{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['jtype']}} {{cols[0]['colName']}})
    {
        return {{tableName}}Mapper.select{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['colName']}});
    }

    /**
     * 查询{{table_des}}列表
     * 
     * @param {{tableName}} {{table_des}}
     * @return {{table_des}}
     */
    @Override
    public List<{{TableName}}> select{{TableName}}List({{TableName}} {{tableName}})
    {
        return {{tableName}}Mapper.select{{TableName}}List({{tableName}});
    }

    /**
     * 新增{{table_des}}
     * 
     * @param {{tableName}} {{table_des}}
     * @return 结果
     */
    @Override
    public int insert{{TableName}}({{TableName}} {{tableName}})
    {
        Long uid = SecurityUtils.getLoginUser().getUser().getUserId();

        {{tableName}}.setCreateTime(DateUtils.getUnixTimstamp());
        {{tableName}}.set{{cols[0]['ColName']}}(SequenceUtil.getSeqId());
        {{tableName}}.setCreateMan(uid);
        return {{tableName}}Mapper.insert{{TableName}}({{tableName}});
    }

    /**
     * 修改{{table_des}}
     * 
     * @param {{tableName}} {{table_des}}
     * @return 结果
     */
    @Override
    public int update{{TableName}}({{TableName}} {{tableName}})
    {
        {{tableName}}.setUpdateTime(DateUtils.getUnixTimstamp());
        return {{tableName}}Mapper.update{{TableName}}({{tableName}});
    }

    /**
     * 批量删除{{table_des}}
     * 
     * @param {{cols[0]['colName']}}s 需要删除的{{table_des}}ID
     * @return 结果
     */
    @Override
    public int delete{{TableName}}By{{cols[0]['ColName']}}s({{cols[0]['jtype']}}[] {{cols[0]['colName']}}s)
    {
        return {{tableName}}Mapper.delete{{TableName}}By{{cols[0]['ColName']}}s({{cols[0]['colName']}}s);
    }

    /**
     * 删除{{table_des}}信息
     * 
     * @param {{cols[0]['colName']}} {{table_des}}ID
     * @return 结果
     */
    @Override
    public int delete{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['jtype']}} {{cols[0]['colName']}})
    {
        return {{tableName}}Mapper.delete{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['colName']}});
    }
}
