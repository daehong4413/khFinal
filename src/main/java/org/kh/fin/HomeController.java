package org.kh.fin;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value="map.do")
	public String mapPage() {
		return "common/map";
	}
	
	@ResponseBody
	@RequestMapping(value="search.do")
	public void searchData(HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			JSONObject jObject = new JSONObject();
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			String APIKEY = "f5d561883458bced03bfe6b4283bd3b9";
			//String APIKEY = "3321c6e817ec067d4099feef829b4fb7";
			
			//place 정보 추출
			String url = request.getParameter("url").replace("http", "https");
			url = url.replace("com/", "com/main/v/");
			URL infoURL = new URL(url);
	        
			//URL infoURL = new URL("https://place.map.kakao.com/main/v/9575956");
	        InputStream inputStream = infoURL.openStream();
	        InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");

	        StringBuffer sb = new StringBuffer();
	        int readByte;
	        while ((readByte = inputStreamReader.read()) != -1) {
	            sb.append((char) readByte);
	        }
	        inputStreamReader.close();
	        inputStream.close();
	        
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(sb.toString());
	        JSONObject jsonObj = (JSONObject) obj;                
	        jObject.put("placeData", jsonObj);
	        
	        //weather 정보 추출
	        
	        url 	= "http://api.openweathermap.org/data/2.5/weather?lat="
					+ request.getParameter("lat")+"&lon="
					+ request.getParameter("lon")+"&units=metric&appid="+APIKEY;
			
	        infoURL = new URL(url);
			
	        inputStream = infoURL.openStream();
	        inputStreamReader = new InputStreamReader(inputStream, "utf-8");

	        sb = new StringBuffer();
	        
	        int readByte2;
	        while ((readByte2 = inputStreamReader.read()) != -1) {
	            sb.append((char) readByte2);
	        }
	        inputStreamReader.close();
	        inputStream.close();
	                
	        obj = parser.parse(sb.toString());
	        jsonObj = (JSONObject) obj;  
	        
	        jObject.put("weatherData", jsonObj);
	        
	        //weather Daily 정보 추출
	        url 	= "https://api.openweathermap.org/data/2.5/onecall?lat="
					+ request.getParameter("lat")+"&lon="
					+ request.getParameter("lon")+"&units=metric&%20exclude=daily&appid="+APIKEY;
			
	        infoURL = new URL(url);
			
	        inputStream = infoURL.openStream();
	        inputStreamReader = new InputStreamReader(inputStream, "utf-8");

	        sb = new StringBuffer();
	        
	        int readByte3;
	        while ((readByte3 = inputStreamReader.read()) != -1) {
	            sb.append((char) readByte3);
	        }
	        inputStreamReader.close();
	        inputStream.close();
	                
	        obj = parser.parse(sb.toString());
	        jsonObj = (JSONObject) obj;  
	        
	        jObject.put("weatherList", jsonObj);
	        
	        out.print(jObject);
	    	out.flush();
			out.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}
