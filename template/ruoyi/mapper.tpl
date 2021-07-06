<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.ruoyi.system.mapper.{{TableName}}Mapper">
    
    <resultMap type="{{TableName}}" id="{{TableName}}Result">
    {% for item in cols %}
        <result property="{{item['colName']}}"    column="{{item['col_name_raw']}}"    />
    {% endfor %}

    </resultMap>

    <sql id="select{{TableName}}Vo">
        select {% for item in cols %}{{table_abbr}}.{{item['col_name_raw']}} as {{item['colName']}}{{item['splitdot']}}    {% endfor %} from {{table}} {{table_abbr}}
    </sql>

    <select id="select{{TableName}}List" parameterType="{{TableName}}" resultType="com.ruoyi.system.domain.{{TableName}}">
        select {% for item in cols %}{{table_abbr}}.{{item['col_name_raw']}} as {{item['colName']}}{{item['splitdot']}}    {% endfor %} from {{table}} {{table_abbr}}        <where>
    {% for item in cols %}
            <if test="{{item['colName']}} != null  and {{item['colName']}} != ''"> and {{table_abbr}}.{{item['col_name_raw']}} = #{% raw %}{{% endraw %}{{item['colName']}}{% raw %}}{% endraw %}</if>
    {% endfor %}
        </where>
    </select>
    
    <select id="select{{TableName}}By{{cols[0]['ColName']}}" parameterType="java.lang.Long" resultType="com.ruoyi.system.domain.{{TableName}}">
        <include refid="select{{TableName}}Vo"/>
        where {{table_abbr}}.{{cols[0]['col_name_raw']}} = #{% raw %}{{% endraw %}{{cols[0]['colName']}}{% raw %}}{% endraw %}
    </select>
        
    <insert id="insert{{TableName}}" parameterType="{{TableName}}">
        insert into {{table_raw}}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            {% for item in cols %}
            <if test="{{item['colName']}} != null">{{item['col_name_raw']}},</if>
            {% endfor %}
         </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            {% for item in cols %}
            <if test="{{item['colName']}} != null">#{% raw %}{{% endraw %}{{item['colName']}}{% raw %}}{% endraw %},</if>{% endfor %}
         </trim>
    </insert>
    <!--批量添加{{table_des}}数据-->
    <insert id="insert{{TableName}}Batch" parameterType="java.util.ArrayList">
              insert into {{table_raw}}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            {% for item in cols %}
            {{item['col_name_raw']}},
            {% endfor %}
         </trim>values
    <foreach collection="list" item="item" index="index" separator=",">
    <trim prefix="(" suffix=")" suffixOverrides=",">
    {% for item in cols %}
          #{item.{{item['colName']}}{%raw%}}{%endraw%},
    {% endfor %}
   </trim>
    </foreach>
    </insert>
    <update id="update{{TableName}}" parameterType="{{TableName}}">
        update {{table}}
        <trim prefix="SET" suffixOverrides=",">
         {% for item in cols %}
            <if test="{{item['colName']}} != null">{{item['col_name_raw']}} = #{% raw %}{{% endraw %}{{item['colName']}}{% raw %}}{% endraw %},</if>
{% endfor %}
        </trim>
        where {{cols[0]['col_name_raw']}} = #{% raw %}{{% endraw %}{{cols[0]['colName']}}{% raw %}}{% endraw %}
    </update>

    <delete id="delete{{TableName}}By{{cols[0]['ColName']}}" parameterType="{{cols[0]['jtype']}}">
        delete from {{table}} where {{cols[0]['col_name_raw']}} = #{% raw %}{{% endraw %}{{cols[0]['colName']}}{% raw %}}{% endraw %}
    </delete>

    <delete id="delete{{TableName}}By{{cols[0]['ColName']}}s" parameterType="{{cols[0]['jtype']}}">
        delete from {{table}} where {{cols[0]['col_name_raw']}} in
        <foreach item="{{cols[0]['colName']}}" collection="array" open="(" separator="," close=")">
            #{% raw %}{{% endraw %}{{cols[0]['colName']}}{% raw %}}{% endraw %}
        </foreach>
    </delete>
</mapper>