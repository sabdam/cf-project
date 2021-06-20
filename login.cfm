<cfset request.dsn = "bug_tracking_system_1">
<cfset request.un = "root">
<cfset request.pw = "password">

<cfset user_id = "">
<cfset login = "">
<cfset password = "">

<cfif IsDefined("form.login") and IsDefined("form.password")>
	<cfquery name ="u" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		select user_id from user
			where login = <cfqueryparam cfsqltype="cf_sql_varchar" value="<cfoutput>#form.login#</cfoutput>"> 
			and password = <cfqueryparam cfsqltype="cf_sql_varchar" value="<cfoutput>#form.password#</cfoutput>"> 
	</cfquery>
	<cfset user_id = u.user_id>
</cfif>

<form name="form1" method="post" action="main.cfm?user_id=<cfoutput>#user_id#</cfoutput>"> <!---"<cfoutput>#cgi.script_name#?user_id=#user_id#</cfoutput>"--->
	<table>
		<tr>
			<th>Login</th>
			<td><input type="text" name="login" value="<cfoutput>#login#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="text" name="password" value="<cfoutput>#password#</cfoutput>"></td>
		</tr>
	</table>
	<input type="submit" name="go" value="LOG IN">
</form>	

