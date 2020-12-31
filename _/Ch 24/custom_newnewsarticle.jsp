<%--
    Author : Gaurav Kathuria
    Date : 29-11-2005
    Description : Jsp to Add New News Article.
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.common.ArgumentList" %>
<%@ page import="com.documentum.web.form.Form" %>
<%@ page import="com.documentum.web.form.control.Link" %>
<%@ page import="com.documentum.web.form.control.databound.Datagrid" %>
<%@ page import="com.documentum.web.form.control.databound.DataDropDownList" %>
<%@ page import="com.documentum.web.form.control.databound.DataListBox" %>
<%@ page import="com.documentum.web.form.control.validator.InputMaskValidator" %>

<html>
   <head>
      <dmf:webform/>
   </head>

   <body class='contentBackground'>
   <dmf:form>
         <table border="0" cellpadding="2" cellspacing="0" width="100%">

		 <tr>
                <td>
	                <dmf:label name="lbl_news_article_name" nlsid="MSG_LBL_NEWS_ARTICLE_NAME" />
                </td>
                <td>
					<%--
						Text field where user fill the name of the News Article.
					--%>
                    <dmf:text name="txt_news_article_name" />
					<%--
						Documentum provider validator which checks that the News Article name is 
						a mandatory field. 
					--%>
                    <dmf:requiredfieldvalidator name="txt_news_article_name_validator" 
					controltovalidate="txt_news_article_name" nlsid='MSG_LBL_NEWS_ARTICLE_NAME_REQUIRED' />
                </td>
            </tr>

            <tr>
                <td>
	                <dmf:label name="lbl_news_summary" nlsid="MSG_LBL_NEWS_SUMMARY" />
                </td>
                <td>
					<%--
						Text field where user fill the value of the News Article summary.
					--%>
                    <dmf:text name="txt_news_summary" />
					<%--
						Documentum provider validator which checks that the News Article summary is 
						a mandatory field. 
					--%>
                    <dmf:requiredfieldvalidator name="txt_news_summary_validator" 
					controltovalidate="txt_news_summary" nlsid='MSG_LBL_NEWS_SUMMARY_REQUIRED' />
                </td>
            </tr>
            <tr>
                <td>
                    <dmf:label name="lbl_display_order" nlsid="MSG_LBL_DISPLAY_ORDER" />
                </td>
                <td>
				<%--
						DataDropDownList showing display order of news articles.
				--%>
                   	<dmf:datadropdownlist name="txt_display_order">
                            <dmf:dataoptionlist>
                                <dmf:option datafield="DISPLAY_ORDER_ID" labeldatafield="DISPLAY_ORDER_VALUE"/>
                            </dmf:dataoptionlist>
                    </dmf:datadropdownlist>
				
                </td>
            </tr>
           </table>
    </dmf:form>
    </body>
</html>

