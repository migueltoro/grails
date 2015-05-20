<%@ page import="ejemplodeprimero.Despacho" %>



<div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'modulo', 'error')} required">
	<label for="modulo">
		<g:message code="despacho.modulo.label" default="Modulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modulo" pattern="${despachoInstance.constraints.modulo.matches}" required="" value="${despachoInstance?.modulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'planta', 'error')} required">
	<label for="planta">
		<g:message code="despacho.planta.label" default="Planta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="planta" from="${0..4}" class="range" required="" value="${fieldValue(bean: despachoInstance, field: 'planta')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="despacho.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacidad" type="number" value="${despachoInstance.capacidad}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'centro', 'error')} required">
	<label for="centro">
		<g:message code="despacho.centro.label" default="Centro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="centro" name="centro.id" from="${ejemplodeprimero.Centro.list()}" optionKey="id" required="" value="${despachoInstance?.centro?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="despacho.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${despachoInstance.numero}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: despachoInstance, field: 'profesores', 'error')} ">
	<label for="profesores">
		<g:message code="despacho.profesores.label" default="Profesores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${despachoInstance?.profesores?}" var="p">
    <li><g:link controller="profesor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="profesor" action="create" params="['despacho.id': despachoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'profesor.label', default: 'Profesor')])}</g:link>
</li>
</ul>


</div>

