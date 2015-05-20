
<%@ page import="ejemplodeprimero.Asignatura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asignatura.label', default: 'Asignatura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asignatura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asignatura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="asignatura.departamento.label" default="Departamento" /></th>
					
						<g:sortableColumn property="creditos" title="${message(code: 'asignatura.creditos.label', default: 'Creditos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asignaturaInstanceList}" status="i" var="asignaturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asignaturaInstance.id}">${fieldValue(bean: asignaturaInstance, field: "departamento")}</g:link></td>
					
						<td>${fieldValue(bean: asignaturaInstance, field: "creditos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asignaturaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
