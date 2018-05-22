function showNoty(text, type, modal, layout, timeout) {
	timeout = timeout || 3000;
	noty({
		text: text,
		type: type,
		dismissQueue: true,
		modal: modal,
		layout: layout,
		theme: 'defaultTheme',
		timeout: timeout
	});
}