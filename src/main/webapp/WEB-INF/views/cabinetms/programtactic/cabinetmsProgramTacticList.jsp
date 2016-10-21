<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>节目策略管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/programtactic/cabinetmsProgramTactic/">节目策略列表</a></li>
		<shiro:hasPermission name="programtactic:cabinetmsProgramTactic:edit"><li><a href="${ctx}/programtactic/cabinetmsProgramTactic/form">节目策略添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cabinetmsProgramTactic" action="${ctx}/programtactic/cabinetmsProgramTactic/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>策略名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cabinetmsProgramTactic.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cabinetmsProgramTactic.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>策略状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('programStrategyType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>策略名称</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>创建时间</th>
				<th>备注信息</th>
				<th>策略状态</th>
				<shiro:hasPermission name="programtactic:cabinetmsProgramTactic:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cabinetmsProgramTactic">
			<tr>
				<td><a href="${ctx}/programtactic/cabinetmsProgramTactic/form?id=${cabinetmsProgramTactic.id}">
					${cabinetmsProgramTactic.name}
				</a></td>
				<td>
					${cabinetmsProgramTactic.starttime}
				</td>
				<td>
					${cabinetmsProgramTactic.endtime}
				</td>
				<td>
					<fmt:formatDate value="${cabinetmsProgramTactic.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${cabinetmsProgramTactic.remarks}
				</td>
				<td>
					${fns:getDictLabel(cabinetmsProgramTactic.status, 'programStrategyType', '')}
				</td>
				<shiro:hasPermission name="programtactic:cabinetmsProgramTactic:edit"><td>
					<!-- 待提交状态可以编辑 -->
					<c:if test="${cabinetmsProgramTactic.status eq '1' }">
    					<a href="${ctx}/programtactic/cabinetmsProgramTactic/form?id=${cabinetmsProgramTactic.id}">修改</a>
					</c:if>
					<!-- 待提交状态和待发布状态可以删除 -->
					<c:if test="${cabinetmsProgramTactic.status eq '1' or cabinetmsProgramTactic.status eq '2'}">
    					<a href="${ctx}/programtactic/cabinetmsProgramTactic/delete?id=${cabinetmsProgramTactic.id}" onclick="return confirmx('确认要删除该节目策略吗？', this.href)">删除</a>
					</c:if>
					<!-- 待提交状态可以提交 -->
					<c:if test="${cabinetmsProgramTactic.status eq '1' }">
    					<a href="${ctx}/programtactic/cabinetmsProgramTactic/updateStatus?id=${cabinetmsProgramTactic.id}&&status=2" onclick="return confirmx('确认要提交该节目策略吗？', this.href)">提交</a>
					</c:if>
					<!-- 待发布状态可以发布 -->
					<c:if test="${cabinetmsProgramTactic.status eq '2' }">
    					<a href="${ctx}/programtactic/cabinetmsProgramTactic/updateStatus?id=${cabinetmsProgramTactic.id}&&status=3" onclick="return confirmx('确认要发布该节目策略吗？', this.href)">发布</a>
					</c:if>
					<!-- 已发布状态可以撤销 和查看终端-->
					<c:if test="${cabinetmsProgramTactic.status eq '3' }">
						<a href="${ctx}/programtactic/cabinetmsProgramTactic/updateStatus?id=${cabinetmsProgramTactic.id}&&status=2" onclick="return confirmx('确认要撤销该节目策略吗？', this.href)">撤销</a>
						<a href="${ctx}/programtactic/cabinetmsProgramTactic/seeTerm?id=${cabinetmsProgramTactic.id}">查看终端</a>
					</c:if>
					<a href="${ctx}/programtactic/cabinetmsProgramTactic/form?id=${cabinetmsProgramTactic.id}">预览</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>