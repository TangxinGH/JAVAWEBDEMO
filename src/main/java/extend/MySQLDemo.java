package extend;

import java.sql.*;

class MySQLDemo {

    // MySQL 8.0 以下版本 - JDBC 驱动名及数据库 URL
//    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
//    static final String DB_URL = "jdbc:mysql://localhost:3306/user";
//版本区分，重要!!!!,user是数据库名
//     MySQL 8.0 以上版本 - JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/user?useSSL=false&serverTimezone=UTC";
    int result;

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "tangxin";
    static final String PASS = "123456";

    int mai(String sql) {
        Connection conn = null;
        Statement stmt = null;
        try{
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);
            //注意驱动版本
            // 打开链接
            System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);


            System.out.println(" 实例化Statement对象...");
            stmt = conn.createStatement();

            PreparedStatement preStmt=conn.prepareStatement(sql);
//            preStmt.setString(1, "12@");
//            preStmt.setString(2, "char");
//            preStmt.setString(3, "lastname123");
//            preStmt.setString(3, "123456");

            result= preStmt.executeUpdate();


            preStmt.close();
            stmt.close();
            conn.close();



        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
        System.out.println("Goodbye!");
        return result;
    }
    int checkEmail(String sql ,String registerEmail) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Statement stmt = null;
        int tr=1;
        // 注册 JDBC 驱动
        Class.forName(JDBC_DRIVER);
        //注意驱动版本
        // 打开链接
        System.out.println("连接数据库...");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);


        System.out.println(" 实例化Statement对象...");
        stmt = conn.createStatement();



        ResultSet rs= stmt.executeQuery(sql);
        while(rs.next()) {
            // 通过字段检索

            String email = rs.getString("email");
//          System.out.println(email);
            if(registerEmail.equals(email))tr=0;
        }

        //关闭流
        rs.close();
        stmt.close();
        conn.close();


        return tr;
    }
}
