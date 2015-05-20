
<%@ page import="ejemplodeprimero.Becario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'becario.label', default: 'Becario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-becario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-becario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'becario.email.label', default: 'Email')}" />
					
						<th><g:message code="becario.expediente.label" default="Expediente" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${becarioInstanceList}" status="i" var="becarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${becarioInstance.id}">${fieldValue(bean: becarioInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: becarioInstance, field: "expediente")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${becarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
