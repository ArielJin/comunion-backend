package account

import (
	"ceres/pkg/initialization/mysql"
	model "ceres/pkg/model/account"
)

// manage the account informations link and unlink

// GetComerAccounts get current comer accounts
func GetComerAccounts(comerID uint64) (response *model.ComerOuterAccountListResponse, err error) {
	accounts, err := model.ListAccount(mysql.DB, comerID)
	if err != nil {
		return
	}
	response = &model.ComerOuterAccountListResponse{
		List:  accounts,
		Total: uint64(len(accounts)),
	}
	return
}

// UnlinkComerAccount  unlink the comer account
func UnlinkComerAccount(comerID, accountID uint64) (err error) {
	return model.DeleteAccount(mysql.DB, comerID, accountID)
}

// CheckComerExists check if the comer is exists with this outer account
func CheckComerExists(oin string) (exists bool, err error) {
	//comer, err := model.GetAccountByOIN(mysql.DB, oin)
	//if err != nil {
	//	exists = false
	//}
	//if comer.ID == 0 {
	//	exists = false
	//}
	return
}
