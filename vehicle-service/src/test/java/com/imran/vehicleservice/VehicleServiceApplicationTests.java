package com.imran.vehicleservice;

import java.io.InputStream;
import java.io.InputStreamReader;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;



@SpringBootTest
public class VehicleServiceApplicationTests {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(VehicleServiceApplicationTests.class);

	// get file from classpath, resources folder
	public String readJsonType(String filename) throws Exception {
		try {
			LOGGER.info("**********Start reading data from JSON file. *********************");
			ClassPathResource resource = new ClassPathResource(filename);
			InputStream inputStream = resource.getInputStream();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(new InputStreamReader(inputStream, "UTF-8"));
			LOGGER.info("**********done *********************");
			return jsonObject.toJSONString();
		} catch (Exception ex) {
			LOGGER.error(ex.getMessage());
		}
		return null;

	}


}
