package user

import (
	"context"
	"fmt"

	"SimpleIsPerfect/services/usercenter/cmd/api/internal/svc"
	"SimpleIsPerfect/services/usercenter/cmd/api/internal/types"
	"SimpleIsPerfect/services/usercenter/cmd/rpc/usercenter"
	"SimpleIsPerfect/services/usercenter/model"

	"github.com/zeromicro/go-zero/core/logx"
)

type LoginLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewLoginLogic(ctx context.Context, svcCtx *svc.ServiceContext) *LoginLogic {
	return &LoginLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *LoginLogic) Login(req *types.LoginReq) (resp *types.LoginResp, err error) {

	LoginResp, err := l.svcCtx.UserRpcClient.Login(l.ctx, &usercenter.LoginReq{
		AuthKey:  "aaa",
		AuthType: "bbb",
		Password: "ccc",
	})
	if err != nil {
		return nil, err
	}

	fmt.Println("======", LoginResp)

	user := new(model.User)
	user.Mobile = "12345"
	user.Name = "gsh"
	user.Uuid = "asdfasd"
	user.Email = "g@qq.com"
	user.Nickname = "dasd"
	email, err := l.svcCtx.UserModel.FindOneByEmail(l.ctx, "g@qq.com")
	fmt.Println(email)
	//_, err = l.svcCtx.UserModel.Insert(l.ctx, user)
	//if err != nil {
	//	return nil, err
	//}

	return
}
