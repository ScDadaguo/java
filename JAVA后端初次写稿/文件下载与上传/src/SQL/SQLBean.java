package SQL;

import java.sql.*;
import java.util.List;

/**
 * Created by Administrator on 2018/5/14.
 */
public class SQLBean {
    String DRIVER_CLASS = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    String DATABASE_URL = "jdbc:sqlserver://localhost:1433;DatabaseName=upload";

    String USERNAME = "sa";

    String PASSWORD = "123456";

    Connection conn = null;

    public Connection getConnection(){
        try{
            Class.forName(DRIVER_CLASS);
            conn = DriverManager.getConnection(DATABASE_URL,USERNAME,PASSWORD);
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }

    public void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs){
        try{
            if (conn != null){
                conn.close();
            }
            if (pstmt != null){
                pstmt.close();
            }
            if (rs != null){
                rs.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int executeUpdate(String sql, List<Object> paramValues){
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        int rows = 0;
        try{
            pstmt = conn.prepareStatement(sql);
            if (paramValues != null && paramValues.size() > 0){
                setValues(pstmt, paramValues);
            }
            rows = pstmt.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,null);
        }
        return rows;
    }

    private void setValues(PreparedStatement pstmt, List<Object> paramValues)
        throws SQLException {
            for (int i = 0; i < paramValues.size(); i++) {
                pstmt.setObject(1 + i,paramValues.get(i));
            }
        }

}

