
<%@ page import="ejemplodeprimero.BloqueDeTutorias" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bloqueDeTutorias.label', default: 'BloqueDeTutorias')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bloqueDeTutorias" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bloqueDeTutorias" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="bloqueDeTutorias.profesor.label" default="Profesor" /></th>
					
						<g:sortableColumn property="diaDeSemana" title="${message(code: 'bloqueDeTutorias.diaDeSemana.label', default: 'Dia De Semana')}" />
					
						<g:sortableColumn property="horaDeComienzo" title="${message(code: 'bloqueDeTutorias.horaDeComienzo.label', default: 'Hora De Comienzo')}" />
					
						<g:sortableColumn property="horaDeFinalizacion" title="${message(code: 'bloqueDeTutorias.horaDeFinalizacion.label', default: 'Hora De Finalizacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bloqueDeTutoriasInstanceList}" status="i" var="bloqueDeTutoriasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bloqueDeTutoriasInstance.id}">${fieldValue(bean: bloqueDeTutoriasInstance, field: "profesor")}</g:link></td>
					
						<td>${fieldValue(bean: bloqueDeTutoriasInstance, field: "diaDeSemana")}</td>
					
						<td>${fieldValue(bean: bloqueDeTutoriasInstance, field: "horaDeComienzo")}</td>
					
						<td>${fieldValue(bean: bloqueDeTutoriasInstance, field: "horaDeFinalizacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bloqueDeTutoriasInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
