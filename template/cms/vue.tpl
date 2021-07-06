<div id="app">
    <el-card>
        <el-row>
            <el-col span="24">
                <el-form :inline="true">
                    <el-form-item>
                        <el-input v-model="search.search" placeholder="搜索"></el-input>
                    </el-form-item>

                    <el-form-item>
                        <el-button type="primary" @click="load_data">查询</el-button>
                    </el-form-item>

                </el-form>
            </el-col>
        </el-row>
        <el-row>
            <el-col span="24">
                <el-button type="primary" @click="row={},show_form=true,row.{{cols[0]['col_name_raw']}}=0">新增</el-button>
            </el-col>
        </el-row>
    </el-card>
    <el-table
            :data="tableData"
            border
            style="width: 100%">
{% for col in cols %}
         <el-table-column
                prop="{{col['col_name_raw']}}"
                label="{{col['comment']}}"
          >
        </el-table-column>{% endfor %}


        <el-table-column
                label="管理"
                width="180"
        >
            <template scope="scope">
            <el-button type="danger" @click="del(scope.row)">删除</el-button>
            <el-button type="info" @click="row=scope.row,show_form=true">修改</el-button>
            </template>
        </el-table-column>
    </el-table>

    <el-pagination
            background
            @current-change="handleCurrentChange"
            :current-page="pagenow"
            layout="total, prev, pager, next, jumper"
            :total="pagecount"
            :page-size="pagesize">
    </el-pagination>


    <el-dialog
            title="增加"
            :visible.sync="show_form"
            v-if="show_form"
            :modal="false"
            height="100%"
            fullscreen="true"
            close-on-click-modal="false"
            lock-scroll="true"
            class="eldialog"
            width="100%"
    >
        <el-form>{% for col in cols %}
            <el-form-item label="{{col['comment']}}">
                <el-input v-model="row.{{col['col_name_raw']}}" placeholder="{{col['comment']}}"></el-input>
            </el-form-item>{% endfor %}
            <el-form-item label="">
                <el-button type="primary" @click="save">保存</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>

</div>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                tableData: [],
                rows: [],
                pagesize: 10,
                pagenow: 1,
                pagecount: 0,
                row: {},
                show_form: false,
                search:{}
            }
        },
        async mounted() {
            this.load_data()


        },
        computed: {},
        methods: {
            getData(url, data = {}, method = 'post') {
                axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'
                FULL_URL = root + url
                return new Promise((resolve, reject) => {
                    if (method === 'GET' || method === 'get') {
                        axios.get(FULL_URL, {
                            params: data
                        })
                            .then((response) => {
                                // console.log(response.data)
                                if (response.data.status != true) {
                                    this.$alert('message', {
                                        title: '提示',
                                        message: response.data.msg,
                                        type: 'warning',
                                        center: true,
                                        confirmButtonText: '我知道了'
                                    });
                                }
                                resolve(response.data)

                            })
                            .catch(function (error) {
                                reject(error)
                            })
                    } else {
                        const formData = new FormData()
                        Object.keys(data).forEach(key => formData.append(key, data[key]))
                        axios.post(FULL_URL, formData)
                            .then((response) => {
                                if (response.data.status != true) {
                                    this.$alert('message', {
                                        title: '提示',
                                        message: response.data.warn,
                                        type: 'warning',
                                        center: true,
                                        confirmButtonText: '我知道了'
                                    });
                                }
                                // console.log(response.data)
                                resolve(response.data)
                            })
                            .catch(function (error) {
                                reject(error)
                            })
                    }
                })
            },
            load_data() {
                var that = this
                var dat = this.search
                dat.pagesize = this.pagesize
                dat.p = this.pagenow
                dat.orderby='new'
                this.getData('default.php/{{model}}/{{managecontrooler}}/query{{tablename}}',dat,'get').then(r => {
                    if(r.data){
                        this.tableData = r.data.result;
                        that.pagecount = parseInt(r.data.page.count)
                        that.pagesize = parseInt(r.data.page.pagesize)
                    }else{
                        this.tableData =[]
                    }

                })
            },
            save() {
                if (!this.row.{{cols[0]['col_name_raw']}}) {
                    this.getData('default.php/{{model}}/{{managecontrooler}}/add{{tablename}}', this.row, 'post').then(res => {
                        if (res.status == false) {
                            this.$message({
                                message: res.msg,
                                type: 'error'
                            });
                        } else {
                            this.show_form = !this.show_form;
                            this.load_data();
                        }
                    })
                } else {
                    this.getData('default.php/{{model}}/{{managecontrooler}}/update{{tablename}}by{{cols[0]['colname']}}', this.row, 'post').then(res => {
                        if (res.status == false) {
                            this.$message({
                                message: res.msg,
                                type: 'error'
                            });
                        }
                        this.show_form = !this.show_form;
                        // this.load_data();
                    })

                }
            },
            del(dat){

                this.$confirm('此操作将永久删除, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {


                    if(dat.{{cols[0]['col_name_raw']}}){
                        this.getData('default.php/{{model}}/{{managecontrooler}}/del{{tablename}}by{{cols[0]['colname']}}',{%raw%}{{%endraw%}{{cols[0]['col_name_raw']}}:dat.{{cols[0]['col_name_raw']}}{%raw%}}{%endraw%}, 'get').then(res=>{
                            if(res.status==false){
                                this.$message({
                                    message: res.msg,
                                    type: 'error'
                                });
                            }else{
                                this.$message({
                                    type: 'success',
                                    message: '删除成功!'
                                });
                            }
                            this.load_data();
                        })
                    }



                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });


            },
            handleCurrentChange(page){
                this.pagenow = page;
                // this.pagenow++;
                this.load_data();
            },

        }
    })
</script>
<style>
    input::-webkit-input-placeholder {
        color: #ccc;
    }

    textarea::-webkit-input-placeholder {
        color: #ccc;
    }
    .eldialog .el-dialog{
        height: 100%;
        margin-top: 4vh !important;
    }

</style>