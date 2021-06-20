<cfset request.dsn = "bug_tracking_system_1">
<cfset request.un = "root">
<cfset request.pw = "password">

<cfset login = "">
<cfset name = "">
<cfset surname = "">
<cfset password = "">

<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
	
<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
	
<input type="button" value="Quit" onclick="location.href='login.cfm'">
	
<cfif IsDefined("url.user_id") and IsNumeric(url.user_id)>
	<cfquery name ="u" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		select * from user
			where user_id = <cfqueryparam cfsqltype="cf_sql_bigint" value="#url.user_id#">
	</cfquery>
	<cfset login = u.login>
	<cfset name = u.name>
	<cfset surname = u.surname>
	<cfset password = u.password>
</cfif>

<form name="form1" method="post" action="<cfoutput>#cgi.script_name#?user_id=#user_id#</cfoutput>">
	<table>
		<tr>
			<th>Login</th>
			<td><input type="text" name="login" value="<cfoutput>#login#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name" value="<cfoutput>#name#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Surname</th>
			<td><input type="text" name="surname" value="<cfoutput>#surname#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="text" name="password" value="<cfoutput>#password#</cfoutput>"></td>
		</tr>
	</table>
	<input type="submit" name="submit" value="Save changes">
	<cfif IsDefined("url.user_id") and IsNumeric(url.user_id)>
		<input type="hidden" name="user_id" value="<cfoutput>#url.user_id#</cfoutput>">
	</cfif>
</form>

<cfif IsDefined("form.user_id") and IsDefined("form.login") and IsDefined("form.name") and IsDefined("form.surname") and IsDefined("form.password")>
	<cfquery datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		update user
		set login = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.login#">,
			name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.name#">,
			surname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.surname#">,
			password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">
		where user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.user_id#">
	</cfquery>
</cfif>



















