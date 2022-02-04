<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="size" type="java.lang.Integer" %>
<%
	if(size==null) size = 1;
	String star="";
	for(int i=0;i<size;i++) star += "★";
	out.println(star);
%>