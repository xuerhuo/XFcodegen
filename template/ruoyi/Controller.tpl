package com.ruoyi.web.controller.{{module}};

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.{{TableName}};
import com.ruoyi.system.service.I{{TableName}}Service;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
/**
 * {{table_des}}Controller
 * 
 * @author ruoyi
 */
@Api(tags = "{{table_des}}管理")
@RestController
@RequestMapping("/{{module}}/{{tableName}}")
public class {{TableName}}Controller extends BaseController
{
    @Autowired
    private I{{TableName}}Service {{tableName}}Service;

    /**
     * 查询{{table_des}}列表
     */

    @ApiOperation(value = "创建 {{table_des}}")
    @PreAuthorize("@ss.hasPermi('{{module}}:{{tableName}}:list')")
    @GetMapping("/list")
    public TableDataInfo list({{TableName}} {{tableName}})
    {
        startPage();
        List<{{TableName}}> list = {{tableName}}Service.select{{TableName}}List({{tableName}});
        return getDataTable(list);
    }

    /**
     * 导出{{table_des}}列表
     */
    @ApiOperation(value = "导出 {{table_des}}")
    @PreAuthorize("@ss.hasPermi('{{module}}:{{tableName}}:export')")
    @Log(title = "{{table_des}}", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export({{TableName}} {{tableName}})
    {
        List<{{TableName}}> list = {{tableName}}Service.select{{TableName}}List({{tableName}});
        ExcelUtil<{{TableName}}> util = new ExcelUtil<{{TableName}}>({{TableName}}.class);
        return util.exportExcel(list, "{{table_des}}数据");
    }

    /**
     * 获取{{table_des}}详细信息
     */
    @ApiOperation(value = "查询详情 {{table_des}}")
    @PreAuthorize("@ss.hasPermi('{{module}}:{{tableName}}:query')")
    @GetMapping(value = "/{%raw%}{{%endraw%}{{cols[0]['colName']}}{%raw%}}{%endraw%}")
    public AjaxResult getInfo(@PathVariable("{{cols[0]['colName']}}") {{cols[0]['jtype']}} {{cols[0]['colName']}})
    {
        return AjaxResult.success({{tableName}}Service.select{{TableName}}By{{cols[0]['ColName']}}({{cols[0]['colName']}}));
    }

    /**
     * 新增{{table_des}}
     */
    @ApiOperation(value = "新增 {{table_des}}")
    @PreAuthorize("@ss.hasPermi('{{module}}:{{tableName}}:add')")
    @Log(title = "新增{{table_des}}", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody {{TableName}} {{tableName}})
    {
        return toAjax({{tableName}}Service.insert{{TableName}}({{tableName}}));
    }

    /**
     * 修改{{table_des}}
     */
    @ApiOperation(value = "修改 {{table_des}}")
    @PreAuthorize("@ss.hasPermi('{{module}}:{{tableName}}:edit')")
    @Log(title = "{{table_des}}", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody {{TableName}} {{tableName}})
    {
        return toAjax({{tableName}}Service.update{{TableName}}({{tableName}}));
    }

    /**
     * 删除{{table_des}}
     */
    @ApiOperation(value = "删除 {{table_des}}")
    @PreAuthorize("@ss.hasPermi('{{module}}:{{tableName}}:remove')")
    @Log(title = "{{table_des}}", businessType = BusinessType.DELETE)
	@DeleteMapping("/{%raw%}{{%endraw%}{{cols[0]['colName']}}s}")
    public AjaxResult remove(@PathVariable {{cols[0]['jtype']}}[] {{cols[0]['colName']}}s)
    {
        return toAjax({{tableName}}Service.delete{{TableName}}By{{cols[0]['ColName']}}s({{cols[0]['colName']}}s));
    }
}
