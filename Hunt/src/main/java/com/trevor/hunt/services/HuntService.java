package com.trevor.hunt.services;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.bridge.AbortException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.trevor.hunt.models.Hunt;
import com.trevor.hunt.models.Location;
import com.trevor.hunt.models.User;
import com.trevor.hunt.models.Weather;
import com.trevor.hunt.repositories.HuntRepository;

@Service
public class HuntService {
	@Autowired
	private HuntRepository hRepo;
	@Autowired
	private RestTemplate restTemplate;
	@Value("${api.key}")
	private String apiKey;
	@Value("${geo.key}")
	private String geoKey;
	@Value("${ip}")
	private String myIp;

	
	public List<Hunt> getHunt(){
		return this.hRepo.findAll();
	}
	public void createHunt(Hunt hunt) {
		this.hRepo.save(hunt);
	}
	public void editHunt(Hunt hunt) {
		this.hRepo.save(hunt);
	}
	public void deleteHunt(Long id) {
		this.hRepo.deleteById(id);
	}
	public Hunt findHunt(Long id) {
		return this.hRepo.findById(id).orElse(null);
	}
	public Weather getWeather(String inCity) {
		Weather outWeather = new Weather();
		 String uri ="http://api.openweathermap.org/data/2.5/weather";

			    UriComponents builder = UriComponentsBuilder.fromHttpUrl(uri)
			                .queryParam("q",inCity)
			                	.queryParam("units", "imperial")
			                        .queryParam("appid", apiKey).build();

			    HttpEntity<String> requestEntity = new HttpEntity<>(null, null);
			    
			    ResponseEntity<String> strResponse = restTemplate.exchange(builder.toUriString(),HttpMethod.GET, requestEntity,
			                        String.class,new HashMap<>());
			    
			    JSONObject obj = new JSONObject(strResponse);
			    
			    JSONObject body = new JSONObject(obj.getString("body"));
			    
			    JSONObject wind = body.getJSONObject("wind");
			    
			    JSONObject main = body.getJSONObject("main");
			    
		        JSONArray arr = body.getJSONArray("weather"); 
		        
		        JSONObject getArr = arr.getJSONObject(0);

		        		            
			    outWeather.setTemp(main.getNumber("temp").toString());
			    outWeather.setPressure(main.getNumber("pressure").toString());
			    outWeather.setSpeed(wind.getNumber("speed").toString());
			    outWeather.setDeg(wind.getLong("deg"));
			    outWeather.setDescription(getArr.getString("description"));
			    outWeather.setName(body.getString("name"));
			    return outWeather;

	}
	public Location location() {
		 String uri ="http://api.ipstack.com/";
		    UriComponents builder = UriComponentsBuilder.fromHttpUrl(uri)
		    			.path(myIp)
		                	 .queryParam("access_key", geoKey).build();
		    HttpEntity<String> requestEntity = new HttpEntity<>(null, null);

		    ResponseEntity<String> strResponse = restTemplate.exchange(builder.toUriString(),HttpMethod.GET, requestEntity,
		                        String.class,new HashMap<>());
		    
		    JSONObject obj = new JSONObject(strResponse);
		    
		    JSONObject body = new JSONObject(obj.getString("body"));
		    
		    Location outLocation = new Location();
		    outLocation.setLat(body.getNumber("latitude").toString());
		    outLocation.setLon(body.getNumber("longitude").toString());  
		    return outLocation;
		
	}
	public Weather geoWeather(Location location) {
		String lon = location.getLon();
		String lat = location.getLat();
		 String uri ="http://api.openweathermap.org/data/2.5/weather";
			    UriComponents builder = UriComponentsBuilder.fromHttpUrl(uri)
			    		
			                .queryParam("lat",lat)
			                	.queryParam("lon",lon)
			                		.queryParam("units", "imperial")
			                        	.queryParam("appid", apiKey).build();

			    HttpEntity<String> requestEntity = new HttpEntity<>(null, null);

			    ResponseEntity<String> strResponse = restTemplate.exchange(builder.toUriString(),HttpMethod.GET, requestEntity,
			                        String.class,new HashMap<>());
			   
			    JSONObject obj = new JSONObject(strResponse);
			    
			    JSONObject body = new JSONObject(obj.getString("body"));
			    
			    JSONObject wind = body.getJSONObject("wind");
			    
			    JSONObject main = body.getJSONObject("main");	
			    
		        JSONArray arr = body.getJSONArray("weather");
		        
		        JSONObject getArr = arr.getJSONObject(0);
		        
			    Weather outWeather = new Weather();
			    outWeather.setTemp(main.getNumber("temp").toString());
			    outWeather.setPressure(main.getNumber("pressure").toString());
			    outWeather.setSpeed(wind.getNumber("speed").toString());
			    outWeather.setDeg(wind.getLong("deg"));
			    outWeather.setDescription(getArr.getString("description"));	
			    outWeather.setName(body.getString("name"));
			    return outWeather;
	}
		public Weather degToDir(Weather weather) {
			if(weather.getDeg()>=340) {
				weather.setDir("N");
			}
			if(weather.getDeg()<=340) {
				weather.setDir("NNW");
			}
			if(weather.getDeg()<=320) {
				weather.setDir("NW");
			}
			if(weather.getDeg()<=300) {
				weather.setDir("WNW");
			}
			if(weather.getDeg()<=280) {
				weather.setDir("W");
			}
			if(weather.getDeg()<=250) {
				weather.setDir("WSW");
			}
			if(weather.getDeg()<=230) {
				weather.setDir("SW");
			}
			if(weather.getDeg()<=210) {
				weather.setDir("SSW");
			}
			if(weather.getDeg()<=190) {
				weather.setDir("S");
			}
			if(weather.getDeg()<=160) {
				weather.setDir("SSE");
			}
			if(weather.getDeg()<=140) {
				weather.setDir("SE");
			}
			if(weather.getDeg()<=120) {
				weather.setDir("ESE");
			}
			if(weather.getDeg()<=100) {
				weather.setDir("E");
			}
			if(weather.getDeg()<=70) {
				weather.setDir("ENE");
			}
			if(weather.getDeg()<=50) {
				weather.setDir("NE");
			}
			if(weather.getDeg()<=30) {
				weather.setDir("NNE");
			}
			if(weather.getDeg()<=10) {
				weather.setDir("N");
			}
			return weather;
				
		}
		public Hunt autofillWeather(Weather inWeather) {
			Hunt inHunt = new Hunt();
			inHunt.setDirection(inWeather.getDir());
			inHunt.setPressure(inWeather.getPressure());
			inHunt.setSpeed(inWeather.getSpeed());
			inHunt.setTemp(inWeather.getTemp());
			return inHunt;
		}
		

}
