<%@ page import="ejemplodeprimero.Expediente" %>



<div class="fieldcontain ${hasErrors(bean: expedienteInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="expediente.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${ejemplodeprimero.Alumno.list()}" optionKey="id" required="" value="${expedienteInstance?.alumno?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: expedienteInstance, field: 'notas', 'error')} ">
	<label for="notas">
		<g:message code="expediente.notas.label" default="Notas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${expedienteInstance?.notas?}" var="n">
    <li><g:link controller="nota" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="nota" action="create" params="['expediente.id': expedienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'nota.label', default: 'Nota')])}</g:link>
</li>
</ul>


</div>

