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

<h3 style="color:Crimson"> NEW USER </h3>

<form name="form1" method="post" action="<cfoutput>#cgi.script_name#?user_id=#user_id#</cfoutput>">
	<table>
		<tr>
			<th>Login</th>
			<td><input type="text" name="login" value="<cfoutput>#login#</cfoutput>" ></td>
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
			<td><input type="password"  name="password" value="<cfoutput>#password#</cfoutput>"></td>
		</tr>
	</table>
	<br>
	<input type="submit" name="submit" value="Add this user">
	<input type="hidden" name="user_id" value="<cfoutput>#url.user_id#</cfoutput>">
</form>

<cfif IsDefined("form.user_id") and (form.user_id neq "") 
	and IsDefined("form.login") and (form.login neq "")
	and IsDefined("form.name") and (form.name neq "")
	and IsDefined("form.surname") and (form.surname neq "")
	and IsDefined("form.password") and (form.password neq "")>
	<cfquery datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		insert into user (login, name, surname, password)
		values(
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.login#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.name#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.surname#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.password#">
		)
	</cfquery>
</cfif>

