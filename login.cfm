<cfset request.dsn = "bug_tracking_system_1">
<cfset request.un = "root">
<cfset request.pw = "password">

<cfset param = "">
<cfset user_id = "">
<cfset login = "">
<cfset password = "">

<form name="form1" method="get" action="main.cfm"> 
	<table>
		<tr>
			<th>Login</th>
			<td><input type="text" name="login" value="<cfoutput>#login#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" name="password" value="<cfoutput>#password#</cfoutput>"></td>
		</tr>
	</table>
	<input type="submit" name="go" value="LOG IN">	
</form>	

