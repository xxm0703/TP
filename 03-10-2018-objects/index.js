$(document).ready(function() {
	var _state = {};
	$('#btnShowState').click(function(){showState(_state);});

	$('#btnAddNode').click(function() {

		createNewAttributeControlls(_state, $('#items'));

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

function createNewAttributeControlls(state, parent) {
	var span = $("<span />");

	var jsonNodeKey = $("<input />", {id: 'key'});
	var colon = $("<span />");
	var jsonNodeValue = $("<input />", {id: 'value'});
	var update = $("<button />", {text:'Update'});
	var inner = $("<button />", {text:'InnerChild'});
	var remove = $("<button />", {text:'Remove'});
	var br = $("<br />");

	$(update).click(function() {
		updateState(state, $(this).parent());
	});

	$(inner).click(function() {
		createNewAttributeControlls(state[$(jsonNodeKey).val()], span);
	});

	$(remove).click(function() {
		removeByKey(state, $(this).parent());
		$(this).parent().remove();
	});


	span.append(jsonNodeKey);
    span.append(colon);
	span.append(jsonNodeValue);
	span.append(update);
	span.append(inner);
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
