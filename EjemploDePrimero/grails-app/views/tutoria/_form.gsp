<%@ page import="ejemplodeprimero.Tutoria" %>



<div class="fieldcontain ${hasErrors(bean: tutoriaInstance, field: 'profesor', 'error')} required">
	<label for="profesor">
		<g:message code="tutoria.profesor.label" default="Profesor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesor" name="profesor.id" from="${ejemplodeprimero.Profesor.list()}" optionKey="id" required="" value="${tutoriaInstance?.profesor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tutoriaInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="tutoria.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${ejemplodeprimero.Alumno.list()}" optionKey="id" required="" value="${tutoriaInstance?.alumno?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tutoriaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="tutoria.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${tutoriaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: tutoriaInstance, field: 'horaDeComienzo', 'error')} required">
	<label for="horaDeComienzo">
		<g:message code="tutoria.horaDeComienzo.label" default="Hora De Comienzo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="horaDeComienzo" from="${8..20}" class="range" required="" value="${fieldValue(bean: tutoriaInstance, field: 'horaDeComienzo')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tutoriaInstance, field: 'minutoDeComienzo', 'error')} required">
	<label for="minutoDeComienzo">
		<g:message code="tutoria.minutoDeComienzo.label" default="Minuto De Comienzo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="minutoDeComienzo" from="${tutoriaInstance.constraints.minutoDeComienzo.inList}" required="" value="${fieldValue(bean: tutoriaInstance, field: 'minutoDeComienzo')}" valueMessagePrefix="tutoria.minutoDeComienzo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tutoriaInstance, field: 'duracion', 'error')} required">
	<label for="duracion">
		<g:message code="tutoria.duracion.label" default="Duracion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="duracion" from="${tutoriaInstance.constraints.duracion.inList}" required="" value="${fieldValue(bean: tutoriaInstance, field: 'duracion')}" valueMessagePrefix="tutoria.duracion"/>

</div>

