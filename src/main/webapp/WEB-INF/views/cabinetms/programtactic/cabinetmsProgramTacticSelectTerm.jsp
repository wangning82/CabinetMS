<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>策略发布管理</title>
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
	<form:form id="searchForm" modelAttribute="cabinetmsProgramTactic" action="${ctx}/programtactic/cabinetmsProgramTactic/termList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th></th>
					<th>终端名称</th>
					<th>所属机构</th>
					<th>ip</th>
					<th>终端状态</th>
					<th>所属策略</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="term" varStatus="status">
				<tr>
					<td><input type="checkbox" name="termList[${status.index }].id" value="${term.id }"/></td>
					<td>
						${term.terminalName}
					</td>
					<td>
						${term.office.code}
					</td>
					<td>
						${term.terminalIp}
					</td>
					<td>
						${term.status }
					</td>
					<td>
						<c:if test="${not empty term.programTactic.id }">
							策略中
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="pagination">${page}</div>
	</form:form>
</body>
</html>