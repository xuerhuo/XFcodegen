<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
    {% for col in cols%}
      <el-form-item label="{{col['comment']}}" prop="{{col['colName']}}">
        <el-input
          v-model="queryParams.{{col['colName']}}"
          placeholder="请输入{{col['comment']}}"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>{%endfor%}
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['{{module}}:{{tableName}}:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['{{module}}:{{tableName}}:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['{{module}}:{{tableName}}:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['{{module}}:{{tableName}}:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" @selection-change="handleSelectionChange">

      <el-table-column type="selection" width="55" align="center" />
    {% for item in cols%}
    {% if item['jtype']=='Date'%}
              <el-table-column label="{{item['comment']}}" align="center" prop="{{item['colName']}}" >
            <template slot-scope="scope">
              <span>{%raw%}{{{%endraw%} parseTime(scope.row.{{item['colName']}}) {%raw%}}}{%endraw%}</span>
            </template>
          </el-table-column>
          {%else%}
          <el-table-column label="{{item['comment']}}" align="center" prop="{{item['colName']}}" />
          {%endif%}
      {%endfor%}
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['{{module}}:{{tableName}}:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['{{module}}:{{tableName}}:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改{{table_des}}对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      {% for item in cols%}
      {%if item['col_name_raw'] not in ['create_time','update_time']%}
         <el-form-item label="{{item['comment']}}" prop="{{item['colName']}}">
          <el-input v-model="form.{{item['colName']}}" placeholder="请输入{{item['comment']}}" />
        </el-form-item>
        {%endif%}
      {%endfor%}
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { list{{TableName}}, get{{TableName}}, del{{TableName}}, add{{TableName}}, update{{TableName}}, export{{TableName}} } from "@/api/{{module}}/{{TableName}}.js";

export default {
  name: "{{TableName}}",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // {{table_des}}表格数据
      dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        {{cols[0]['colName']}}: null,
        nickname: null,
        username: null,
        status: null,
        rawData: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询{{table_des}}列表 */
    getList() {
      this.loading = true;
      list{{TableName}}(this.queryParams).then(response => {
        this.dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        {{cols[0]['colName']}}: null,
        {{cols[0]['colName']}}: null,
        nickname: null,
        username: null,
        status: 0,
        createTime: null,
        updateTime: null,
        rawData: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.{{cols[0]['colName']}})
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加{{table_des}}";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const {{cols[0]['colName']}} = row.{{cols[0]['colName']}} || this.ids
      get{{TableName}}({{cols[0]['colName']}}).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改{{table_des}}";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.{{cols[0]['colName']}} != null) {
            update{{TableName}}(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            add{{TableName}}(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const {{cols[0]['colName']}}s = row.{{cols[0]['colName']}} || this.ids;
      this.$confirm('是否确认删除{{table_des}}编号为"' + {{cols[0]['colName']}}s + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return del{{TableName}}({{cols[0]['colName']}}s);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有{{table_des}}数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return export{{TableName}}(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
