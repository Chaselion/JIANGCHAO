package com.zy.dmop.baidumap;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.params.ConnRoutePNames;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.log4j.Logger;

public class HttpUtil {
	private static Logger log = Logger.getLogger(HttpUtil.class);
	
	private boolean useProxy = false;
	private String proxyHost;
	private int proxyPort;
	private String proxyUserName;
	private String proxyPassword;
	
	public void setUseProxy(boolean useProxy) {
		this.useProxy = useProxy;
	}
	public void setProxyHost(String proxyHost) {
		this.proxyHost = proxyHost;
	}
	public void setProxyPort(int proxyPort) {
		this.proxyPort = proxyPort;
	}
	public void setProxyUserName(String proxyUserName) {
		this.proxyUserName = proxyUserName;
	}
	public void setProxyPassword(String proxyPassword) {
		this.proxyPassword = proxyPassword;
	}

	public String sendGetRequest(URI uri, int timeout, int socketBufferSize) throws Exception {
		StringBuilder debugInfo  = new StringBuilder();
		debugInfo.append("url : " + uri + "\n");
		
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpGet httpPost = new HttpGet(uri);
		
		//String paramStr = EntityUtils.toString(new UrlEncodedFormEntity(params), "utf-8");
		//httpPost.setURI(new URI(httpPost.getURI().toString() + paramStr));
		//httpPost.setURI(new URI(httpPost.getURI().toString() + "?region=成都&" + paramStr));
		
		if (useProxy) {
			httpClient.getCredentialsProvider().setCredentials(new AuthScope(proxyHost, proxyPort),   
					new UsernamePasswordCredentials(proxyUserName, proxyPassword));
			HttpHost proxy = new HttpHost(proxyHost, proxyPort);   
			httpClient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy); 
		}
		
        HttpConnectionParams.setSoTimeout(httpPost.getParams(), timeout);
		HttpConnectionParams.setSocketBufferSize(httpPost.getParams(), socketBufferSize);
		
		try {
			HttpResponse response = httpClient.execute(httpPost);
			String responseString = response.toString();
	        debugInfo.append("response : " + responseString + "\n");
			
	        HttpEntity responseHttpEntity = response.getEntity();
	        
	        try {
	            InputStream in1 = responseHttpEntity.getContent();
	            
				String respStr = getResponseString(in1);
				//log.info("respStr=" + respStr);
				
				return respStr;
	        } finally {
	            httpPost.releaseConnection();
	        }
		} finally {
		}
	}
	
	public String getResponseString(InputStream in) throws IOException {
		InputStreamReader isr = new InputStreamReader(in, "UTF-8");
        BufferedReader bufferedreader = new BufferedReader(isr);
        
        StringBuilder sb = new StringBuilder();
        String str = null;
		while ((str = bufferedreader.readLine()) != null) {
			sb.append(str);
			//break;
		}
        //EntityUtils.consume(entity2);
		
		return sb.toString();
	}
}

