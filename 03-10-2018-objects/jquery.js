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
	var depth = parseInt($(parent).attr("depth"))+1;
	var span = $("<span />", {depth: depth, style: "padding-left:"+50*depth+"px"});
	var jsonNodeGlobalKey = $("<input />", {id: 'key'});
	var openBrac = $("<span />", {text : "{"});
	var jsonNodeLocalKey = $("<input />", {id: 'localKey'});
	var colon = $("<span />", {text : ":"});
	var jsonNodeValue = $("<input />", {id: 'value'});
	var closeBrac = $("<span />", {text : "}"});
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
		state[gKey] = innerObj;

	});

	$(newNode).click(function() {
		var gKey = span.children('#key').val();
		createNewAttributeControlls(state[gKey], span);
	});

	$(inner).click(function() {
		var gKey = span.children('#key').val();
		innerAttributeControlls(state[gKey], span);
	});

	$(remove).click(function() {
		removeByKey(state, span);
		span.remove();
	});

	span.append(jsonNodeGlobalKey);
	span.append(openBrac);
	span.append(jsonNodeLocalKey);
	span.append(colon);
	span.append(jsonNodeValue);
	span.append(closeBrac);
	span.append(newNode);
	span.append(update);
	span.append(inner);
	span.append(remove);
	span.append(br);

	parent.append(span);
}

function createNewAttributeControlls(state, parent) {
	var depth = parseInt($(parent).attr("depth"))+1;
	var span = $("<span />", {depth: depth, style: "padding-left:"+50*depth+"px"});
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
		span.remove();
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
		delete state[key];
		$(this).remove();
}
