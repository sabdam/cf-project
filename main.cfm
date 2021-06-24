<cfset request.dsn = "bug_tracking_system_1">
<cfset request.un = "root">
<cfset request.pw = "password">

<cfset bug_id = "">
<cfset user_id = "">

<cfset param1 = ListGetAt(CGI.QUERY_STRING,2,"=")>
<cfset login = listfirst(param1, '&', true)>
<cfset param2 = ListGetAt(CGI.QUERY_STRING,3,"=")>
<cfset password = listfirst(param2, '&', true)>
<input type="hidden" value="<cfoutput>#login#</cfoutput>">
<input type="hidden" value="<cfoutput>#password#</cfoutput>">

<cfif IsDefined("login") and IsDefined("password")>
	<cfquery name ="u" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		select user_id from user
			where login = <cfqueryparam cfsqltype="cf_sql_varchar" value="#login#"> 
			and password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#password#"> 
	</cfquery>
	<cfset user_id = u.user_id>
</cfif>

<cfif isDefined("user_id") and IsNumeric(user_id)>
	<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
	<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
		
	<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
	<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
	<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
		
	<input type="button" value="Quit" onclick="location.href='login.cfm'">
<cfelse>
	<p>!ERROR!</p>
	<input type="button" value="Try again" onclick="location.href='login.cfm'">
</cfif>

