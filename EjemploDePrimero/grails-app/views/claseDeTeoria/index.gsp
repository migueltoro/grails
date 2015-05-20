
<%@ page import="ejemplodeprimero.ClaseDeTeoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'claseDeTeoria.label', default: 'ClaseDeTeoria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-claseDeTeoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-claseDeTeoria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="modulo" title="${message(code: 'claseDeTeoria.modulo.label', default: 'Modulo')}" />
					
						<g:sortableColumn property="planta" title="${message(code: 'claseDeTeoria.planta.label', default: 'Planta')}" />
					
						<g:sortableColumn property="capacidad" title="${message(code: 'claseDeTeoria.capacidad.label', default: 'Capacidad')}" />
					
						<th><g:message code="claseDeTeoria.centro.label" default="Centro" /></th>
					
						<g:sortableColumn property="numero" title="${message(code: 'claseDeTeoria.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${claseDeTeoriaInstanceList}" status="i" var="claseDeTeoriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${claseDeTeoriaInstance.id}">${fieldValue(bean: claseDeTeoriaInstance, field: "modulo")}</g:link></td>
					
						<td>${fieldValue(bean: claseDeTeoriaInstance, field: "planta")}</td>
					
						<td>${fieldValue(bean: claseDeTeoriaInstance, field: "capacidad")}</td>
					
						<td>${fieldValue(bean: claseDeTeoriaInstance, field: "centro")}</td>
					
						<td>${fieldValue(bean: claseDeTeoriaInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${claseDeTeoriaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
