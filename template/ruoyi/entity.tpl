package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * {{table_des}} {{table}}
 *
 * @author ruoyi
 */
@Data
@ApiModel(description= "{{table_des}}")
public class {{TableName}}
{
    private static final long serialVersionUID = 1L;

{% for item in cols %}
    @Excel(name = "{{item['comment']}}")
    @ApiModelProperty(value = "{{item['comment']}}")
    private {{item['jtype']}} {{item['colName']}};
{% endfor %}

}
