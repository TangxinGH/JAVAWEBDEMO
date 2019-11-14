package extend;

import java.io.*;

public class jsonUtils {
    /**
     * 读取json文件，返回json串

     */
    public static String readJsonFile(String filePath) {
        String jsonStr = "";
        try {
            File jsonFile = new File(filePath);
            if(!jsonFile.exists())return "0";//不存在
            FileReader fileReader = new FileReader(jsonFile);

            Reader reader = new InputStreamReader(new FileInputStream(jsonFile),"GBK");
            int ch = 0;
            StringBuffer sb = new StringBuffer();
            while ((ch = reader.read()) != -1) {
                sb.append((char) ch);
            }
            fileReader.close();
            reader.close();
            jsonStr = sb.toString();
            return jsonStr;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

//        public static void main(String[] args) throws  Exception{
//            String path = jsonUtils.class.getClassLoader().getResource("data.json").getPath();
//            String s = readJsonFile(path);
//            JSONObject jobj = JSON.parseObject(s);
//            System.out.println("name"+jobj.get("name"));
//            JSONObject address1 = jobj.getJSONObject("address");
//            String street = (String) address1.get("street");
//            String city = (String) address1.get("city");
//            String country = (String) address1.get("country");
//
//            System.out.println("street :" + street);
//            System.out.println("city :" + city);
//            System.out.println("country :" + country);
//
//            JSONArray links = jobj.getJSONArray("links");
//
//            for (int i = 0 ; i < links.size();i++){
//                JSONObject key1 = (JSONObject)links.get(i);
//                String name = (String)key1.get("name");
//                String url = (String)key1.get("url");
//                System.out.println(name);
//                System.out.println(url);
//            }
//        }



}
