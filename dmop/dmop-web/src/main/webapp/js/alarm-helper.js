var SEVERITY_CRITICAL = 1;
var SEVERITY_MAJOR = 2;
var SEVERITY_MINOR = 3;
var SEVERITY_WARNING = 4;

var globalResourceTypeTree = null;
function initResourceTypeTree() {
	globalResourceTypeTree = null;
	$.post("resource/getResourceTypeTree", "", function(data) {
		if (data.commonMessage.success) {
			var resourceTypeTree = data.resourceTypeTree;
			var zTreeSettingResourceType = {
				check: {
					enable: false
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "pid"
					}
				},
				callback: {
					beforeClick: beforeClickResourceTypeTree,
					onDblClick: onDblClickResourceTypeTree
				}
			};
			globalResourceTypeTree = $.fn.zTree.init($("#resourceTypeTree"), zTreeSettingResourceType, resourceTypeTree);
			globalResourceTypeTree.expandAll(true);
		}
	});
}
function beforeClickResourceTypeTree(treeId, treeNode) {
	var check = (treeNode && treeNode.type == 'resource_type');
	return check;
}
function onDblClickResourceTypeTree(event, treeId, treeNode) {
	if(treeNode.type == 'resource_type') {
		selectResourceType();
	}
}
function showResourceTypeTree() {
	showResourceTypeTreeMenu("combotreeSearchEntityType", "divResourceTypeTreeWrapper");
	$("body").bind("mousedown", onBodyDownResourceType);
}
function showResourceTypeTreeMenu(id, wrapperId) {
	var textfieldObj = $("#" + id);
	var offset = $("#" + id).offset();
	$("#" + wrapperId).css({left:offset.left + "px", top:offset.top + textfieldObj.outerHeight() + "px"}).show();//slideDown("fast");
}
function hideMenuResourceTypeTree() {
	$("#divResourceTypeTreeWrapper").hide();
	$("body").unbind("mousedown", onBodyDownResourceType);
}	
function onBodyDownResourceType(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "divResourceTypeTreeWrapper" || $(event.target).parents("#divResourceTypeTreeWrapper").length>0)) {
		hideMenuResourceTypeTree();
	}
}
function selectResourceType() {
	var nodes = globalResourceTypeTree.getSelectedNodes();
	if (nodes.length == 1) {
		var oldResType = $("#hiddenSearchEntityType").val();
		
		setSearchEntityType(nodes[0].id, nodes[0].name);
		hideMenuResourceTypeTree();
		
		if (oldResType != nodes[0].id) {
			resetEntitySearchOnResTypeChange();
		}
	} else {
		showNoty("请选择【实体类型】", "info", false, "top");
	}
}
function onClickSelectResourceType() {
	selectResourceType();
}
function onClickCancelSelectResourceType() {
	hideMenuResourceTypeTree();
}
function setSearchEntityType(moc, mocName) {
	$("#combotreeSearchEntityType").val(mocName);
	$("#hiddenSearchEntityType").val(moc);
}

// 查询实体
function queryResourceEntity() {
	var entityType = $("#hiddenSearchEntityType").val();
	if (entityType == "") {
		showNoty("请选择报警实体类型", "error", false, "top");
		return;
	}
	
	var entityName = $("#searchEntityName").val();
	
	$('#dgSearchEntity').datagrid('load',{
		entityType: entityType,
		entityName: entityName
	});
}
//查询实体datagrid
var gSearchEntityDataGridInit = false;
function initSearchEntityDataGrid() {
	$('#dgSearchEntity').datagrid({
		//url:'resource/searchEntity',	//不能放在这里设置，会导致初始化就请求url的数据
		width: 'auto',
		height: '350px',
		pagination: true,
		columns:[[
			{field:'name',title:'名称',width:200},
			{field:'typeName',title:'类型',width:100}
		]],
		onDblClickRow: function(index,field,value) {
			$("#dgSearchEntity").datagrid("clearSelections");
			var row = $('#dgSearchEntity').datagrid('getData').rows[index];
			var rows = [row];
			rows = filterAlreadySelectedEntity(rows);
			addToSelectedEntityDataGrid(rows);
		}
	});
	$('#dgSearchEntity').datagrid("options").url = 'resource/searchEntity';
}
//已选择的实体datagrid
var gSelectedEntityDataGridInit = false;
function initSelectedEntityDataGrid() {
	$('#dgSelectedEntity').datagrid({
		width: 'auto',
		height: '350px',
		pagination: false,
		columns:[[
			{field:'name',title:'名称',width:200},
			{field:'typeName',title:'类型',width:100}
		]]
	});
}


function onClickBtnSelectAllEntity() {
	var rows = $("#dgSearchEntity").datagrid("getData").rows;
	rows = filterAlreadySelectedEntity(rows);
	addToSelectedEntityDataGrid(rows);
}
function onClickBtnSelectEntity() {
	var rows = $("#dgSearchEntity").datagrid("getSelections");
	rows = filterAlreadySelectedEntity(rows);
	addToSelectedEntityDataGrid(rows);
}
function onClickBtnRemoveEntity() {
	var rows = $("#dgSelectedEntity").datagrid("getSelections");
	
	for (var i = 0; i < rows.length; i++) {
		var index = $("#dgSelectedEntity").datagrid("getRowIndex", rows[i]);
		$("#dgSelectedEntity").datagrid("deleteRow", index);
	}
	
	gSelectedEntityCount -= rows.length;
	$(".spSelectedEntityCount").text(gSelectedEntityCount);
}
function onClickBtnRemoveAllEntity() {
	var rowsCount = $("#dgSelectedEntity").datagrid("getData").total;
	$("#dgSelectedEntity").datagrid("loadData", []);
	gSelectedEntityCount -= rowsCount;
	$(".spSelectedEntityCount").text(gSelectedEntityCount);
}
function filterAlreadySelectedEntity(rows) {
	var filterred = [];
	for (var i = 0; i < rows.length; i++) {
		if (!existInSelectedEntityDataGrid(rows[i])) {
			filterred.push(rows[i]);
		}
	}
	return filterred;
}
function existInSelectedEntityDataGrid(row) {
	var selectedRows = $('#dgSelectedEntity').datagrid('getData').rows;
	for (var i = 0; i < selectedRows.length; i++) {
		if (selectedRows[i].id == row.id && selectedRows[i].type == row.type) {
			return true;
		}
	}
	return false;
}
var gSelectedEntityCount = 0;
var gMaxSelectedEntityCount = 20;
function addToSelectedEntityDataGrid(rows) {
	if (gSelectedEntityCount + rows.length > gMaxSelectedEntityCount) {
		showNoty("所选实体将超过最大可选择的数量!", "error", false, "top");
		return
	}
	for (var i = 0; i < rows.length; i++) {
		$('#dgSelectedEntity').datagrid('appendRow', rows[i]);
		gSelectedEntityCount++;
	}
	
	$(".spSelectedEntityCount").text(gSelectedEntityCount);
	
	$("#dgSearchEntity").datagrid("clearSelections");
}

function onClickBtnConfirmSelectEntity() {
	toggleAdvanceSearchPanel();
}
function resetEntitySearch() {
	$("#combotreeSearchEntityType").val("");
	$("#hiddenSearchEntityType").val("");
	resetEntitySearchOnResTypeChange();
}

function resetEntitySearchOnResTypeChange() {
	$("#searchEntityName").val("");

	$("#dgSearchEntity").datagrid("loadData", []);
	$("#dgSelectedEntity").datagrid("loadData", []);
	gSelectedEntityCount = 0;
	$(".spSelectedEntityCount").text(gSelectedEntityCount);
}

function toggleAdvanceSearchPanel() {
	$("#advSearchPanel").toggle();
	
	if ($("#advSearchPanel").is(":hidden")) {
		$("#btnToggleSearchPanel").removeClass("btn-expand-border").removeClass("dropup").addClass("btn-collapse-border");
	} else {
		$("#btnToggleSearchPanel").removeClass("btn-collapse-border").addClass("btn-expand-border").addClass("dropup");
		if (!gSearchEntityDataGridInit) {
			initSearchEntityDataGrid();
			gSearchEntityDataGridInit = true;
		}
		if (!gSelectedEntityDataGridInit) {
			initSelectedEntityDataGrid();
			gSelectedEntityDataGridInit = true;
		}
	}
}
function getSelectedEntityIds() {
	var ids = [];
	if (!gSelectedEntityDataGridInit) {
		return ids;
	}
	
	var selectedRows = $('#dgSelectedEntity').datagrid('getData').rows;
	for (var i = 0; i < selectedRows.length; i++) {
		ids.push(selectedRows[i].id);
	}
	
	return ids.join(",");
}