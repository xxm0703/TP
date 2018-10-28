$(document).ready(function() {
	var _state = {};
	$('#btnShowState').click(function(){showState(_state);});

	$('#btnAddNode').click(function() {
		createNewAttributeControlls(_state, $('#items'));
	});

	$('#btnInnerNode').click(function() {
		innerAttributeControlls(_state, $('#items'));
	});

});
function showState(state) {
	alert(JSON.stringify(state));
}

function updateState(state, parent) {
		var key = $(parent).children('#key').val();
		var value = $(parent).children('#value').val();
		state[key] = value;
}

function innerAttributeControlls(state, parent) {
	var span = $("<span />");
	var jsonNodeGlobalKey = $("<input />", {id: 'key'});
	var jsonNodeLocalKey = $("<input />", {id: 'localKey'});
	var colon = $("<span />", {text : ":"});
	var jsonNodeValue = $("<input />", {id: 'value'});
	var inner = $("<button />", {text:'Add Inner'});
	var newNode = $("<button />", {text:'Add Node'});
	var update = $("<button />", {text:'Update'});
	var remove = $("<button />", {text:'Remove'});
	var br = $("<br />");

	$(update).click(function() {
		var gKey = span.children('#key').val();
		var lKey = span.children('#localKey').val();
		var value = span.children('#value').val();
		innerObj = {};
		innerObj[lKey] = value;
		console.log(state);
		state[gKey] = innerObj;

	});

	$(newNode).click(function() {
		var gKey = span.children('#key').val();
		console.log(state);
		createNewAttributeControlls(state[gKey], span);
	});

	$(inner).click(function() {
		console.log(state);
		var gKey = span.children('#key').val();
		innerAttributeControlls(state, span);
	});

	$(remove).click(function() {
		span.remove();
		removeByKey(state, span);
	});

	span.append(jsonNodeGlobalKey);
	span.append(colon);
	span.append(jsonNodeLocalKey);
	span.append(colon);
	span.append(jsonNodeValue);
	span.append(newNode);
	span.append(update);
	span.append(inner);
	span.append(remove);
	span.append(br);

	parent.append(span);
}

function createNewAttributeControlls(state, parent) {
	var span = $("<span />");
	var jsonNodeKey = $("<input />", {text : "Key",id: 'key'});
	var colon = $("<span />", {text : ":"});
	var jsonNodeValue = $("<input />", {id: 'value'});
	var update = $("<button />", {text:'Update'});
	var remove = $("<button />", {text:'Remove'});
	var br = $("<br />");

	$(update).click(function() {
		updateState(state, $(this).parent());
	});

	$(remove).click(function() {
		removeByKey(state, $(this).parent());
		$(this).parent().remove();
	});


	span.append(jsonNodeKey);
	span.append(colon);
	span.append(jsonNodeValue);
	span.append(update);
	span.append(remove);
	span.append(br);

	parent.append(span);
}

function removeByKey(state, parent) {
		var key = $(parent).children('#key').val();
		console.log(key);
		console.log(state);
		delete state[key];
		$(this).remove();
}
