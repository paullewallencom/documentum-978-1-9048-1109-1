<%
//
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ taglib uri="/WEB-INF/tlds/dmwp_1_0.tld" prefix="dmwp" %>
<%@ page import="com.documentum.wp.library.newcontent.NewContent" %>
<dmfx:docbaseobject name="<%= NewContent.CONTENT_OBJECT %>"/>
<table border="0" cellpadding="2" cellspacing="0" width="100%">
<dmf:panel name="<%=NewContent.IMPORT_PANEL%>">
<tr>
<td colspan="2" align='right'>
<dmf:radio name="<%=NewContent.CREATE_RADIO%>" group="import_group" value="true" onclick="disableFileBrowse" runatclient="true" tooltipnlsid="MSG_CREATE_NEW_FILE" />
</td>
<td colspan="2" align='left'>
<dmf:label nlsid="MSG_CREATE_NEW_FILE"/>
</td>
</tr>
<tr>
<td colspan="2" align='right'>
<dmf:radio name="<%=NewContent.IMPORT_RADIO%>" group="import_group" value="false" onclick="enableFileBrowse" runatclient="true" tooltipnlsid="MSG_IMPORT_NEW_FILE" />
</td>
<td colspan="2" align='left'>
<dmf:label nlsid="MSG_IMPORT_NEW_FILE"/>
<dmf:filebrowse name="<%=NewContent.IMPORT_FILE_BROWSE%>" id="fileBrowse" onselect="onSelectFileBrowse" runatclient="true"/>
<dmf:label name="<%=NewContent.IMPORT_FILE_PATH%>"/> <dmf:button name="<%=NewContent.IMPORT_CLEAR_BUTTON%>" nlsid="MSG_CLEAR" onclick="onClearImportedFile"/>
</td>
</tr>
<tr><td colspan='4' height='5'></td></tr>
<script>
function onSelectFileBrowse(source)
{
var filePath = source.value;
var objName = document.getElementById("object_name");
if (filePath.length > 0 && objName != null)
{
var start = filePath.lastIndexOf("\\");
if (start < 0)
start = filePath.lastIndexOf("/");
if (start >= 0)
{
objName.value = filePath.substr(start + 1);
objectName.value = objName.value.replace(/ /g, "_");
}
}
}
function enableFileBrowse(source)
{
var fb = document.getElementById("fileBrowse__fIlEbRoWsE");
if (fb != null)
fb.disabled = false;
}
function disableFileBrowse(source)
{
var fb = document.getElementById("fileBrowse__fIlEbRoWsE");
if (fb != null)
fb.disabled = true;
}
</script>
</dmf:panel>
<tr>
<td align='right' valign='top' width="20%">
<b><dmfx:docbaseattributelabel object="<%=NewContent.CONTENT_OBJECT%>" attribute="object_name"/>:</b>
</td>
<td valign='top'>&nbsp;</td>
<td width="80%">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<td>
<dmfx:docbaseattributevalue object="<%=NewContent.CONTENT_OBJECT%>" name ='<%=NewContent.OBJECT_NAME%>' id='object_name' attribute="object_name" size="48"/><br>
<dmwp:unsafeurlsubstitutor controltovalidate='<%=NewContent.OBJECT_NAME%>'/>
<dmwp:urlsafevalidator name='objectnamurlsafeevalidator' controltovalidate='<%=NewContent.OBJECT_NAME%>' nlsid='MSG_INVALID_URL_CHAR'/>
<dmf:label name="<%=NewContent.NAME_ERROR%>" cssclass="validatorMessageStyle" visible="false"/>
</td>
</tr>
<tr>
<td align="left"><dmf:label name="<%=NewContent.NAME_INFO%>" nlsid="MSG_OBJECT_NAME_INFO"/></td>
</tr>
</table>
</td>
<td></td>
</tr>
<tr><td colspan='4' height='5'></td></tr>
<script>
var defaultObjectName = null;
var objectName = document.getElementById("object_name");
if (objectName != null)
{
defaultObjectName = objectName.value;
}
</script>
<tr>
<td align='right' valign='top'>
<b><dmf:label nlsid="MSG_ATTR_TITLE" cssclass="defaultDocbaseAttributeStyle"/>:</b>
</td>
<td>&nbsp;</td>
<td>
<dmfx:docbaseattributevalue object="<%=NewContent.CONTENT_OBJECT%>" attribute="title" size="48"/>
</td>
<td></td>
</tr>
<tr><td colspan='4' height='5'></td></tr>
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="subject" size="48" pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>
<tr><td colspan='4' height='5'></td></tr>
<dmf:panel name="<%=NewContent.LOCALE_PANEL%>">
<tr>
<td align='right' valign='top'>
<b><dmf:label nlsid="MSG_LOCALE" cssclass="defaultDocbaseAttributeStyle"/>:</b>
</td>
<td>&nbsp;</td>
<td>
<dmf:datadropdownlist name="<%=NewContent.LOCALE_LIST%>" tooltipnlsid='MSG_LOCALE' >
<dmf:dataoptionlist>
<dmf:option datafield="locale_name" labeldatafield="locale_label"/>
</dmf:dataoptionlist>
</dmf:datadropdownlist>
</td>
<td></td>
</tr>
<tr><td colspan='4' height='5'></td></tr>
</dmf:panel>
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="keywords" 
pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>
<tr><td colspan='4' height='5'></td></tr>
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="authors" 
pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>
<tr><td colspan='4' height='5'></td></tr>
<%-- To add more attributes, make a copy of the following two lines and enter the attribute name. 
Or you can use the data-dictionary.
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="<attribute name>" 
pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>
<tr><td colspan='4' height='5'></td></tr>
--%>
<!-- Added by Gaurav for configuration: begins -->
<tr><td colspan='4' height='5'></td></tr>
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="cust_news_summary" 
pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>

<tr><td colspan='4' height='5'></td></tr>
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="cust_news_is_press_rel" 
pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>

<tr><td colspan='4' height='5'></td></tr>
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="cust_news_edit_approvers" 
pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>

<tr><td colspan='4' height='5'></td></tr>
<dmfx:docbaseattribute object="<%=NewContent.CONTENT_OBJECT%>" attribute="cust_news_display_order" 
pre="<tr><td align='right' valign='top'><b>" col1=":</b></td><td>&nbsp;</td><td>"/>

<!-- Added by Gaurav for configuration: ends -->
<tr>
<td align='right' valign='top'>
<b><dmf:label nlsid="MSG_EFFECTIVE" cssclass="defaultDocbaseAttributeStyle"/>:</b>
</td>
<td valign='top'>&nbsp;</td>
<td>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<td nowrap><dmf:datetime name='<%=NewContent.EFFECTIVE_DATETIME%>' timestep='60' width='400'/></td>
</tr>
<tr>
<td><dmf:label nlsid="MSG_EFFECTIVE_INFO"/></td>
</tr>
</table>
</td>
<td></td>
</tr>
<tr><td colspan='4' height='5'></td></tr>
<tr>
<td align='right' valign='top'>
<b><dmf:label nlsid="MSG_EXPIRATION" cssclass="defaultDocbaseAttributeStyle"/>:</b>
</td>
<td colspan='3'>&nbsp;</td>
</tr>
<tr>
<td colspan='2' align='right'>
<dmf:radio name="<%=NewContent.EXPIRATION_NEVER_RADIO%>" group="expiration_radio" onclick="onClickExpRadio" tooltipnlsid="MSG_NEVER_EXPIRE" value="true" />
</td>
<td colspan="2" align='left'>
<dmf:label nlsid="MSG_NEVER_EXPIRE"/>
</td>
</tr>
<tr>
<td colspan='2' align='right'>
<dmf:radio name="<%=NewContent.EXPIRATION_ON_RADIO%>" group="expiration_radio" onclick="onClickExpRadio" tooltipnlsid="MSG_EXPIRE_ON" />
</td>
<td colspan="2" align='left'>
<dmf:label nlsid="MSG_EXPIRE_ON"/>
</td>
</tr>
<tr>
<td colspan='2'></td>
<td colspan="2" align='left' nowrap>
<dmf:datetime name='<%=NewContent.EXPIRATION_DATETIME%>' timestep='60' width='400' enabled="false" />
</td>
</tr>
<tr>
<td colspan='2'></td>
<td colspan="2" align='left'>
<dmf:label name="<%=NewContent.PUBLISH_DATE_ERROR%>" cssclass="validatorMessageStyle" visible="false"/>
</td>
</tr>
<tr><td colspan='4' height='10'></td></tr>
<tr>
<td colspan="2" align='right'><dmf:checkbox name="<%=NewContent.EDIT_CHECKBOX%>" value="true" tooltipnlsid="MSG_EDIT" />
<td><dmf:label nlsid="MSG_EDIT"/></td>
<td></td>
</tr>
<dmfx:docbaseattributelist name="attrlist" object="<%= NewContent.CONTENT_OBJECT %>" attrconfigid="newcontent" showcategorynames="false"/>
</table>
