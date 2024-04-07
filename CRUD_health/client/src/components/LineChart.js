// // components/LineChart.js
// import React from "react";
// import { Line } from "react-chartjs-2";
//
// function LineChart({ chartData }) {
//     return (
//         <div className="chart-container">
//             <h2 style={{ textAlign: "center" }}>Line Chart</h2>
//             <Line
//                 data = {chartData}
//                 options={{
//                     plugins: {
//                         title: {
//                             display: true,
//                             text: "Exam Results for metric i"
//                         },
//                         legend: {
//                             display: true
//                         }
//                     },
//                     elements: {
//                         line: {
//                             tension: 0, // Set line tension to 0 to get straight lines
//                         },
//                     },
//                     scales: {
//                         x: {
//                             type: "time",
//                             time: {
//                                 unit: "year",
//                                 displayFormats: {
//                                     year: "yyyy",
//                                 },
//                             },
//                         },
//                     }
//                 }}
//             />
//         </div>
//     );
// }
//
// export default LineChart;


import React from "react";
import { Line } from "react-chartjs-2";

function LineChart({ chartData }) {
    if (AllExamResultsForMetric.length === 0) {
        return <p>No data available</p>;
    }

    const data = {
        labels: chartData.map((dataPoint) => dataPoint.date),
        datasets: [
            {
                label: "Metric Result",
                data: chartData.map((dataPoint) => dataPoint.metric_result),
                fill: false,
                borderColor: "blue",
                backgroundColor: "blue",
                tension: 0.1,
            },
            {
                label: "Male Range",
                data: chartData.map((dataPoint) => dataPoint.max_value_male),
                fill: "+1",
                borderColor: "green",
                backgroundColor: "rgba(0, 255, 0, 0.1)",
                tension: 0.1,
            },
            {
                label: "Female Range",
                data: chartData.map((dataPoint) => dataPoint.max_value_female),
                fill: "-1",
                borderColor: "pink",
                backgroundColor: "rgba(255, 0, 255, 0.1)",
                tension: 0.1,
            },
        ],
    };

    const options = {
        plugins: {
            title: {
                display: true,
                text: "Exam Results for metric i",
            },
            legend: {
                display: true,
            },
        },
        scales: {
            x: {
                type: "time",
                time: {
                    unit: "year",
                    displayFormats: {
                        year: "yyyy",
                    },
                },
            },
            y: {
                min: Math.min(
                    ...chartData.map((dataPoint) => dataPoint.metric_result),
                    ...chartData.map((dataPoint) => dataPoint.min_value_male),
                    ...chartData.map((dataPoint) => dataPoint.min_value_female)
                ),
                max: Math.max(
                    ...chartData.map((dataPoint) => dataPoint.metric_result),
                    ...chartData.map((dataPoint) => dataPoint.max_value_male),
                    ...chartData.map((dataPoint) => dataPoint.max_value_female)
                ),
            },
        },
    };

    return (
        <div className="chart-container">
            <h2 style={{ textAlign: "center" }}>Line Chart</h2>
            <Line data={data} options={options} />
        </div>
    );
}

export default LineChart;