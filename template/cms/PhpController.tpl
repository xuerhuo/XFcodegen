<?php
namespace Cms\Controller\{{model}};
use Cms\Controller\admin\AdminController;
use Cms\common\Auth;
use Cms\common\ErrorCode;
use Cms\Service\{{TableName}}Service;
use Cms\core\Controller;
use Cms\core\db;
use Cms\core\Request;
/**
* {{TableName}} {{table_des}}
* @author {{author}}
* @date {{year}}年{{month}}月{{day}}日 {{hour}}:{{minute}}:{{second}}
* @mail 824851582@qq.com
*/
class {{managecontrooler}}Controller extends AdminController
{
    public function __construct($data)
    {
        global $G;
        parent::__construct($data);
    }
/************************  {{table_des}} CONTROLLER CURD  *****************************/
/**
     * 添加{{table_des}}数据Controller
{% for col in cols %}{% if not loop.first %}
     * @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
     */
    /**
     * @OA\Post(
     *    tags={"{{model}}{{managecontrooler}}Controller"},
     *    path="/{{model}}/{{managecontrooler}}/add{{tablename}}_ajax_1",
     *    summary="添加[{{table_des}}]数据",
     *    @OA\RequestBody(
     *        @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
 {% for col in cols %}{% if not loop.first %}
     *                @OA\Property(
     *                    property="{{col['col_name_raw']}}",
     *                    type="{{col['openapi_type']}}",
     *                    description="{{col['comment']}}"
     *                ),{% endif %}{% endfor %}
     *            )
     *        )
     *    ),
     *     @OA\Response(response="200", description="返回结果",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                allOf={
     *                    @OA\Schema(ref="#/components/schemas/result"),
     *                    @OA\Schema(
     *                        @OA\Property(property="data",  type="object")
     *                    )
     *                }
     *            )
     *        )
     *    )
     *)
     */
    public function add{{tablename}}(Request $request, {{TableName}}Service $s_{{tableName}}){
        global  $G;
        $data = $request->getPost();
        $ret = $s_{{tableName}}->add{{TableName}}($data);
        return $ret;
    }
/**
    * 删除{{table_des}}数据Controller
    {% for col in cols %}{% if not loop.first %}
    * @param {{col['colname']}} {{col['comment']}}{% endif %}{% endfor %}
    */
    /**
    * @OA\Get(
    *    tags={"{{model}}{{managecontrooler}}Controller"},
    *    path="/{{model}}/{{managecontrooler}}/del{{tablename}}by{{cols[0]['colname']}}_ajax_1",
    *    summary="删除[{{table_des}}]数据",
    *    @OA\Parameter(
    *        name="{{cols[0]['col_name_raw']}}",
    *        in="query",
    *        required=true,
    *        description="{{cols[0]['comment']}}",
    *        @OA\Schema(
    *            type="{{cols[0]['openapi_type']}}",
    *        )
    *     ),
    *     @OA\Response(response="200", description="返回结果",
    *         @OA\MediaType(
    *             mediaType="application/json",
    *             @OA\Schema(
    *                allOf={
    *                    @OA\Schema(ref="#/components/schemas/result"),
    *                    @OA\Schema(
    *                        @OA\Property(property="data",  type="object")
    *                    )
    *                }
    *            )
    *        )
    *    )
    * )
    */
    public function del{{tablename}}by{{cols[0]['colname']}}(Request $request, {{TableName}}Service $s_{{tableName}}){
        global  $G;
        $data = $request->getGet();
        $ret = $s_{{tableName}}->del{{TableName}}By{{cols[0]['Colname']}}(['{{cols[0]['col_name_raw']}}'=>$data['{{cols[0]['col_name_raw']}}']]);
        return $ret;
    }
/**
     * 通过{{cols[0]['col_name_raw']}}修改{{table_des}} Model
     * 修改{{table_des}}数据
{% for col in cols %}
     * @param {{col['colname']}} {{col['comment']}}{% endfor %}
     */
    /**
    * @OA\Post(
    *    tags={"{{model}}{{managecontrooler}}Controller"},
    *    path="/{{model}}/{{managecontrooler}}/update{{tablename}}by{{cols[0]['colname']}}_ajax_1",
    *    summary="修改[{{table_des}}]数据",
    *    @OA\RequestBody(
    *        @OA\MediaType(
    *            mediaType="application/json",
    *            @OA\Schema(
    {% for col in cols %}{% if not loop.first %}
    *                @OA\Property(
    *                    property="{{col['col_name_raw']}}",
    *                    type="{{col['openapi_type']}}",
    *                    description="{{col['comment']}}"
    *                ), {% endif %}{% endfor %}
    *            )
    *        )
    *    ),
    *    @OA\Response(response="200", description="返回结果",
    *         @OA\MediaType(
    *             mediaType="application/json",
    *             @OA\Schema(
    *                allOf={
    *                    @OA\Schema(ref="#/components/schemas/result"),
    *                    @OA\Schema(
    *                        @OA\Property(property="data",  type="object")
    *                    )
    *                }
    *            )
    *        )
    *    )
    * )
    */
    public function update{{tablename}}by{{cols[0]['colname']}}(Request $request, {{TableName}}Service $s_{{tableName}}){
        global  $G;
        $data = $request->getPost();
        $ret = $s_{{tableName}}->update{{TableName}}By{{cols[0]['Colname']}}($data);
        return $ret;
    }
/**
     * 查询 Controller
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    /**
    * @OA\Get(
    *    tags={"{{model}}{{managecontrooler}}Controller"},
    *    path="/{{model}}/{{managecontrooler}}/query{{tablename}}_ajax_1",
    *    summary="分页查询[{{table_des}}]",
    *    @OA\Parameter(
    *        name="p",
    *        in="query",
    *        required=true,
    *        description="当前分页",
    *        @OA\Schema(
    *            type="integer",
    *        )
    *     ),
    *   @OA\Parameter(
    *        name="pagesize",
    *        in="query",
    *        required=true,
    *        description="当前分页大小",
    *        @OA\Schema(
    *            type="integer",
    *        )
    *     ),
{% for col in cols %}
    *    @OA\Parameter(
    *        name="{{col['col_name_raw']}}",
    *        in="query",
    *        description="{{col['comment']}}",
    *        @OA\Schema(
    *            type="{{col['openapi_type']}}"
    *        )
    *    ),{% endfor %}
    *    @OA\Response(response="200", description="返回结果",
    *        @OA\MediaType(
    *            mediaType="application/json",
    *            @OA\Schema(
    *                allOf={
    *                    @OA\Schema(ref="#/components/schemas/pageRsp"),
    *                    @OA\Schema(
    *                        @OA\Property(property="data",  type="object",
    *                            @OA\Property(property="result",  type="array",
    *                                @OA\Items(
{% for col in cols %}{% if not loop.first %}
    *                                    @OA\Property(
    *                                        property="{{col['col_name_raw']}}",
    *                                        type="{{col['openapi_type']}}",
    *                                        description="{{col['comment']}}"
    *                                    ),{% endif %}{% endfor %}
    *                                )
    *                            )
    *                        )
    *                    )
    *                }
    *            )
    *        )
    *    )
    * )
    */
    public function query{{tablename}}(Request $request, {{TableName}}Service $s_{{tableName}}){
        global  $G;
        $data = $request->getGet();
        $ret = $s_{{tableName}}->query{{TableName}}($data);
        return $ret;
    }
/**
     * 通过{{cols[0]['col_name_raw']}}单条查询 Model
     * @param {{cols[0]['col_name_raw']}}
     */
    /**
    * @OA\Get(
    *    tags={"{{model}}{{managecontrooler}}Controller"},
    *    path="/{{model}}/{{managecontrooler}}/find{{tablename}}by{{cols[0]['colname']}}_ajax_1",
    *    summary="查询[{{table_des}}]数据详情",
    *    @OA\Parameter(
    *        name="{{cols[0]['col_name_raw']}}",
    *        in="query",
    *        required=true,
    *        description="{{cols[0]['comment']}}",
    *        @OA\Schema(
    *            type="{{cols[0]['openapi_type']}}",
    *        )
    *     ),
    *     @OA\Response(response="200", description="返回结果",
    *        @OA\MediaType(
    *            mediaType="application/json",
    *            @OA\Schema(
    *                allOf={
    *                    @OA\Schema(ref="#/components/schemas/result"),
    *                    @OA\Schema(
    *                        @OA\Property(property="data",  type="object",
{% for col in cols %}{% if not loop.first %}
    *                            @OA\Property(
    *                                property="{{col['col_name_raw']}}",
    *                                type="{{col['openapi_type']}}",
    *                                description="{{col['comment']}}"
    *                            ),{% endif %}{% endfor %}
    *                        )
    *                    )
    *                }
    *            )
    *        )
    *    )
    *)
    */
    public function find{{tablename}}by{{cols[0]['colname']}}(Request $request, {{TableName}}Service $s_{{tableName}}){
        global  $G;
        $data = $request->getGet();
        $ret = $s_{{tableName}}->find{{TableName}}By{{cols[0]['Colname']}}($data);
        return $ret;
    }
/**
     * 查询所有[{{table_des}}]数据
     * @param {{cols[0]['col_name_raw']}}
     */
    /**
    * @OA\Get(
    *    tags={"{{model}}{{managecontrooler}}Controller"},
    *    path="/{{model}}/{{managecontrooler}}/query{{tablename}}all_ajax_1",
    *    summary="查询所有[{{table_des}}]数据详情",
{% for col in cols %}
    *    @OA\Parameter(
    *        name="{{col['col_name_raw']}}",
    *        in="query",
    *        description="{{col['comment']}}",
    *        @OA\Schema(
    *            type="{{col['openapi_type']}}"
    *        )
    *    ),{% endfor %}
    *     @OA\Response(response="200", description="返回结果",
    *        @OA\MediaType(
    *            mediaType="application/json",
    *            @OA\Schema(
    *                allOf={
    *                    @OA\Schema(ref="#/components/schemas/result"),
    *                    @OA\Schema(
    *                        @OA\Property(property="data",  type="array",
    *                            @OA\Items(
{% for col in cols %}
    *                                @OA\Property(
    *                                    property="{{col['col_name_raw']}}",
    *                                    type="{{col['openapi_type']}}",
    *                                    description="{{col['comment']}}"
    *                                ),{% endfor %}
    *                            )
    *                        )
    *                    )
    *                }
    *            )
    *        )
    *    )
    *)
    */
    public function query{{tablename}}all(Request $request, {{TableName}}Service $s_{{tableName}}){
        global  $G;
        $data = $request->getGet();
        $ret = $s_{{tableName}}->query{{TableName}}All($data);
        return $ret;
    }
/************************  {{table_des}} CONTROLLER CURD end *****************************/
}