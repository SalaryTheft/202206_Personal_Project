let finaldata = [];

$(document).ready(function() {
	$.ajax({
		url: "./crimedata.do",
		type: "GET",
		dataType: "json",
		success: function(data) {
			data = data["data"];
			for (let i = 0; i < data.length; i++) {
				if (data[i]["구분"] == "발생건수") {
					let yearlydata = {
						'연도': data[i]["연도"],
						'계정도용': data[i]["해킹(계정도용)"],
						'단순침입': data[i]["해킹(단순침입)"],
						'자료유출': data[i]["해킹(자료유출)"],
						'자료훼손': data[i]["해킹(자료훼손)"]
					}
					finaldata.push(Object.assign(yearlydata));
				}
			}
			finaldata.reverse();
			drawChart(finaldata);
			drawTable(finaldata);
		}
	});
});

$(window).on('resize', function() {
	$("#echart").empty();
	$("#echart").removeAttr("_echarts_instance_");
	drawChart(finaldata);
});

function drawChart(finaldata) {
	let customTheme = {
		version: 1,
		themeName: "customed",
		theme: {
			seriesCnt: 3,
			backgroundColor: "rgba(255,255,255,0)",
			title: {
				textStyle: {
					fontWeight: "lighter",
					color: "#008acd"
				}
			},
			borderColor: "#ccc",
			dataZoom: {
				dataBackgroundColor: "#efefff79",
				dataColor: "rgba(47,69,84,0.3)",
				fillerColor: "#edf2f979",
				handleColor: "#008acd79",
				handleWidth: "100"
			},
			categoryAxis: {
				axisLabel: {
					color: "#ccc"
				},
				axisLine: {
					lineStyle: {
						color: "#fff"
					}
				},
				splitLine: {
					lineStyle: {
						color: ["#fff"]
					}
				}
			},
			valueAxis: {
				axisLabel: {
					color: "#fff"
				}
			}
		}
	};

	let dom = document.getElementById("echart");
	let myChart = echarts.init(dom, customTheme.theme);
	let app = {};
	let option;

	option = {
		tooltip: {
			trigger: 'axis'
		},
		legend: {
			data: ['계정도용', '단순침입', '자료유출', '자료훼손'],
			textStyle: {
				color: 'darkgray'
			}
		},
		grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
		},
		xAxis: {
			type: 'category',
			boundaryGap: false,
			data: finaldata.map(row => row["연도"])
		},
		yAxis: {
			type: 'value'
		},
		series: [
			{
				name: '계정 도용',
				data: finaldata.map(row => row["계정도용"]),
				type: 'line'
			},
			{
				name: '단순침입',
				data: finaldata.map(row => row["단순침입"]),
				type: 'line'
			},
			{
				name: '자료유출',
				data: finaldata.map(row => row["자료유출"]),
				type: 'line'
			},
			{
				name: '자료훼손',
				data: finaldata.map(row => row["자료훼손"]),
				type: 'line'
			}
		]
	};

	if (option && typeof option === 'object') {
		myChart.setOption(option);
	}
}

function drawTable(finaldata) {
	$tbody = $("#stats_table > tbody");
	for (let i = 0; i < finaldata.length; i++) {
		let year = finaldata[i]["연도"];
		let d1 = finaldata[i]["계정도용"];
		let d2 = finaldata[i]["단순침입"];
		let d3 = finaldata[i]["자료유출"];
		let d4 = finaldata[i]["자료훼손"];
		let total = d1 + d2 + d3 + d4;

		let tr = $("<tr>");
		tr.append($("<td>").text(year));
		tr.append($("<td>").text(d1));
		tr.append($("<td>").text(d2));
		tr.append($("<td>").text(d3));
		tr.append($("<td>").text(d4));
		tr.append($("<td>").text(total));
		$tbody.append(tr);
	}
}
