<cfset request.dsn = "bug_tracking_system_1">
<cfset request.un = "root">
<cfset request.pw = "password">

<cfset user_id = "">
<cfset bug_id = "">


<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
	
<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
	
<input type="button" value="Quit" onclick="location.href='login.cfm'">
