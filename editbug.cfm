<cfset request.dsn = "bug_tracking_system_1">
<cfset request.un = "root">
<cfset request.pw = "password">

<cfset list_id = "#url.user_id#">
<cfset user_id = listfirst(list_id, '?', true)>
<cfset bug_id = listlast(list_id, '=', true)>
		
<input type="hidden" value="<cfoutput>#user_id#</cfoutput>">
<input type="hidden" value="<cfoutput>#bug_id#</cfoutput>">

<input type="button" value="Show all bugs" onclick="location.href='show_table_bug.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
<input type="button" value="Add new bug" onclick="location.href='newbug.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
	
<input type="button" value="Edit user information" onclick="location.href='modifyuser.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
<input type="button" value="Add new user" onclick="location.href='newuser.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">
<input type="button" value="All users" onclick="location.href='show_users.cfm?user_id=<cfoutput>#user_id#</cfoutput>'">

<input type="button" value="Quit" onclick="location.href='login.cfm'">


<cfset unique_number = "">
<cfset launch_date = "">
<cfset short_description = "">
<cfset detailed_description = "">
<cfset status_id = "">
<cfset priority_id = "">
<cfset severity_id = "">
<cfset comment = "">

<cfif IsNumeric(bug_id)>
	<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		select * from bug 
		where bug_id = <cfqueryparam cfsqltype="cf_sql_bigint" value="#bug_id#"> ;
	</cfquery>
	<cfset unique_number = q.unique_number>
	<cfset launch_date = q.launch_date>
	<cfset short_description = q.short_description>
	<cfset detailed_description = q.detailed_description>
	<cfset status_id = q.status_id>
	<cfset priority_id = q.priority_id>
	<cfset severity_id = q.severity_id>
</cfif>

<form name="form1" method="post" action= "editbug.cfm<cfoutput>?user_id=#user_id#?bug_id=#bug_id#</cfoutput>">
	<br>
	<table>
		<tr>
			<th>Unique number</th>
			<td><input style="width:400px" type="text" name="unique_number" value="<cfoutput>#unique_number#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Launch date</th>
			<td><input style="width:400px" type="text" name="launch_date" value="<cfoutput>#launch_date#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Short description</th>
			<td><input style="width:400px" type="text" name="short_description" value="<cfoutput>#short_description#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Detailed description</th>
			<td><input style="width:400px" type="text" name="detailed_description" value="<cfoutput>#detailed_description#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Status id</th>
			<td><input style="width:400px" type="text" name="status_id" value="<cfoutput>#status_id#</cfoutput>"></td>
		</tr>
		<tr>
		<th>Priority id</th>
			<td><input style="width:400px" type="text" name="priority_id" value="<cfoutput>#priority_id#</cfoutput>"></td>
		</tr>
		<tr>
			<th>Severity id</th>
			<td><input style="width:400px" type="text" name="severity_id" value="<cfoutput>#severity_id#</cfoutput>"></td>
		</tr>
		<tr>
			<th><br>Comment for history</th>
			<td><br><input style="width:400px" type="text" name="comment" value="<cfoutput>#comment#</cfoutput>"></td>
		</tr>
	</table>
	<br>
	<input type="submit" name="submit" value="Save change">
	
	<input type="hidden" name="list_id" value="<cfoutput>#list_id#</cfoutput>">
	<input type="hidden" name="user_id" value="<cfoutput>#user_id#</cfoutput>">
	<input type="hidden" name="bug_id" value="<cfoutput>#bug_id#</cfoutput>">
</form>

<br>
<h3 style="color:Crimson"> Error history </h3>

<cfif IsDefined("bug_id") and IsNumeric(bug_id)>
	<cfquery name="q" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
		select * from bug_history
			where bug_id = <cfqueryparam cfsqltype="cf_sql_bigint" value="#bug_id#">;
	</cfquery>
	<cftable query="q" border="yes" colspacing="1" colheaders="yes" htmltable="yes">
		<cfcol header = "Bug ID" align="center" text = #bug_id#>
		<cfcol header = "Date" align="center" text = #history_date#>
		<cfcol header = "Action ID" text = #action_id#>
		<cfcol header = "Comment" text = #comment#>
		<cfcol header = "User ID" text = #user_id#>
	</cftable>
</cfif>

<cftry>
	<cfif IsDefined("form.bug_id") and (form.bug_id neq "")
		and IsDefined("form.unique_number") and (form.unique_number neq "") 
		and IsDefined("form.launch_date") and (form.launch_date neq "")
		and IsDefined("form.short_description") and (form.short_description neq "")
		and IsDefined("form.detailed_description") and (form.detailed_description neq "")
		and IsDefined("form.user_id") and (form.user_id neq "")
		and IsDefined("form.status_id") and (form.status_id neq "")
		and IsDefined("form.priority_id") and (form.priority_id neq "")
		and IsDefined("form.severity_id") and (form.severity_id neq "")>
			
			<cfquery name="update_bug" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
			update bug
			set unique_number = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.unique_number#">,
				launch_date = <cfqueryparam cfsqltype="cf_sql_date" value="#form.launch_date#">,
				short_description = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.short_description#">,
				detailed_description = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.detailed_description#">,
				user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.user_id#">,
				status_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.status_id#">,
				priority_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.priority_id#">,
				severity_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.severity_id#">
			where bug_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bug_id#">	
			</cfquery>
			
			<cfquery name="get_update_status_id" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
				select status_id 
					from bug where bug_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bug_id#">	
			</cfquery>
			
			<cfset status_id = get_update_status_id.status_id>
			
			
		<cfif IsDefined("form.comment")and (form.comment neq "") >	
			<cfquery name="insert_to_history" datasource="#request.dsn#" username="#request.un#" password="#request.pw#">
				insert into bug_history (bug_id, history_date, action_id, comment, user_id)
				values (
					<cfqueryparam cfsqltype="cf_sql_integer" value="#form.bug_id#">,
					<cfqueryparam cfsqltype="cf_sql_date" value="#launch_date#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#status_id#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.comment#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#form.user_id#">
					)
			</cfquery>
		</cfif>	
	</cfif>	
	<cfcatch>
		<p> ERROR </p>
	</cfcatch>
</cftry>

