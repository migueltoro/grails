<%@ page import="ejemplodeprimero.Persona" %>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="persona.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${personaInstance?.email}"/>

</div>

