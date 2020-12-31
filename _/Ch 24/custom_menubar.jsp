<%--
    Author : Gaurav Kathuria
    Date : 28-11-2005
    Description : This is a customized JSP to display a custom menu option.
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/wdk/errorhandler.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/dmform_1_0.tld" prefix="dmf" %>
<%@ taglib uri="/WEB-INF/tlds/dmformext_1_0.tld" prefix="dmfx" %>
<%@ page import="com.documentum.web.form.Form" %>
<%
//
%>
<html>
<head>
<dmf:webform/>
<script language='JavaScript1.2' src='<%=Form.makeUrl(request, "/wdk/include/dynamicAction.js")%>'></script>
<script>
function onClickHelp()
{
fireClientEvent("InvokeHelp");
//postServerEvent(null, null, null, "onComponentReturn", null, null);
}
</script>
</head>
<%
Form form = (Form)pageContext.getAttribute(Form.FORM, PageContext.REQUEST_SCOPE);
boolean bAccessibleParam = form.isAccessible();
String strBodyOptions = null;
String strMenugroupTableOptions = null;
if (!bAccessibleParam)
{
strBodyOptions = "class='webtopMenubarBackground' marginheight='1' marginwidth='8' leftmargin='8' rightmargin='0' topmargin='1' bottommargin='0'";
strMenugroupTableOptions = "height='100%' border='0' cellpadding='0' cellspacing='0'";
}
else
{
strBodyOptions = "class='contentBackground' marginheight='0' marginwidth='0' topmargin='0' bottommargin='0' leftmargin='0' rightmargin='0'";
strMenugroupTableOptions = "width='100%' class='contentBackground' border='0' cellpadding='0' cellspacing='10'";
}
%>
<body <%=strBodyOptions%> >
<dmf:form>
<dmf:panel name='accessheaderpanel'>
<table width='100%' border='0' cellpadding='0'>
<tr class=headerBackground>
<td height=40 colspan=2>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td align=left>
<dmf:label name='location' cssclass='webcomponentBreadcrumb'/>
</td>
</tr>
<tr>
<td align=left>
<dmf:label nlsid='MSG_TITLE' cssclass='webcomponentTitle'/>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table cellspacing=2 cellpadding=2 border=0>
<tr>
<td width='1' class='doclistHeader'><dmfx:docbaseicon size='32' name="icon"/></td>
<td>
<table cellspacing=0 cellpadding=0 border=0>
<tr><td><dmf:label name='object_name' cssclass='doclistHeader' />&nbsp;<dmf:bookmarklink name="bookmark" /></td></tr>
<tr><td><dmf:label nlsid='MSG_OBJ_TYPE' cssclass='doclistHeader' />&nbsp;<dmf:label name='r_object_type' cssclass='doclistHeader'/></td></tr>
<tr><td><dmf:label nlsid='MSG_CONTENT_TYPE' cssclass='doclistHeader' />&nbsp;<dmf:label name='a_content_type' cssclass='doclistHeader'/></td></tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
<tr height='4'><td></td></tr>
</table>
</dmf:panel>
<dmf:panel name='menubarpanel'>
<dmf:menugroup name='menugroup' target='content' imagefolder='images/menubar' accessible='<%=new Boolean(bAccessibleParam).toString()%>'>
<table <%=strMenugroupTableOptions%> >
<dmf:panel name='accessheaderlinkspanel'>
<tr>
<td align='left' colspan='3'>
<dmf:label name='tableTitleLabel' nlsid='MSG_TABLE_TITLE'/>
</td>
<td align='right'>
<table>
<tr>
<td>
<dmf:link name='cancelLink' cssclass='defaultLinkStyle' nlsid='MSG_CANCEL' onclick='onCancel'/>
</td>
<td width=5>
</td>
<td>
<dmf:link name='helpLink' cssclass="defaultLinkStyle" nlsid='MSG_HELP' onclick='onClickHelp' runatclient='true'/>
</td>
</tr>
</table>
</td>
</tr>
</dmf:panel>
<tr>
<td><dmf:image name='farleftimg' id='farleftimg' src='images/menubar/farleft.gif'/></td>
<td>
<dmf:menu name='file_menu' nlsid='MSG_FILE' width='50'>
<dmf:menu name='file_new_menu' nlsid='MSG_NEW'>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_new_webhtml_template' 
nlsid='MSG_NEW_WEBHTML_TEMPLATE' action='createwebhtmltemplate' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='generic' name='file_newcontent' nlsid='MSG_NEW_CONTENT' 
action='newcontent' showifinvalid='false' showifdisabled='true'/>

<!-- Customized to add a new menu option -->
<dmfx:actionmenuitem dynamic='generic' name='custom_new_news' nlsid='NLS_NEW_NEWS_MENU' 
action='newnewsarticlelink' showifinvalid='false' showifdisabled='true'/>

<dmfx:actionmenuitem dynamic='generic' name='create_changeset' nlsid='MSG_NEW_CHANGESET' 
action='newchangeset' showifinvalid='false' showifdisabled='false'/>

<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newcontentfromcategory' nlsid='MSG_NEW_CONTENT' action='newcontentfromcategory' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='file_newcontentfromtemplate' nlsid='MSG_NEW_CONTENT' action='newcontentfromtemplate' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newcategoryfolder' nlsid='MSG_NEW_WCM_CATEGORY' action='newcategoryfolder' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newcategory' nlsid='MSG_NEW_CATEGORY' action='newcategory' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newtaxonomy' nlsid='MSG_NEW_TAXONOMY' action='newtaxonomy' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newfolder' nlsid='MSG_NEW_FOLDER' action='newchannelfolder' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='generic' name='add_locale' nlsid='MSG_NEW_LOCALE' action='add_locale' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newchannel' nlsid='MSG_NEW_CHANNEL' action='newchannel' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='addnewrule' nlsid='MSG_NEW_RULE' action='addnewrule' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newdocument' nlsid='MSG_NEW_DOCUMENT' action='newdocument' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newfolder' nlsid='MSG_NEW_FOLDER' action='newfolder' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newcabinet' nlsid='MSG_NEW_CABINET' action='newcabinet' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newprocess' nlsid='MSG_NEW_PROCESS' action='newprocess' showifinvalid='true'/>
<dmf:menuseparator name='file_sep1ll'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newuser' nlsid='MSG_NEW_USER' action='newuser' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newgroup' nlsid='MSG_NEW_GROUP' action='newgroup' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_newrole' nlsid='MSG_NEW_ROLE' action='newrole' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='newpermissionset' nlsid='MSG_NEW_PERMISSION_SET' action='newacl' showifinvalid='true'/>
</dmf:menu>
<dmfx:actionmenuitem dynamic='multiselect' name='file_edit' nlsid='MSG_EDIT_FILE' action='editfile' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' id='file_view' name='file_view' nlsid='MSG_VIEW_FILE' action='view' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_checkin' nlsid='MSG_CHECKIN' action='wpcheckin' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_checkout' nlsid='MSG_CHECKOUT' action='wpcheckout' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_cancelcheckout' nlsid='MSG_CANCEL_CHECKOUT' action='wpcancelcheckout' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_checkin' nlsid='MSG_CHECKIN' action='checkin' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_checkout' nlsid='MSG_CHECKOUT' action='checkout' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_cancelcheckout' nlsid='MSG_CANCEL_CHECKOUT' action='cancelcheckout' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='generic' name='file_import' nlsid='MSG_IMPORT' action='import' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_export' nlsid='MSG_EXPORT' action='export' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='file_export' nlsid='MSG_EXPORT' action='exportrendition' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_delete' nlsid='MSG_DELETE' action='delete' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='file_delete_version' nlsid='MSG_DELETE_VERSION' action='deleteversion' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='file_send_locator' nlsid='MSG_SEND_LOCATOR' action='sendlocator' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='removeuserorgroup' nlsid='MSG_REMOVE_USER_OR_GROUP' action='removeuserorgroup' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='saveas' nlsid='MSG_SAVE_AS' action='saveas' showifinvalid='false' showifdisabled = 'false'/>
<dmf:menuseparator name='file_sep1l'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='userimport' nlsid='MSG_USER_IMPORT' action='userimport' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='file_adduserorgroup' nlsid='MSG_ADD_USER_OR_GROUP' action='adduserorgroup' showifinvalid='true' showifdisabled = 'true'/>
<dmf:menuseparator name='file_sep1'/>
<dmf:menuitem name='file_help' nlsid='MSG_HELP' onclick='onClickHelp' runatclient='true'/>
<dmfx:actionmenuitem name='file_about' nlsid='MSG_ABOUT' action='about' showifinvalid='true'/>
<dmf:menuseparator name='file_sep2'/>
<dmfx:actionmenuitem name='file_logout' nlsid='MSG_LOGOUT' action='logout' showifinvalid='true'/>
</dmf:menu>
</td>
<td>
<dmf:menu name='edit_menu' nlsid='MSG_EDIT' width='50'>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_addtoclip' nlsid='MSG_ADD_TO_CLIPBOARD' action='addtoclipboard' showifinvalid='true'/>
<dmf:menuseparator name='edit_sep1'/>
<dmfx:actionmenuitem dynamic='generic' name='tools_move' nlsid='MSG_MOVE_FILE' action='wpmoveaction' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='generic' name='tools_copy' nlsid='MSG_COPY_FILE' action='wpcopyaction' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='generic' name='tools_link' nlsid='MSG_LINK_FILE' action='wplinkaction' showifinvalid='true'/>
<dmf:menuseparator name='edit_sep2'/>
<dmfx:actionmenuitem dynamic='generic' name='tools_viewclipboard' nlsid='MSG_VIEW_CLIP' action='wpviewclipboardaction' showifinvalid='true'/>
</dmf:menu>
</td>
<td>
<dmf:menu name='view_menu' nlsid='MSG_VIEW' width='50'>
<dmf:menu name='view_properties_menu' nlsid='MSG_PROPERTIES'>
<dmfx:actionmenuitem dynamic='singleselect' name='view_info' nlsid='MSG_INFO' action='attributes' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_permissions' nlsid='MSG_PERMISSIONS' action='permissions' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_publishing' nlsid='MSG_PUBLISHING' action='publishing' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_categories' nlsid='MSG_CATEGORIES' action='categories' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_taxonomies' nlsid='MSG_TAXONOMIES' action='taxonomies' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_webcabinets' nlsid='MSG_WEBCABINETS' action='webcabinets' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_translations' nlsid='MSG_TRANSLATIONS' action='categorylocaleslist' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_subscription' nlsid='MSG_SUBSCRIPTION' action='subscriptions' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_history' nlsid='MSG_HISTORY' action='history' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_protected_assets' nlsid='MSG_PROTECTED_ASSETS' action='protected_assets' showifinvalid='true'/>
</dmf:menu>
<dmfx:actionmenuitem dynamic='singleselect' name='view_site_overview' nlsid='MSG_SITE_OVERVIEW' action='siteoverview' showifdisabled='true' showifinvalid='true'/>
<dmf:menuseparator name='view_sep1'/>
<dmf:menu name='view_associate_menu' nlsid='MSG_ASSOCIATIONS'>
<dmfx:actionmenuitem dynamic='singleselect' name='view_preview' nlsid='MSG_PREVIEW' action='thumbnailpreview' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_presentations' nlsid='MSG_PRESENTATIONS' action='presentations' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_rules' nlsid='MSG_RULES' action='rules' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_workflow' nlsid='MSG_WORKFLOW' action='associateworkflow' showifinvalid='true' showifdisabled='true'/>
</dmf:menu>
<dmfx:actionmenuitem dynamic='singleselect' name='view_locations' nlsid='MSG_LOCATIONS' action='locations' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_related_content' nlsid='MSG_RELATED_CONTENT' action='list_related_content' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_relationships' nlsid='MSG_ALL_RELATIONSHIPS' action='list_manual_link' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_renditions' nlsid='MSG_RENDITIONS' action='renditions' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='viewsource' nlsid='MSG_VIEW_SOURCE' action='viewsource' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_translations' nlsid='MSG_SHOW_TRANSLATIONS' action='translationslist' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_versions' nlsid='MSG_SHOW_VERSIONS' action='versions' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_webview' nlsid='MSG_WEBVIEW' action='webview' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='view_where_used' nlsid='MSG_WHERE_USED' action='whereused' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='userrenamelog' nlsid='MSG_USER_RENAME_LOG' action='userrenamelog' showifinvalid='false' showifdisabled = 'false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='changehomedblog' nlsid='MSG_USER_CHANGE_HOME_DB_LOG' action='changehomedblog' showifinvalid='false' showifdisabled = 'false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='grouprenamelog' nlsid='MSG_GROUP_RENAME_LOG' action='grouprenamelog' showifinvalid='false' showifdisabled = 'false'/>
<dmf:menuseparator name='view_sep1'/>
<dmf:menu name='view_page_menu' nlsid='MSG_PAGE_VIEW'>
<dmfx:actionmenuitem dynamic='generic' name='view_standard' nlsid='MSG_STANDARD' action='standardview' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='generic' name='view_thumbnail' nlsid='MSG_THUMBNAIL' action='thumbnailview' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='generic' name='view_locations' nlsid='MSG_LOCATIONS' action='locationsview' showifinvalid='true'/>
</dmf:menu>
</dmf:menu>
</td>
<td>
<dmf:menu name='document_menu' nlsid='MSG_DOCUMENT' width='50'>
<dmf:menu name='doc_lifecycle' nlsid='MSG_LIFECYCLE'>
<dmfx:actionmenuitem dynamic='singleselect' name='folder_deeppromotelifecycle' nlsid='MSG_PROMOTE_LIFECYCLE' action='wpdeeppromote' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_wppromotelifecycle' nlsid='MSG_PROMOTE_LIFECYCLE' action='wppromote' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_promotelifecycle' nlsid='MSG_PROMOTE_LIFECYCLE' action='promote' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_wpdemotelifecycle' nlsid='MSG_DEMOTE_LIFECYCLE' action='wpdemote' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_demotelifecycle' nlsid='MSG_DEMOTE_LIFECYCLE' action='demote' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_powerpromotelifecycle' nlsid='MSG_POWERPROMOTE_LIFECYCLE' action='powerpromote' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_expirenowlifecycle' nlsid='MSG_EXPIRENOW_LIFECYCLE' action='expirenow' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_applylifecycle' nlsid='MSG_APPLY_LIFECYCLE' action='applylifecycle' showifinvalid='true'/>
</dmf:menu>
<dmf:menuseparator name='doc_sep1'/>
<dmf:menu name='template_lifecycle' nlsid='MSG_TEMPLATES'>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_makeavailablelifecycle' nlsid='MSG_MAKEAVAILABLE_LIFECYCLE' action='makeavailable' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_makeunavailablelifecycle' nlsid='MSG_MAKEUNAVAILABLE_LIFECYCLE' action='makeunavailable' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='doc_validate' nlsid='MSG_VALIDATE' action='validatecontenttemplate' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='doc_apply' nlsid='MSG_APPLY' action='applypresentation' showifinvalid='true'/>
</dmf:menu>
<dmf:menu name='doc_create_rendition' nlsid='MSG_CREATE_RENDITION'>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_createpdfrendition' nlsid='MSG_CREATE_PDF_RENDITION' action='createpdfrendition' showifinvalid='false' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='generic' name='doc_createpdfrenditiongeneric' nlsid='MSG_CREATE_PDF_RENDITION' action='createpdfrenditiongeneric' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_createhtmlrendition' nlsid='MSG_CREATE_HTML_RENDITION' action='createhtmlrendition' showifinvalid='false' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='generic' name='doc_createhtmlrenditiongeneric' nlsid='MSG_CREATE_HTML_RENDITION' action='createhtmlrenditiongeneric' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='doc_importrendition' nlsid='MSG_IMPORT_RENDITION' action='importrendition' showifinvalid='false' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='generic' name='doc_importrenditiongeneric' nlsid='MSG_IMPORT_RENDITION' action='importrenditiongeneric' showifinvalid='false' showifdisabled='false'/>
</dmf:menu>
<dmfx:actionmenuitem dynamic='singleselect' name='menuitemtransform' nlsid='MSG_TRANSFORM' action='menuitemtransform' showifinvalid='true'/>
<dmf:menu name='doc_translation' nlsid='MSG_TRANSLATIONS'>
<dmfx:actionmenuitem dynamic='singleselect' name='add_translation' nlsid='MSG_ADD_TRANSLATION' action='add_translation' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='request_translation' nlsid='MSG_REQUEST_TRANSLATION' action='request_translation' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='view_fallback' nlsid='MSG_VIEW_FALLBACK' action='viewwplocalelist' showifinvalid='true'/>
</dmf:menu>
<dmf:menu name='doc_versions' nlsid='MSG_VERSIONS'>
<dmfx:actionmenuitem dynamic='singleselect' name='reinstate' nlsid='MSG_REINSTATE' action='reinstate' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='diff_versions' nlsid='MSG_DIFF_VERSIONS' action='diffversions' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='diff_with_local' nlsid='MSG_DIFF_LOCAL' action='difflocal' showifinvalid='true'/>
</dmf:menu>
<%-- removed it for the beta <dmf:menuseparator name='doc_sep1l'/>
<dmf:menu name='doc_vdm' nlsid='MSG_VDM'>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_vdm_tovd' nlsid='MSG_VDM_MAKE_VIRTUAL' action='makevirtual' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_vdm_todoc' nlsid='MSG_VDM_MAKE_SIMPLE' action='makesimple' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='doc_vdm_view' nlsid='MSG_VDM_VIEW' action='viewvirtualdoc' showifinvalid='true'/>
<dmf:menu name='doc_vdm_addcomponent' nlsid='MSG_VDM_ADDCOMPONENT'>
<dmfx:actionmenuitem dynamic='singleselect' name='doc_vdm_addcomponent_from_clipboard' nlsid='MSG_FROM_CLIPBOARD' action='addcomponentfromclipboard' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='doc_vdm_addcomponent_from_selector' nlsid='MSG_FROM_FILE_SELECTOR' action='addcomponentfromfileselector' showifinvalid='true'/>
</dmf:menu>
<dmfx:actionmenuitem dynamic='multiselect' name='doc_vdm_removecomponent' nlsid='MSG_VDM_REMOVECOMPONENT' action='removecomponent' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='doc_vdm_reordercomponents' nlsid='MSG_VDMTOOLS_REORDERCOMPONENTS' action='reordercomponents' showifinvalid='true'/>
</dmf:menu>  --%>
</dmf:menu>
</td>
<td>
<dmf:menu name='tools_menu' nlsid='MSG_TOOLS' width='50'>
<dmfx:actionmenuitem dynamic='multiselect' name='userchangehomedocbase' nlsid='MSG_USER_CHANGE_HOME_DOCBASE' action='changehomedocbase' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='reassignuser' nlsid='MSG_REASSIGN_USER' action='reassignuser' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='grouprename' nlsid='MSG_GROUP_REASSIGN' action='groupreassign' showifinvalid='true' showifdisabled='true'/>
<dmf:menuseparator name='tools_sep1'/>
<dmfx:actionmenuitem dynamic='multiselect'  name='tools_subscribe' nlsid='MSG_SUBSCRIBE' action='subscribe' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect'  name='tools_unsubscribe' nlsid='MSG_UNSUBSCRIBE' action='unsubscribe' showifinvalid='true'/>
<dmf:menuseparator name='tools_sep11'/>
<dmf:menu name='tools_change_set' nlsid='MSG_CHANGE_SET'>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_accessibilityaddfile' nlsid='MSG_ADD' action='addfileaccessibility' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_removefromchangeset' nlsid='MSG_REMOVE' action='changesetremovefiles' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_suppremovefromchangeset' nlsid='MSG_REMOVE' action='changesetremovesupportingfiles' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_addtochangeset' nlsid='MSG_ADD_TO_CS' action='addtochangeset' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_deletechangeset' nlsid='MSG_DELETE_CS' action='deletechangeset' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_restartchangeset' nlsid='MSG_RESTART_CS' action='restartchangeset' showifinvalid='false' showifdisabled='false'/>
</dmf:menu>
<dmf:menu name='tools_locales' nlsid='MSG_LOCALES'>
<dmfx:actionmenuitem dynamic='genericnoselect' name='add_locale' nlsid='MSG_ADD_LOCALE' action='add_locale' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='singleselect' name='setdefault_locale' nlsid='MSG_SETDEFAULT_LOCALE' action='setdefault_locale' showifinvalid='true' showifdisabled='true'/>
</dmf:menu>
<dmf:menu name='tools_relations' nlsid='MSG_RELATIONS'>
<dmfx:actionmenuitem dynamic='singleselect' name='add_manual_link_type' nlsid='MSG_ADD_RELATIONTYPE' action='add_manual_link_type' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='remove_manual_link_type' nlsid='MSG_DELETE_RELATIONTYPE' action='remove_manual_link_type' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='view_all_of_type' nlsid='MSG_VIEW_ALL_OF_TYPE' action='view_all_of_type' showifinvalid='true' showifdisabled='true'/>
</dmf:menu>
<dmf:menu name='tools_versions' nlsid='MSG_VERSIONS'>
<dmfx:actionmenuitem dynamic='singleselect' name='difflocal' nlsid='MSG_DIFF_LOCAL' action='difflocal' showifinvalid='true' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='diffversions' nlsid='MSG_DIFF_VERSIONS' action='diffversions' showifinvalid='true' showifdisabled='true'/>
</dmf:menu>
<dmf:menu name='tools_workflow' nlsid='MSG_WORKFLOW'>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_workflowhistory' nlsid='MSG_WORKFLOW_HISTORY'  action='workflowhistory' showifdisabled='true' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_startwpworkflownotemplatecs' nlsid='MSG_START_WORKFLOW'  action='startwpworkflownotemplatecs' showifdisabled='false' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_startwpworkflownotemplate' nlsid='MSG_START_WORKFLOW'  action='startwpworkflownotemplate' showifdisabled='false' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='tools_startwpworkflownotemplategeneric' nlsid='MSG_START_WORKFLOW'  action='startwpworkflownotemplategeneric' showifdisabled='false' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='tools_startworkflownotemplate' nlsid='MSG_START_WORKFLOW'  action='startworkflownotemplate' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_startworkflowfromdoc' nlsid='MSG_START_WORKFLOW_FROM_DOC'  action='startworkflowfromdoc' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_startworkflow' nlsid='MSG_START_WORKFLOW' action='startworkflow' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_abortworkflow' nlsid='MSG_STOP_WORKFLOW' action='abortworkflow' showifdisabled='true' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_haltworkflow' nlsid='MSG_PAUSE_WORKFLOW' action='haltworkflow' showifdisabled='true' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_resumeworkflow' nlsid='MSG_RESUME_WORKFLOW' action='resumeworkflow' showifdisabled='true' showifinvalid='true'/>
<dmf:menuseparator name='tools_quickwf_sep11l'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_sendtodistributionlist' nlsid='MSG_WORKFLOW_QUICKFLOW' action='sendtodistributionlist' showifinvalid='true'/>
<dmf:menuseparator name='tools_wf_sep11l'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='tools_workflowstatus' nlsid='MSG_WORKFLOW_STATUS' action='workflowstatusclassic' showifdisabled='true' showifinvalid='true'/>
<dmfx:actionmenuitem dynamic='genericnoselect' name='tools_workflowreportmain' nlsid='MSG_WORKFLOW_REPORTING' action='reportmainclassic' showifinvalid='false'/>
<dmf:menu name='tools_workflow_report_details' nlsid='MSG_WORKFLOW_REPORTING_DETAILS'>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_workflowreportdetailssummary' nlsid='MSG_WORKFLOW_REPORT_DETAILS_SUMMARY' action='reportdetailssummaryclassic' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_workflowreportdetailsaudit' nlsid='MSG_WORKFLOW_REPORT_DETAILS_AUDIT' action='reportdetailsauditclassic' showifinvalid='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_workflowreportdetailsmap' nlsid='MSG_WORKFLOW_REPORT_DETAILS_MAP' action='reportdetailsmap' showifinvalid='false'/>
</dmf:menu>
</dmf:menu>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_publish' nlsid='MSG_PUBLISH' action='publish' showifinvalid='false' showifdisabled='false'/>
<dmfx:actionmenuitem dynamic='singleselect' name='tools_publish_taxonomy' nlsid='MSG_PUBLISH' action='publish_taxonomy' showifinvalid='false' showifdisabled='false'/>
<dmf:menu name='tools_wftemplates' nlsid='MSG_WF_TEMPLATES'>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_available' nlsid='MSG_WF_AVAILABLE' action='makewftemplate_available' showifinvalid='false' showifdisabled='true'/>
<dmfx:actionmenuitem dynamic='multiselect' name='tools_unavailable' nlsid='MSG_WF_UNAVAILABLE' action='makewftemplate_unavailable' showifinvalid='false' showifdisabled='true'/>
</dmf:menu>
</dmf:menu>
</td>
<td><dmf:image name='farrightimg' id='farrightimg' src='images/menubar/farright.gif'/></td>
</tr>
</table>
<dmf:panel name='accessfooterpanel'>
<table class='contentBackground' border='0' cellpadding='0' cellspacing='0'>
<tr>
<td width=5>
</td>
<td>
<dmf:button name='cancelButton' cssclass='buttonLink' nlsid='MSG_CANCEL' onclick='onCancel'
height='16' imagefolder='images/dialogbutton'/>
</td>
<td width=5>
</td>
<td>
<dmf:button name='helpButton' cssclass="buttonLink" nlsid='MSG_HELP' onclick='onClickHelp' runatclient='true'
height='16' imagefolder='images/dialogbutton'/>
</td>
</tr>
</table>
</dmf:panel>
</dmf:menugroup>
</dmf:panel>
</dmf:form>
</body>
</html>
