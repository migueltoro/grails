<%@ page import="ejemplodeprimero.Grado" %>



<div class="fieldcontain ${hasErrors(bean: gradoInstance, field: 'asignaturas', 'error')} ">
	<label for="asignaturas">
		<g:message code="grado.asignaturas.label" default="Asignaturas" />
		
	</label>
	<g:select name="asignaturas" from="${ejemplodeprimero.Asignatura.list()}" multiple="multiple" optionKey="id" size="5" value="${gradoInstance?.asignaturas*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradoInstance, field: 'centro', 'error')} required">
	<label for="centro">
		<g:message code="grado.centro.label" default="Centro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="centro" name="centro.id" from="${ejemplodeprimero.Centro.list()}" optionKey="id" required="" value="${gradoInstance?.centro?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="grado.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${gradoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradoInstance, field: 'profesores', 'error')} ">
	<label for="profesores">
		<g:message code="grado.profesores.label" default="Profesores" />
		
	</label>
	<g:select name="profesores" from="${ejemplodeprimero.Profesor.list()}" multiple="multiple" optionKey="id" size="5" value="${gradoInstance?.profesores*.id}" class="many-to-many"/>

</div>

