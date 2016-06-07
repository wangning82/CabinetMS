<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>终端管理管理</title>
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
		<li class="active"><a href="${ctx}/terminal/terminal/">终端管理列表</a></li>
		<shiro:hasPermission name="terminal:terminal:edit"><li><a href="${ctx}/terminal/terminal/form">终端管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="terminal" action="${ctx}/terminal/terminal/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>终端编号：</label>
				<form:input path="no" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>终端名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${terminal.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${terminal.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>终端编号</th>
				<th>终端名称</th>
				<th>终端IP</th>
				<th>创建时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="terminal:terminal:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="terminal">
			<tr>
				<td><a href="${ctx}/terminal/terminal/form?id=${terminal.id}">
					${terminal.no}
				</a></td>
				<td>
					${terminal.name}
				</td>
				<td>
					${terminal.ip}
				</td>
				<td>
					<fmt:formatDate value="${terminal.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${terminal.remarks}
				</td>
				<shiro:hasPermission name="terminal:terminal:edit"><td>
    				<a href="${ctx}/terminal/terminal/form?id=${terminal.id}">修改</a>
					<a href="${ctx}/terminal/terminal/delete?id=${terminal.id}" onclick="return confirmx('确认要删除该终端管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>