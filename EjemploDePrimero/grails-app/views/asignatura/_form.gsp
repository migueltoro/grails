<%@ page import="ejemplodeprimero.Asignatura" %>



<div class="fieldcontain ${hasErrors(bean: asignaturaInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="asignatura.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${ejemplodeprimero.Departamento.list()}" optionKey="id" required="" value="${asignaturaInstance?.departamento?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: asignaturaInstance, field: 'creditos', 'error')} required">
	<label for="creditos">
		<g:message code="asignatura.creditos.label" default="Creditos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="creditos" value="${fieldValue(bean: asignaturaInstance, field: 'creditos')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: asignaturaInstance, field: 'profesores', 'error')} ">
	<label for="profesores">
		<g:message code="asignatura.profesores.label" default="Profesores" />
		
	</label>
	

</div>

