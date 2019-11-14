package example.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import static extend.FileUtils.writeIntoOut;

public class oneSave {


public static void savaimage(String jsonStr) throws IOException {

//           当待解析的JSON字符串是简单对象类型的，即用大括号包围，此时采用JSONObject对象来处理：https://www.cnblogs.com/LearnAndGet/p/10009646.html#_lab2_1_1

    JSONObject json = JSON.parseObject(jsonStr);
     String  newslist = json.getString("newslist");//因为对象中有数组
    JSONArray jsonArr = JSON.parseArray(newslist);//数组中再取

    String first = jsonArr.get(0).toString();// 第一个  原因是：改提取出来的对象不能转为String，而要通过它的方法 toString 来转化：
    JSONObject imgurljson = JSON.parseObject(first);
    String imgurl = imgurljson.getString("imgurl");
    String date=imgurljson.getString("date");
if(imgurl!=null) {
    //存储文件
    URL url = new URL(imgurl);
    HttpURLConnection connection = (HttpURLConnection) url
            .openConnection();
    connection.setRequestMethod("GET");
    InputStream is = connection.getInputStream();

    File file=new File(System.getProperty("user.dir")+"/ONEJSON/"+date+".jpg");
    if(!file.exists()){//如果文件不存在，则创建文件,写入第一行内容   //        检测图片是否存在
        file.createNewFile();
        OutputStream outputStream = new FileOutputStream(file);
        writeIntoOut(is,outputStream);//写
    }



}
    System.out.println(imgurl);

    System.out.println("img路径："+System.getProperty("user.dir")+"/ONEJSON/"+date+".jpg");
};

}
