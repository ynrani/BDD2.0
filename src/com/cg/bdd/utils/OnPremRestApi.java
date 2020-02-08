/******************************************************************************
 *
 *      OnPremRestAPI.java
 *
 *      Capgemini Confidential
 *      CG Source Materials
 *      © Copyright Capgemini 2017
 *
 *
 *******************************************************************************
 *
 *   Date....	WHO 	Description...............................................
 *	09/02/17	NR		First Created
 *  05/04/17	NR		Modified the code to create HTTPClient from RallyRestAPI
 *	
 ******************************************************************************/

package com.cg.bdd.utils;


import java.io.Closeable;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.client.HttpClient;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;

import com.rallydev.rest.RallyRestApi;
import com.rallydev.rest.client.ApiKeyClient;


public class OnPremRestApi extends RallyRestApi{// implements Closeable {

	private HttpClient client;

	//@SuppressWarnings("deprecation")
	public OnPremRestApi(URI server, String apikey) throws URISyntaxException {
		super(new ApiKeyClient(server, apikey));
		
		//restapi.setProxy(new URI("http://myproxy.capgemini.com"), "naboggar", "Kaushi@march25");
		
		TrustManager[] trustAllCerts = new TrustManager[]{
			    new X509TrustManager() {
			        public java.security.cert.X509Certificate[] getAcceptedIssuers() {
			            return null;
			        }
			        public void checkClientTrusted(
			            java.security.cert.X509Certificate[] certs, String authType) {
			        }
			        public void checkServerTrusted(
			            java.security.cert.X509Certificate[] certs, String authType) {
			        }
			    }
			};

			// Install the all-trusting trust manager
			try {
			    SSLContext sc = SSLContext.getInstance("SSL");
			    sc.init(null, trustAllCerts, new java.security.SecureRandom());
			    HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
			} catch (Exception e) {
			}
			
			TrustStrategy easyStrategy = new TrustStrategy() {
			    public boolean isTrusted(X509Certificate[] chain, String authType)
			            throws CertificateException {
			        // eh, why not?
			        return true;
			    }
			};
			try {
				SSLSocketFactory sf = new SSLSocketFactory(easyStrategy);
			} catch (KeyManagementException | UnrecoverableKeyException | NoSuchAlgorithmException
					| KeyStoreException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			RallyRestApi restapi = new RallyRestApi(server, apikey);
			restapi.setApplicationName("BDD2.0");
			client = restapi.getClient();
		
		try {
			/*SSLSocketFactory sf = new SSLSocketFactory(new TrustStrategy() {
				public boolean isTrusted(X509Certificate[] certificate,
						String authType) throws CertificateException {
					// trust all certs
					return true;
				}
			}, SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
			client.getConnectionManager().getSchemeRegistry().register(new Scheme("https", 443, sf));*/
			
	/*Added by Venkat*/
					/*TrustStrategy easyStrategy = new TrustStrategy() {

		        @Override
		        public boolean isTrusted(X509Certificate[] certificate, String authType)
		                throws CertificateException {
		            return true;
		        }
		    };
			SSLSocketFactory sf = new SSLSocketFactory(easyStrategy,SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
	        SchemeRegistry registry = new SchemeRegistry();
	        registry.register(new Scheme("https", 8443, sf));
			 ClientConnectionManager ccm = new ThreadSafeClientConnManager(registry);
		        client =  new DefaultHttpClient(ccm);*/
			/*Added by Venkat*/

			
			restapi.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

