package com.zy.dmop.web.rest.api;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import org.apache.http.client.utils.URIBuilder;

public class HttpParamUtil {
	public static URI buildURI(String schema, String host, String path, Map<String, String> params) throws URISyntaxException {
		URIBuilder builder = new URIBuilder()
        	.setScheme(schema)
        	.setHost(host)
        	.setPath(path);
		
		for (String key : params.keySet()) {
			String value = params.get(key);
			builder.setParameter(key, value);
		}
		
        return builder.build();
	}
}
