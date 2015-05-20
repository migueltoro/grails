<%@ page import="ejemplodeprimero.BloqueDeTutorias" %>



<div class="fieldcontain ${hasErrors(bean: bloqueDeTutoriasInstance, field: 'profesor', 'error')} required">
	<label for="profesor">
		<g:message code="bloqueDeTutorias.profesor.label" default="Profesor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesor" name="profesor.id" from="${ejemplodeprimero.Profesor.list()}" optionKey="id" required="" value="${bloqueDeTutoriasInstance?.profesor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bloqueDeTutoriasInstance, field: 'diaDeSemana', 'error')} required">
	<label for="diaDeSemana">
		<g:message code="bloqueDeTutorias.diaDeSemana.label" default="Dia De Semana" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="diaDeSemana" from="${bloqueDeTutoriasInstance.constraints.diaDeSemana.inList}" required="" value="${fieldValue(bean: bloqueDeTutoriasInstance, field: 'diaDeSemana')}" valueMessagePrefix="bloqueDeTutorias.diaDeSemana"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bloqueDeTutoriasInstance, field: 'horaDeComienzo', 'error')} required">
	<label for="horaDeComienzo">
		<g:message code="bloqueDeTutorias.horaDeComienzo.label" default="Hora De Comienzo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="horaDeComienzo" from="${8..20}" class="range" required="" value="${fieldValue(bean: bloqueDeTutoriasInstance, field: 'horaDeComienzo')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bloqueDeTutoriasInstance, field: 'horaDeFinalizacion', 'error')} required">
	<label for="horaDeFinalizacion">
		<g:message code="bloqueDeTutorias.horaDeFinalizacion.label" default="Hora De Finalizacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="horaDeFinalizacion" from="${8..20}" class="range" required="" value="${fieldValue(bean: bloqueDeTutoriasInstance, field: 'horaDeFinalizacion')}"/>

</div>

