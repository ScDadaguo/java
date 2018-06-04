package Entity;

/**
 * Created by Administrator on 2018/5/21.
 */
public class Admin {
    private  int LoginId;
    private  String AdminName;
    private String LoginPwd;

    public void setLoginId(int loginId) {
        LoginId = loginId;
    }

    public void setAdminName(String adminName) {
        AdminName = adminName;
    }

    public void setLoginPwd(String loginPwd) {
        LoginPwd = loginPwd;
    }

    public int getLoginId() {
        return LoginId;
    }

    public String getAdminName() {
        return AdminName;
    }

    public String getLoginPwd() {
        return LoginPwd;
    }
}
