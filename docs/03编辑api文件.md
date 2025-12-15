# 03 Go-Zero API 文件编辑过程与逻辑

我们采用 Go-Zero 的 **`import` 策略**，将核心系统模块（`system`）拆分为主入口文件和子模块文件，确保结构与 YUDAO 的模块层次一致。这种分层设计对于孩子们理解 **关注点分离（Separation of Concerns）** 非常重要：一个文件作为整体的壳壳，另一个文件处理具体的用户业务。

## 目标与策略

  * **目标：** 根据 YUDAO `UserController.java` 的功能，定义 Go-Zero API 接口，实现用户登录和用户管理（CRUD）。
  * **策略：** **分层和授权分离。**
    1.  **`system.api` (主文件)：** 负责定义通用数据结构和外部整体壳壳。
    2.  **`system/user.api` (子文件)：** 负责定义**用户相关**的用户管理接口。

-----

## 文件 1：用户子模块 API 定义

**路径：** `system/user.api`

这个文件专注于用户（User）的 CRUD 操作。这些操作都涉及敏感数据，因此需要 JWT 认证。

**逻辑分析：**

1.  **类型定义 (Types)：** 针对用户查询、创建、更新、删除等操作定义精确的请求 (Req) 和响应 (Resp) 结构体。
2.  **服务定义 (`@server`)：**
      * `jwt: auth`: **强制开启 JWT 认证**。这确保了只有携带有效 Token 的请求才能访问这些路由。
      * `group: system/user`: 设置路由前缀，最终路由会是 `/system/user/xxx`，保持模块化清晰。

**代码内容：**

```go-zero-api
// --------------------------------------------------
// User 模块 API
// --------------------------------------------------
type (
    // 1. 分页查询请求参数 (GET /page)
    UserPageReq {
        PageNo   int64 `form:"pageNo"` // 当前页码
        PageSize int64 `form:"pageSize"` // 每页条数
        Username string `form:"username,optional"` // 用户名搜索
        Nickname string `form:"nickname,optional"` // 昵称搜索
    }

    // 2. 分页查询响应结构 (继承 BaseResp)
    UserPageResp {
        BaseResp
        Data struct {
            Total int64 `json:"total"` // 总条数
            List  []UserResp `json:"list"` // 用户列表
        } `json:"data"`
    }
    
    // 3. 创建用户请求 (POST /)
    UserCreateReq {
        Username    string `json:"username"`
        Password    string `json:"password"`
        Nickname    string `json:"nickname"`
        PhoneNumber string `json:"phoneNumber,optional"`
        Email       string `json:"email,optional"`
        RoleIds     []int64 `json:"roleIds"` // 分配的角色 ID 列表
    }

    // 4. 更新用户请求 (PUT /:id)
    UserUpdateReq {
        Id           int64  `path:"id"` // URL 路径中的用户 ID
        Nickname     string `json:"nickname"`
        PhoneNumber  string `json:"phoneNumber,optional"`
        Email        string `json:"email,optional"`
        Status       int32  `json:"status"` // 状态：0 正常 / 1 禁用
        RoleIds      []int64 `json:"roleIds"`
    }
)

// User Management Handlers (需要 JWT 认证)
@server(
    jwt: auth // 启用 JWT 认证
    group: system/user // 路由组前缀：/system/user
)
service user-api {
    // 获取用户分页列表 (GET /system/user/page)
    @doc "获取用户分页列表"
    @handler getUserPage
    get /page (UserPageReq) returns (UserPageResp)

    // 创建新用户 (POST /system/user)
    @doc "创建新用户"
    @handler createUser
    post / (UserCreateReq) returns (BaseResp)

    // 更新用户信息 (PUT /system/user/{id})
    @doc "更新用户信息"
    @handler updateUser
    put /:id (UserUpdateReq) returns (BaseResp)

    // 删除用户 (DELETE /system/user/{id})
    @doc "删除用户"
    @handler deleteUser
    delete /:id (UserUpdateReq) returns (BaseResp)
}
```

-----

## 文件 2：系统模块主 API 定义

**路径：** `system.api`

这个文件是整个 `system` 模块的入口，负责定义全局结构和核心的登录流程。

**逻辑分析：**

1.  **共享类型 (`type`)：** 定义了所有模块都需要的 `BaseResp` 和 `UserResp`，避免重复定义。
2.  **登录接口 (`/auth/login`)：** 使用 `@server(group: auth)`，但**没有** `jwt: auth` 属性，因为这是获取 Token 的起点。
3.  **`import "system/user.api"`：** 这是模块化的关键。它告诉 `goctl` 工具，将 `user.api` 中定义的路由和逻辑都整合到 `system-api` 服务中，但保持其原有的分组和认证设置。

**代码内容：**

```go-zero-api
syntax = "v1"

info(
    title: "System Module API"
    desc: "系统模块接口，包括认证和用户管理"
    author: "Gemini"
    email: "gemini@google.com"
)

// ==================================================
// 共享类型定义 (供所有模块使用)
// ==================================================
type (
    // 通用基础响应结构：用于统一返回码和消息
    BaseResp {
        Code int `json:"code"`
        Msg  string `json:"msg"`
    }

    // 用户详细信息响应结构
    UserResp {
        Id           int64  `json:"id"`
        Username     string `json:"username"`
        Nickname     string `json:"nickname"`
        Email        string `json:"email"`
        PhoneNumber  string `json:"phoneNumber"`
        Status       int32  `json:"status"`
        CreateTime   string `json:"createTime"`
    }
)

// ==================================================
// 1. 需要认证的接口：系统基础信息 (GET /system/user/get_login_user_info)
// ==================================================
@server(
    jwt: auth // JWT 配置，名字必须与 Go-Zero 配置文件的 Auth 定义一致
    group: system
)
service system-api {
    // 获取当前登录用户的信息
    @doc "获取当前登录用户的信息"
    @handler getUserInfo
    get /user/get_login_user_info returns (UserResp)
}

// ==================================================
// 2. 无需认证的接口：登录 (POST /auth/login)
// ==================================================
type (
    // 登录请求
    LoginReq {
        Username string `json:"username"`
        Password string `json:"password"`
    }

    // 登录响应 (返回 Token 信息)
    LoginResp {
        BaseResp
        Data struct {
            AccessToken  string `json:"accessToken"`
            RefreshToken string `json:"refreshToken"`
            ExpiresTime  int64  `json:"expiresTime"`
        } `json:"data"`
    }
)

@server(
    group: auth // 路由组前缀：/auth
)
service system-api {
    // 登录接口
    @doc "用户登录认证"
    @handler login
    post /login (LoginReq) returns (LoginResp)
}

// ==================================================
// 3. 导入 User 模块 API
// ==================================================
// 导入 user.api，它将继承 system-api 中定义的 JWT:auth 和共享类型
import "system/user.api"
```

### 总结与下一步

这两个文件一起，就完成了整个 Go-Zero API 服务的骨架定义，实现了路由的分组和认证的隔离。您现在可以使用 `goctl` 工具生成代码，开始实现业务逻辑了。