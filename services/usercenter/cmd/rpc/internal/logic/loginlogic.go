package logic

import (
	"context"
	"fmt"

	"SimpleIsPerfect/services/usercenter/cmd/rpc/internal/svc"
	"SimpleIsPerfect/services/usercenter/cmd/rpc/pb"

	"github.com/zeromicro/go-zero/core/logx"
)

type LoginLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
	logx.Logger
}

func NewLoginLogic(ctx context.Context, svcCtx *svc.ServiceContext) *LoginLogic {
	return &LoginLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
		Logger: logx.WithContext(ctx),
	}
}

func (l *LoginLogic) Login(in *pb.LoginReq) (*pb.LoginResp, error) {

	fmt.Println("testaaaa")
	return &pb.LoginResp{}, nil
}
