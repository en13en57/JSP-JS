package kr.green.struts2;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Namespaces;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@Namespaces(value = {@Namespace("/User"), @Namespace("/")}) // 경로지정
@Result(location = "/WEB-INF/views/login.jsp") // 결과 지정
@Actions(value = {@Action(""),@Action("home")}) // 주소지정
public class HomeAction extends ActionSupport{

}
