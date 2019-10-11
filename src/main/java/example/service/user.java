package example.service;

import com.alibaba.fastjson.JSONObject;
import com.mysql.cj.x.protobuf.MysqlxCrud;
import org.springframework.test.context.jdbc.Sql;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class user extends HttpServlet {

    @Size (min=3, max=20, message="用户名长度只能在3-20之间")
    private String userName;

    @Size(min=6, max=20, message="密码长度只能在6-20之间")
    private String password;

    @Pattern(regexp="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", message="邮件格式错误")
    private String email;

    public String getUserName() {
        return userName;
    }

    public void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {
        request.setCharacterEncoding("utf-8");
//    此行代码必须写在最前面或者所有request.getParameter("");方法之前，如果在此前进行任何request.getPragrmber()方法都会使字符转换失效！
// 必须要在读取request的getParameter()和 getReader() 方法之前调用 否则字符转换失效
        response.setHeader("Content-type", "text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
         email=request.getParameter("email"); //得到邮箱
         password=request.getParameter("password");//得到密码

//        if(email!=null)out.write(email);else out.write("email为空");
//        if(password!=null)out.write(password);else out.write("密码为空");
//

String sql="SELECT email FROM userinfo where email='"+email+"';";
        MySQLDemo find=new MySQLDemo();
               int result= find.checkEmail(sql,email);
               if(result==1)out.write( "true");
        //返回双引号的true或false
               else out.write( "false");

    }

    public void register(HttpServletRequest request,HttpServletResponse response) throws IOException {

        PrintWriter out=response.getWriter();
       email=request.getParameter("email");
        password=request.getParameter("password");
       String fistName=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
//       参数验证,服务器端验证

//                userName=null;
//
//              ObjectError error
//                    System.out.println(error.getDefaultMessage());
String sql = "INSERT INTO userinfo(email, firstname,lastname,password)VALUES('"+email+"','"+fistName+"','"+lastname+"','"+password+"');";
System.out.println(sql);
MySQLDemo book=new MySQLDemo();
if(book.mai(sql)==1) {
    JSONObject object = new JSONObject();
    object.put("success", 1);
    object.put("info", "注册成功");

    out.write(object.toJSONString());//json字符串
}else {
    JSONObject object = new JSONObject();
    object.put("success", 0);
    object.put("info", "注册失败");

    out.write(object.toJSONString());//json字符串
}
    }

}
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
//     ResultSet executeQuery(String sql); 执行SQL查询，并返回ResultSet 对象。
//        int executeUpdate(String sql); 可执行增，删，改，返回执行受到影响的行数。
//        boolean execute(String sql); 可执行任何SQL语句，返回一个布尔值，表示是否返回ResultSet 。
//        ————————————————
//        版权声明：本文为CSDN博主「weiqiangGG」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
//        原文链接：https://blog.csdn.net/weiqiangGG/article/details/82890204