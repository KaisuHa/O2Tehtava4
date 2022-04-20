<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type=text/css href="listaaasiakkaat.css"/>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>
<style>
.oikealle{
	text-align: right;
}
.varit{
color:lightblue;
}
</style>
</head>

<body>
	<table id="listaus">
		<thead>
			<tr>
				<th class="oikealle">Hakusana:</th>
				<th colspan="2"><input type="text" id="hakusana"></th>
				<th><input type="button" value="hae" id="hakunappi"></th>
			</tr>
			<tr>
				<th>Etunimi</th>
				<th>Sukuimi</th>
				<th>Puhelin</th>
				<th>S�hk�posti</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
<script>
	$(document).ready(function() {
	haeAsiakas();
		$("#hakunappi").click(function(){
			haeAsiakas();
		});
	});
	
	function haeAsiakas(){
		$("#listaus tbody").empty();

		$.ajax({
			url : "asiakkaat/"+$("#hakusana").val(),type: "GET",dataType : "json",success : function(result) {//Funktio palauttaa tiedot json-objektina	
				$.each(result.asiakkaat, function(i, field) {
					var htmlStr;
					htmlStr += "<tr>";
					htmlStr += "<td>" + field.etunimi + "</td>";
					htmlStr += "<td>" + field.sukunimi + "</td>";
					htmlStr += "<td>" + field.puhelin + "</td>";
					htmlStr += "<td>" + field.sposti + "</td>";
					htmlStr += "</tr>";
					$("#listaus tbody").append(htmlStr);
				});
			}});
	}
</script>
</html>