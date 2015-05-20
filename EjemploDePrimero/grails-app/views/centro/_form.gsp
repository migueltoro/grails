<%@ page import="ejemplodeprimero.Centro" %>



<div class="fieldcontain ${hasErrors(bean: centroInstance, field: 'departamentos', 'error')} ">
	<label for="departamentos">
		<g:message code="centro.departamentos.label" default="Departamentos" />
		
	</label>
	<g:select name="departamentos" from="${ejemplodeprimero.Departamento.list()}" multiple="multiple" optionKey="id" size="5" value="${centroInstance?.departamentos*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: centroInstance, field: 'espacios', 'error')} ">
	<label for="espacios">
		<g:message code="centro.espacios.label" default="Espacios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${centroInstance?.espacios?}" var="e">
    <li><g:link controller="espacio" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="espacio" action="create" params="['centro.id': centroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'espacio.label', default: 'Espacio')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: centroInstance, field: 'grados', 'error')} ">
	<label for="grados">
		<g:message code="centro.grados.label" default="Grados" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${centroInstance?.grados?}" var="g">
    <li><g:link controller="grado" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="grado" action="create" params="['centro.id': centroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grado.label', default: 'Grado')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: centroInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="centro.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${centroInstance?.nombre}"/>

</div>

