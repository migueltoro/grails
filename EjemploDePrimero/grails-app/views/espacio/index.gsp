
<%@ page import="ejemplodeprimero.Espacio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'espacio.label', default: 'Espacio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-espacio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-espacio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="modulo" title="${message(code: 'espacio.modulo.label', default: 'Modulo')}" />
					
						<g:sortableColumn property="planta" title="${message(code: 'espacio.planta.label', default: 'Planta')}" />
					
						<g:sortableColumn property="capacidad" title="${message(code: 'espacio.capacidad.label', default: 'Capacidad')}" />
					
						<th><g:message code="espacio.centro.label" default="Centro" /></th>
					
						<g:sortableColumn property="numero" title="${message(code: 'espacio.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${espacioInstanceList}" status="i" var="espacioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${espacioInstance.id}">${fieldValue(bean: espacioInstance, field: "modulo")}</g:link></td>
					
						<td>${fieldValue(bean: espacioInstance, field: "planta")}</td>
					
						<td>${fieldValue(bean: espacioInstance, field: "capacidad")}</td>
					
						<td>${fieldValue(bean: espacioInstance, field: "centro")}</td>
					
						<td>${fieldValue(bean: espacioInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${espacioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
