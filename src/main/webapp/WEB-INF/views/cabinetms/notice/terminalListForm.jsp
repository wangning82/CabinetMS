<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>选择终端</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<form:form id="terminalForm" action="${ctx}/notice/cabinetmsNotice/publish" method="post" class="form-horizontal">
		<ul class="ul-form">
			<li><label>播放时间：</label>
				<input name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					   value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> -
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					   value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="clearfix"></li>
		</ul>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>终端名称</th>
				<th>终端IP</th>
				<th>机构</th>
				<th>终端状态</th>
				<th>选择</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cabinetmsTerminal">
			<tr>
				<td>
					${cabinetmsTerminal.terminalName}
				</td>
				<td>
					${cabinetmsTerminal.terminalIp}
				</td>
				<td>
					${cabinetmsTerminal.office.name}
				</td>
				<td>
					${fns:getDictLabel(cabinetmsTerminal.status, 'terminal_status', '')}
				</td>
				<td>
					<input type="checkbox" name="terminalId" value="${cabinetmsTerminal.id}">
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</form:form>
</body>
</html>