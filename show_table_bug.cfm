<html>
	<body>
		<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
		<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
			
		<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
		<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
		<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
			
		<input type="button" value="Quit" onclick="location.href='login.cfm'">
			
		<h3 style="color:Crimson"> TABLE BUG </h3>

		<form name="form3" method="post" action="show_table_bug.cfm?user_id=<cfoutput>#user_id#</cfoutput>">
			<cfset request.dsn = "bug_tracking_system_1">
			<cfset request.un = "root">
			<cfset request.pw = "password">
			
			<cfset user_id = "<cfoutput>#url.user_id#</cfoutput>">
			
			<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
				select * from bug;
			</cfquery>
			<cftable query="q" border="yes" colspacing="1" colheaders="yes" htmltable="yes">
				<cfcol header = "Bug ID" align="center" text = #bug_id#>
				<cfcol  header = "Unique number" text = #unique_number#>
				<cfcol header = "Launch date" text = #launch_date#>
				<cfcol header = "Short description" text = #short_description#>
				<cfcol header = "Detailed description" text = #detailed_description#>
				<cfcol header = "User ID" text = #user_id#>
				<cfcol header = "Status id" text = #status_id#>
				<cfcol header = "Priority id" text = #priority_id#>
				<cfcol header = "Severity id" text = #severity_id#>
				<cfcol header="Actions" text="<a href='editbug.cfm?user_id=#url.user_id#?bug_id=#bug_id#'>edit</a>">	
			</cftable>
			<br>
			<input value="Add New Bug" type="button" onclick="location.href='newbug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'" />
		</form>		
	</body>
</html>




