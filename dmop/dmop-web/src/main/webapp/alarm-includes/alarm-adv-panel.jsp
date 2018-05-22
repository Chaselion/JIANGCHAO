<%@ page pageEncoding="UTF-8"%>
				<div id="advSearchPanel" style="width:100%;display:none;margin-top:4px;padding-top:8px;border-top:thin solid #ccc;">
					<div style="width:100%;height:400px;">
						<div class="col-md-6" style="height:100%;border:1px solid #d6d6d6">
							<div id="searchEntityToolbar" style="padding:2px 5px;margin-top:3px;">
								<form class="form-inline" role="form">
									<div class="form-group">
										<label class="control-label">实体类型:</label>
										<input id="combotreeSearchEntityType" class="form-control" type="text" readonly style="width:120px;color:#555;background-color:#fff;cursor:pointer;">
										<input id="hiddenSearchEntityType" type="hidden" />
									</div>
									<div class="form-group">
										<label class="control-label">名称:</label>
										<input type="text" id="searchEntityName" name="searchEntityName" class="form-control" />
									</div>
									<button id="btnSearchEntity" class="btn btn-primary" type="button" >查询</button>
								</form>
							</div>
								
							<table id="dgSearchEntity" style="height:100%;width:100%">
							</table>
						</div>
							
						<div class="col-md-1" style="height:100%;">
							<button id="btnSelectAllEntity" class="btn btn-primary" type="button" style="width:60px;" > &gt;&gt; </button>
							<br />
							<br />
							<button id="btnSelectEntity" class="btn btn-primary" type="button" style="width:60px;" > &gt; </button>
							<br />
							<br />
							<button id="btnRemoveEntity" class="btn btn-primary" type="button" style="width:60px;" > &lt; </button>							
							<br />
							<br />
							<button id="btnRemoveAllEntity" class="btn btn-primary" type="button" style="width:60px;" > &lt;&lt; </button>							
						</div>
							
						<div class="col-md-5" style="height:100%;border:1px solid #d6d6d6">
							<div style="padding:2px 5px;margin-top:3px;">
								<form class="form-inline" role="form">
									<div class="form-group">
										<label class="control-label">已选择 <span class="spSelectedEntityCount" style="color:blue;">0</span> 个 / 最多 20个</label>
									</div>
								</form>
							</div>
								
							<table id="dgSelectedEntity" style="height:100%;width:100%">
							</table>
						</div>
					</div>
					<br />
					<button id="btnConfirmSelectEntity" class="btn btn-primary" type="button" > 确定 </button>
					<button id="btnEntityReset" class="btn btn-default" type="button"> 重置 </button>
				</div>
		
				<hr class="hr-margin-sm" />