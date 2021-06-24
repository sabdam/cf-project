<html>
	<body>
		
		<cfset list_id = "#url.user_id#">
		<cfset user_id = listfirst(list_id, '?', true)>
		<cfset sort_by = listlast(list_id, '=', true)>
		
		<input type="hidden" value="<cfoutput>#user_id#</cfoutput>">
		<input type="hidden" value="<cfoutput>#sort_by#</cfoutput>">

		<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
		<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
			
		<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
		<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
		<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
			
		<input type="button" value="Quit" onclick="location.href='login.cfm'">

		<form name="form3" method="post" action="sort_table_bug.cfm?user_id=<cfoutput>#user_id#</cfoutput>">
			<cfset request.dsn = "bug_tracking_system_1">
			<cfset request.un = "root">
			<cfset request.pw = "password">
			
			<cfset user_id = "<cfoutput>#url.user_id#</cfoutput>">
			
			
			<cfif isDefined("sort_by") and (sort_by is "date_asc")>
				<h3 style="color:Crimson"> TABLE BUG BY DATE ASC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by launch_date asc;
				</cfquery>
			<cfelseif isDefined("sort_by") and (sort_by is "date_desc")>
				<h3 style="color:Crimson"> TABLE BUG BY DATE DESC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by launch_date desc;
				</cfquery>
				
			<cfelseif isDefined("sort_by") and (sort_by is "user_asc")>
				<h3 style="color:Crimson"> TABLE BUG BY USER ASC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by user_id asc;
				</cfquery>
			<cfelseif isDefined("sort_by") and (sort_by is "user_desc")>
				<h3 style="color:Crimson"> TABLE BUG BY USER DESC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by user_id desc;
				</cfquery>
				
			<cfelseif isDefined("sort_by") and (sort_by is "status_asc")>
				<h3 style="color:Crimson"> TABLE BUG BY STATUS ASC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by status_id asc;
				</cfquery>
			<cfelseif isDefined("sort_by") and (sort_by is "status_desc")>
				<h3 style="color:Crimson"> TABLE BUG BY STATUS DESC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by status_id desc;
				</cfquery>
				
			<cfelseif isDefined("sort_by") and (sort_by is "priority_asc")>
				<h3 style="color:Crimson"> TABLE BUG BY PRIORITY ASC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by priority_id asc;
				</cfquery>
			<cfelseif isDefined("sort_by") and (sort_by is "priority_desc")>
				<h3 style="color:Crimson"> TABLE BUG BY PRIORITY DESC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by priority_id desc;
				</cfquery>			
				
			<cfelseif isDefined("sort_by") and (sort_by is "severity_asc")>
				<h3 style="color:Crimson"> TABLE BUG BY SEVERITY ASC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by severity_id asc;
				</cfquery>
			<cfelseif isDefined("sort_by") and (sort_by is "severity_desc")>
				<h3 style="color:Crimson"> TABLE BUG BY SEVERITY DESC </h3>
				<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
					select * from bug order by severity_id desc;
				</cfquery>
			</cfif>	
							
			<cftable query="q" border="yes" colspacing="1" colheaders="yes" htmltable="yes">
				<cfcol header = "Bug ID" align="center" text = #bug_id#>
				<cfcol header = "Unique number" text = #unique_number#>
				<cfcol header = "Launch date" text = #launch_date#>
				<cfcol header = "Short description" text = #short_description#>
				<cfcol header = "Detailed description" text = #detailed_description#>
				<cfcol header = "User ID" text = #user_id#>
				<cfcol header = "Status id" text = #status_id#>
				<cfcol header = "Priority id" text = #priority_id#>
				<cfcol header = "Severity id" text = #severity_id#>
				<cfcol header="Actions" text="<a href='editbug.cfm?user_id=#user_id#?bug_id=#bug_id#'>edit</a>">	
			</cftable>
			<br>
			<input value="Add New Bug" type="button" onclick="location.href='newbug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
		</form>		
	</body>
</html>
