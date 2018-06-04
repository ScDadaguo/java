package SQL;


import Entity.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Administrator on 2018/5/21.
 */
public class AdminDao extends SQLBean {
    public Admin login(Admin admin){
        String sql="Select *  From Admins where LoginId=? AND LoginPwd =?";
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,admin.getLoginId());
            pstmt.setString(2,admin.getLoginPwd());
            rs=pstmt.executeQuery();

           if (rs.next()){
                Admin ad =new Admin();
                ad.setLoginId(rs.getInt("LoginID"));
               ad.setLoginPwd(rs.getString("LoginPwd"));
                ad.setAdminName(rs.getString("adminName"));

                return ad;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return null;
    }
}
