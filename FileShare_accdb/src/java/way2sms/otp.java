/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package way2sms;


// required imports
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.json.JSONObject;

/**
 *
 * @author vivek
 */
public class otp {
    // required variables
    static String url = "https://www.way2sms.com";

    /**
     *
     * @param token 
     * @param phone 10 digit mobile number
     * @param message
     * @param senderId
     */
    public static String sendCampaign(String phone, String message){
      try{
          // construct data
        String apiKey = "api key goes here";
        String secretKey = "secrect key goes here";
        String useType="'stage' for development purpose";
        String senderId="phone number goes here";
        JSONObject urlParameters = new JSONObject();
        urlParameters.put("apikey",apiKey);
        urlParameters.put("secret",secretKey);
        urlParameters.put("usetype",useType);
        urlParameters.put("phone", phone);
        urlParameters.put("message", URLEncoder.encode(message,"UTF-8"));
        urlParameters.put("senderid", senderId);
        URL obj = new URL(url + "/api/v1/sendCampaign");
          // send data
        HttpURLConnection httpConnection = (HttpURLConnection) obj.openConnection();
        httpConnection.setDoOutput(true);
        httpConnection.setRequestMethod("POST");
        DataOutputStream wr = new DataOutputStream(httpConnection.getOutputStream());
        wr.write(urlParameters.toString().getBytes());
        // get the response  
        BufferedReader bufferedReader = null;
        if (httpConnection.getResponseCode() == 200) {
            bufferedReader = new BufferedReader(new InputStreamReader(httpConnection.getInputStream()));
        } else {
            bufferedReader = new BufferedReader(new InputStreamReader(httpConnection.getErrorStream()));
        }
        StringBuilder content = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            content.append(line).append("\n");
        }
        bufferedReader.close();
        return content.toString();
      }catch(Exception ex){
          System.out.println(ex);
          return "{'status':500,'message':'Internal Server Error'}";
      }
        
    }

}
