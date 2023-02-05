package svc

import (
	"SimpleIsPerfect/services/usercenter/cmd/api/internal/config"
	"SimpleIsPerfect/services/usercenter/cmd/rpc/pb"
	"SimpleIsPerfect/services/usercenter/cmd/rpc/usercenter"
	"SimpleIsPerfect/services/usercenter/model"

	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"github.com/zeromicro/go-zero/zrpc"
)

type ServiceContext struct {
	Config        config.Config
	UserRpcClient pb.UsercenterClient
	UserModel     model.UserModel
	UserAuthModel model.UserAuthModel
}

func NewServiceContext(c config.Config) *ServiceContext {
	sqlConn := sqlx.NewMysql(c.DB.DataSource)
	return &ServiceContext{
		Config:        c,
		UserRpcClient: usercenter.NewUsercenter(zrpc.MustNewClient(c.UserRpc)),
		UserModel:     model.NewUserModel(sqlConn, c.Cache),
		UserAuthModel: model.NewUserAuthModel(sqlConn, c.Cache),
	}
}
