<cfset request.dsn = "bug_tracking_system_1">
<cfset request.un = "root">
<cfset request.pw = "password">

<cfset short_description = "">
<cfset detailed_description = "">
<cfset status_id = "">
<cfset priority_id = "">
<cfset severity_id = "">
<cfset bug_id = "">
		
<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
	
<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">
<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#url.user_id#</cfoutput>'">

<input type="button" value="Quit" onclick="location.href='login.cfm'">


<form name="form1" method="post" action="<cfoutput>#cgi.script_name#?user_id=#user_id#</cfoutput>"> <!---"<cfoutput>show_table_bug.cfm?user_id=#user_id#</cfoutput>">--->
	<table>
		<tr>
			<th>Short description</th>
			<td><input type="text" name="short_description" value="<cfoutput>#short_description#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Detailed description</th>
			<td><input type="text" name="detailed_description" value="<cfoutput>#detailed_description#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Status id</th>
			<td><input type="text" name="status_id" value="<cfoutput>#status_id#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Priority id</th>
			<td><input type="text" name="priority_id" value="<cfoutput>#priority_id#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Severity id</th>
			<td><input type="text" name="severity_id" value="<cfoutput>#severity_id#</cfoutput>"></td>
		</tr>
	</table>
	
	<input type="hidden" name="user_id" value="<cfoutput>#url.user_id#</cfoutput>">
	
				
	<input type="submit" name="submit" value="Add bug">

</form>

<cfif IsDefined("form.user_id") >
		<cfquery name="new_bug" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		insert into bug (unique_number, launch_date, short_description, detailed_description, user_id, status_id, priority_id, severity_id)
		values (<cfqueryparam cfsqltype="cf_sql_varchar" value="#CreateUUID()#">,
			<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.short_description#">,
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.detailed_description#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#form.user_id#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#form.status_id#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#form.priority_id#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#form.severity_id#">)
		</cfquery>
</cfif>

<cfif IsDefined("form.user_id") >
		<cfquery name="bid" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		select max(bug_id) as bug_id
			from bug
		</cfquery>
		<cfset bug_id = bid.bug_id>
</cfif>

<cfif IsDefined("bug_id") and IsNumeric(bug_id)>
	<input type="hidden" name="bug_id" value="<cfoutput>#bug_id#</cfoutput>">
</cfif>

<cfif IsDefined("bug_id") and IsDefined("form.user_id") >	
	<cfquery name="insert_to_history" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
	insert into bug_history (bug_id, history_date, action_id, comment, user_id)
	values (
		<cfqueryparam cfsqltype="cf_sql_integer" value="#bug_id#">,
		<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
		<cfqueryparam cfsqltype="cf_sql_integer" value="#form.status_id#">,
		<cfqueryparam cfsqltype="cf_sql_varchar" value="add">,
		<cfqueryparam cfsqltype="cf_sql_integer" value="#form.user_id#">
		)
	</cfquery>
</cfif>


