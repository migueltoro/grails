<%@ page import="ejemplodeprimero.Departamento" %>



<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'asignaturas', 'error')} ">
	<label for="asignaturas">
		<g:message code="departamento.asignaturas.label" default="Asignaturas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departamentoInstance?.asignaturas?}" var="a">
    <li><g:link controller="asignatura" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asignatura" action="create" params="['departamento.id': departamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asignatura.label', default: 'Asignatura')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="departamento.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${departamentoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'profesores', 'error')} ">
	<label for="profesores">
		<g:message code="departamento.profesores.label" default="Profesores" />
		
	</label>
	<g:select name="profesores" from="${ejemplodeprimero.Profesor.list()}" multiple="multiple" optionKey="id" size="5" value="${departamentoInstance?.profesores*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'seminarios', 'error')} ">
	<label for="seminarios">
		<g:message code="departamento.seminarios.label" default="Seminarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departamentoInstance?.seminarios?}" var="s">
    <li><g:link controller="seminario" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="seminario" action="create" params="['departamento.id': departamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'seminario.label', default: 'Seminario')])}</g:link>
</li>
</ul>


</div>

