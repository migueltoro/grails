
<%@ page import="ejemplodeprimero.Tutoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tutoria.label', default: 'Tutoria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tutoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tutoria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="tutoria.profesor.label" default="Profesor" /></th>
					
						<th><g:message code="tutoria.alumno.label" default="Alumno" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'tutoria.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="horaDeComienzo" title="${message(code: 'tutoria.horaDeComienzo.label', default: 'Hora De Comienzo')}" />
					
						<g:sortableColumn property="minutoDeComienzo" title="${message(code: 'tutoria.minutoDeComienzo.label', default: 'Minuto De Comienzo')}" />
					
						<g:sortableColumn property="duracion" title="${message(code: 'tutoria.duracion.label', default: 'Duracion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tutoriaInstanceList}" status="i" var="tutoriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tutoriaInstance.id}">${fieldValue(bean: tutoriaInstance, field: "profesor")}</g:link></td>
					
						<td>${fieldValue(bean: tutoriaInstance, field: "alumno")}</td>
					
						<td><g:formatDate date="${tutoriaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: tutoriaInstance, field: "horaDeComienzo")}</td>
					
						<td>${fieldValue(bean: tutoriaInstance, field: "minutoDeComienzo")}</td>
					
						<td>${fieldValue(bean: tutoriaInstance, field: "duracion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tutoriaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
