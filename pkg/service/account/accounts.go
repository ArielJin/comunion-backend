package account

import (
	"ceres/pkg/initialization/mysql"
	model "ceres/pkg/model/account"

	"github.com/jinzhu/gorm"
)

// manage the account informations link and unlink

// GetComerAccounts get current comer accounts
func GetComerAccounts(uin uint64) (response *model.ComerOuterAccountListResponse, err error) {
	//accounts, err := model.ListAllAccountsOfComer(mysql.DB, uin)
	//if err != nil {
	//	return
	//}
	//response = &model.ComerOuterAccountListResponse{
	//	List:  []model.ComerOuterAccountObject{},
	//	Total: 0,
	//}
	//for _, account := range accounts {
	//	response.List = append(response.List, model.ComerOuterAccountObject{
	//		Identifier: account.Identifier,
	//		UIN:        account.UIN,
	//		OIN:        account.OIN,
	//		Nick:       account.Nick,
	//		Avatar:     account.Avatar,
	//		IsMain:     account.IsMain,
	//		IsLinked:   account.IsLinked,
	//		Type:       account.Type,
	//	})
	//}
	return
}

// UnlinkComerAccount  unlink the comer account
func UnlinkComerAccount(uin, identifier uint64) (err error) {
	err = mysql.DB.Transaction(func(tx *gorm.DB) error {
		account, err := model.GetAccountByIdentifier(tx, identifier)
		if err != nil {
			return err
		}
		err = model.UnlinkComerAccount(tx, &account)
		if err != nil {
			return err
		}
		return nil
	})
	return
}

// CheckComerExists check if the comer is exists with this outer account
func CheckComerExists(oin string) (exists bool, err error) {
	comer, err := model.GetAccountByOIN(mysql.DB, oin)
	if err != nil {
		exists = false
	}
	if comer.ID == 0 {
		exists = false
	}
	return
}
