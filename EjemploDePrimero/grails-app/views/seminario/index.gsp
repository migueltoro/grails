
<%@ page import="ejemplodeprimero.Seminario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seminario.label', default: 'Seminario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-seminario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-seminario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="modulo" title="${message(code: 'seminario.modulo.label', default: 'Modulo')}" />
					
						<g:sortableColumn property="planta" title="${message(code: 'seminario.planta.label', default: 'Planta')}" />
					
						<g:sortableColumn property="capacidad" title="${message(code: 'seminario.capacidad.label', default: 'Capacidad')}" />
					
						<th><g:message code="seminario.centro.label" default="Centro" /></th>
					
						<th><g:message code="seminario.departamento.label" default="Departamento" /></th>
					
						<g:sortableColumn property="numero" title="${message(code: 'seminario.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${seminarioInstanceList}" status="i" var="seminarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${seminarioInstance.id}">${fieldValue(bean: seminarioInstance, field: "modulo")}</g:link></td>
					
						<td>${fieldValue(bean: seminarioInstance, field: "planta")}</td>
					
						<td>${fieldValue(bean: seminarioInstance, field: "capacidad")}</td>
					
						<td>${fieldValue(bean: seminarioInstance, field: "centro")}</td>
					
						<td>${fieldValue(bean: seminarioInstance, field: "departamento")}</td>
					
						<td>${fieldValue(bean: seminarioInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${seminarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
