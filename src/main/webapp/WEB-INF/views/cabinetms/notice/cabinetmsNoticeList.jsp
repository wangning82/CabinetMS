<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>消息信息管理</title>
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
		<li class="active"><a href="${ctx}/notice/cabinetmsNotice/">消息信息列表</a></li>
		<shiro:hasPermission name="notice:cabinetmsNotice:edit"><li><a href="${ctx}/notice/cabinetmsNotice/form">消息信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cabinetmsNotice" action="${ctx}/notice/cabinetmsNotice/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>消息名称：</label>
				<form:input path="noticeName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>消息内容：</label>
				<form:input path="noticeContent" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>消息状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('notice_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>消息名称</th>
				<th>消息内容</th>
				<th>消息状态</th>
				<th>创建者</th>
				<shiro:hasPermission name="notice:cabinetmsNotice:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cabinetmsNotice">
			<tr>
				<td><a href="${ctx}/notice/cabinetmsNotice/form?id=${cabinetmsNotice.id}">
					${cabinetmsNotice.noticeName}
				</a></td>
				<td>
					${cabinetmsNotice.noticeContent}
				</td>
				<td>
					${fns:getDictLabel(cabinetmsNotice.status, 'notice_status', '')}
				</td>
				<td>
					${cabinetmsNotice.createBy.id}
				</td>
				<shiro:hasPermission name="notice:cabinetmsNotice:edit"><td>
    				<a href="${ctx}/notice/cabinetmsNotice/form?id=${cabinetmsNotice.id}">修改</a>
					<a href="${ctx}/notice/cabinetmsNotice/delete?id=${cabinetmsNotice.id}" onclick="return confirmx('确认要删除该消息信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>