var layout = {
	scattermode: 'group',
	autosize: true,
	xaxis: {
		range: [0, 1000],
		rangeselector: {
			buttons: [{
					count: 100,
					label: '100',
					step: 'data',
					stepmode: 'backward'
				},
				{
					count: 1,
					label: 'All',
					step: 'all'
				}
			]
		},
		rangeslider: {}
	},
	shapes: [{
		editable: true,
		type: 'line',
		x0: '0',
		y0: 0,
		x1: '0',
		yref: 'paper',
		y1: 1,
		line: {
			color: 'grey',
			width: 1.5,
			dash: 'dot'
		}
	}]
};
const forkTravel = 150;
const detectionsNumber = Math.floor(600 * 4 / (Math.PI * 9.4) * forkTravel);
var divCounter = 0;

function map_range(value, low1, high1, low2, high2) {
	return low2 + (value - low1) * (high2 - low2) / (high1 - low1)
}
const input = document.getElementById('fileInput');
input.addEventListener('change', (event) => {
	const file = event.target.files[0];
	const reader = new FileReader();
	reader.onload = function(event) {
		//create new div for plotly
		var newDiv = document.createElement('div');
		document.body.appendChild(newDiv)
		newDiv.id = 'data' + divCounter;
		const contents = event.target.result;
		var dataPoints = contents.split(',').map(Number);
		//
		findMin = a => a.reduce((res, cur) => res > cur ? cur : res, Infinity);
		var minPoint = findMin(dataPoints);
		//var maxPoint=findMax(dataPoints);
		dataPoints = dataPoints.map(x => map_range(x, minPoint, minPoint + detectionsNumber, 0, forkTravel));
		var trace1 = {
			type: "scatter",
			mode: "line",
			x: Array.from(Array(dataPoints.length).keys()),
			y: dataPoints,
		};
		Plotly.newPlot('data' + divCounter++, [trace1], layout);
		var bottomOutNumbers = 0;
		var incremented = false;
		for (var i = 0; i < dataPoints.length; i++) {
			while (dataPoints[i] > forkTravel - 5) {
				if (!incremented) {
					bottomOutNumbers++;
					incremented = true;
				}
				i++;
			}
			incremented = false;
		}
		console.log("bottom outs:" + bottomOutNumbers);
		findMax = a => a.reduce((res, cur) => res < cur ? cur : res, -Infinity);
		console.log("percentuale usata forca: " + (findMax(dataPoints) * 100 / forkTravel));
		const mode = a =>
			Object.values(
				a.reduce((count, e) => {
					if (!(e in count)) {
						count[e] = [0, e];
					}
					count[e][0]++;
					return count;
				}, {})
			).reduce((a, v) => v[0] < a[0] ? a : v, [0, null])[1];
		var mostUsed = mode(dataPoints);
		console.log("valore piu' usato: " + Math.trunc(mostUsed * 100) / 100 + ", " + Math.trunc((mostUsed * (100 / forkTravel)) * 100) / 100 + "%");

		function addTable(bottomOutNumber, mostUsedPercentage, usedForkPercentage) {
			// Creazione della tabella
			var table = document.createElement("table");
			var row = document.createElement("tr");
			var cell = document.createElement("td");
			var cellText = document.createTextNode("bottom out number");
			cell.appendChild(cellText);
			row.appendChild(cell);
			cell = document.createElement("td");
			cellText = document.createTextNode(bottomOutNumber);
			cell.appendChild(cellText);
			row.appendChild(cell);
			table.appendChild(row);
			row = document.createElement("tr");
			cell = document.createElement("td");
			cellText = document.createTextNode("most used");
			cell.appendChild(cellText);
			row.appendChild(cell);
			cell = document.createElement("td");
			cellText = document.createTextNode(mostUsedPercentage + "%");
			cell.appendChild(cellText);
			row.appendChild(cell);
			table.appendChild(row);
			row = document.createElement("tr");
			cell = document.createElement("td");
			cellText = document.createTextNode("used fork");
			cell.appendChild(cellText);
			row.appendChild(cell);
			cell = document.createElement("td");
			cellText = document.createTextNode(usedForkPercentage + "%");
			cell.appendChild(cellText);
			row.appendChild(cell);
			table.appendChild(row);
			document.body.appendChild(table);
		}
		addTable(bottomOutNumbers, Math.trunc((mostUsed * (100 / forkTravel)) * 100) / 100, Math.trunc(findMax(dataPoints) * 100 / forkTravel));
	};
	reader.readAsText(file);
});
