package extend;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import static example.service.oneSave.savaimage;
import static extend.FileUtils.DateAddOrSub;
import static extend.FileUtils.fileLinesWrite;
import static extend.jsonUtils.readJsonFile;

public class ONEAPI {

       static String httpUrl = "http://api.tianapi.com/txapi/one/index?key=121939b0c5048ac82af5fbaa4b1c792e";
        static String httpArg=null; //参数,默认当日，如果没有其它参数就，就null
    static String folder="ONEJSON";


       public static String getJson(int num) {
//           日期
           Date day=new Date();
           SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

           String fileUrl = Thread.currentThread().getContextClassLoader().getResource("").getPath();
           String relativelyPath=System.getProperty("user.dir");//liNux可不一定，工作目录 ？
           System.out.println(relativelyPath);
            System.out.println(fileUrl);
//           request().getSession().getServletContext().getRealPath();

//文件名
           if(num==0);else day=DateAddOrSub(day,num);// 加减天数
           String filePath=relativelyPath+"/"+folder+"/"+df.format(day)+".json";// 路径

//            读文件
         String  e= readJsonFile(filePath);

         if(e.equals("0"))
            //不存在会创建文件 json文件
         {
//             获得数据json
             String jsonResult = request(httpUrl,"date="+df.format(day));  //此时day是加减后的，作为参数，获得指定日期的，如今天也可以
            System.out.println(jsonResult);
//            存储
             fileLinesWrite(filePath,jsonResult,false);

//             存储图片 该次的
             try {
                 savaimage(jsonResult);
             } catch (IOException e1) {
                 e1.printStackTrace();
             }

//            并返回json
             return jsonResult;

         }
         else {
//             返回数据
             System.out.println(e);
             return e;

         }



        }

        public static String request(String httpUrl, String httpArg) {
            BufferedReader reader = null;
            String result = null;
            StringBuffer sbf = new StringBuffer();
          if(httpArg!=null)  httpUrl = httpUrl + "&" + httpArg; //加上参数  通过上面的例子就可以看出，第一个参数需要以【?】开头，然后是参数名，然后是【=】，然后是参数值。

//            第二个参数开始则需要以【&】开头，然后是参数名，然后是【=】，然后是参数值。

//            这就是url拼接参数的格式要求。

            try {
                URL url = new URL(httpUrl);
                HttpURLConnection connection = (HttpURLConnection) url
                        .openConnection();
                connection.setRequestMethod("GET");
                InputStream is = connection.getInputStream();
                reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                String strRead = null;
                while ((strRead = reader.readLine()) != null) {
                    sbf.append(strRead);
                    sbf.append("\r\n");
                }
                reader.close();
                result = sbf.toString();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        }

    }




