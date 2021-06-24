<html>
	<body>
		<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
		<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
			
		<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
		<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
		<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
			
		<input type="button" value="Quit" onclick="location.href='login.cfm'">
			
		<h3 style="color:Crimson"> USERS </h3>

		<form name="form3" method="post" action="show_users.cfm?user_id=<cfoutput>#user_id#</cfoutput>">
			<cfset request.dsn = "bug_tracking_system_1">
			<cfset request.un = "root">
			<cfset request.pw = "password">
				
			<cfset user_id = "<cfoutput>#url.user_id#</cfoutput>">
				
			<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
				select * from user;
			</cfquery>
			<cftable query="q" border="yes" colspacing="1" colheaders="yes" htmltable="yes">
				<cfcol header = "User ID" align="center" text = #user_id#>
				<cfcol header = "Login" text = #login#>
				<cfcol header = "Name" text = #name#>
				<cfcol header = "Surname" text = #surname#>
				<cfcol header = "Password" text = #password#>
			</cftable>
			<br>
		</form>	
	</body>
</html>	

