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
	var jsonNodeGlobalKey = $("<input />", {id: 'globalKey'});
	var jsonNodeLocalKey = $("<input />", {id: 'localKey'});
	var colon = $("<span />", {text : ":"});
	var jsonNodeValue = $("<input />", {id: 'value'});
	var update = $("<button />", {text:'Update'});
	var remove = $("<button />", {text:'Remove'});
	var br = $("<br />");

	$(update).click(function() {
		var paren = $(this).parent();
		var gKey = $(paren).children('#globalKey').val();
		var lKey = $(paren).children('#localKey').val();
		var value = $(paren).children('#value').val();
		innerObj = {};
		innerObj[lKey] = value; 
		state[gKey] = innerObj;
		state = state[gKey];
	});

	$(remove).click(function() {
		removeByKey(state, $(this).parent());
		$(this).parent().remove();
	});

	span.append(jsonNodeGlobalKey);
	span.append(colon);
	span.append(jsonNodeLocalKey);
	span.append(colon);
	span.append(jsonNodeValue);
	span.append(update);
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
		delete state[key];
		$(this).remove();
}
