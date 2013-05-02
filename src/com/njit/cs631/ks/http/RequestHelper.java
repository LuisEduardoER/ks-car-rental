package com.njit.cs631.ks.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

public class RequestHelper {
	
	/**
	 * Gets the content of http body.
	 *
	 * @param req the req
	 * @return the content of http body
	 */
	public static String getContentOfHttpBody(HttpServletRequest req) {
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;		
		try {
			InputStream inputStream = req.getInputStream();
			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(
						inputStream));
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			// do nothing
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {
					// do nothing
				}
			}
		}	
		return stringBuilder.toString();
	}

}
