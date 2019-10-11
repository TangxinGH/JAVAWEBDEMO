package example.service;

import org.aspectj.apache.bcel.generic.RET;

import java.sql.*;

public class login {

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
   int signinstatement=0;

    public  int sigin(String email,String password) {
        Connection conn = null;
        Statement stmt = null;
        try{
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行查询
            System.out.println(" 实例化Statement对象...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM userinfo where email='"+email+"';";
            ResultSet rs = stmt.executeQuery(sql);

            // 展开结果集数据库
            while(rs.next()){
                // 通过字段检索

                String user = rs.getString("email");
                String pwd = rs.getString("password");
                if(email.equals(user))
                    if(password.equals(pwd))signinstatement=1;
                    else signinstatement=3;
                    else  signinstatement=4;

                    // 输出数据

                System.out.print("站点名称: " + user);
                System.out.println(", 站点 URL: " + pwd);

            }
            // 完成后关闭
            rs.close();
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
        return signinstatement;
    }

}
