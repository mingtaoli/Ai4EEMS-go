### 无需登录的路由
| HTTP 方法 | 路由路径 | 功能描述 | 请求结构体 | 响应结构体 |
| --- | --- | --- | --- | --- |
| POST | `/usercenter/v1/user/register` | 用户注册 | `RegisterReq` | `RegisterResp` |
| POST | `/usercenter/v1/user/login` | 用户登录 | `LoginReq` | `LoginResp` |
| GET | `/usercenter/v1/user/oauth/authorize` | OAuth2 授权 | `OAuthAuthorizeReq` | `OAuthAuthorizeResp` |
| POST | `/usercenter/v1/user/oauth/token` | 获取 OAuth2 令牌 | `OAuthTokenReq` | `OAuthTokenResp` |

### 需要登录的路由
| HTTP 方法 | 路由路径 | 功能描述 | 请求结构体 | 响应结构体 |
| --- | --- | --- | --- | --- |
| POST | `/usercenter/v1/user/detail` | 获取用户信息 | `UserInfoReq` | `UserInfoResp` | 