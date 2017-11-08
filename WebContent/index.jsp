<%@ page language = "java" contentType="text/html' charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.xmlrpc.client.*" %>
<%@ page import = "org.apache.xmlrpc.common.*" %>
<%@ page import = "org.apache.xmlrpc.XmlRpcException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> naver API call test</title>
</head>

<%
String SERVER_URL = "https://api.blog.naver.com/xmlrpc";

try  {
    XmlRpcClient client = new XmlRpcClient();
    XmlRpcClientConfigImpl myconfig = new XmlRpcClientConfigImpl();
    myconfig.setServerURL(new java.net.URL(SERVER_URL));
    myconfig.setBasicEncoding("UTF-8");
    myconfig.setEncoding("UTF-8");

    Vector params = new Vector();
    params.addElement(new String("htemplar"));
    params.addElement(new String("htemplar"));
    params.addElement(new String("08c0e59b26fec015fca263dc97c18648"));
    Hashtable<String, String> hashtable = new Hashtable<String, String>();

    String sTitle="mini test 2";
    hashtable.put("title", sTitle);

    String sDescription = "test 2 <br/> is it OK?";
    hashtable.put("description", sDescription);

    hashtable.put("tags", "mini, blog. api, test");

    String category="낙서장";
    hashtable.put("categories", category);

    params.addElement(hashtable);
    params.add(new Boolean(true));

    String rs = null;
    rs = (String)client.execute(myconfig, "metaWeblog.newPost", params);

} catch (XmlRpcException exception)  {
    out.println("Fault #" + Integer.toString(exception.code) + ": " + exception.toString());
} catch (Exception exception)  {
    out.println("Error: " + exception.toString());
}

%>
