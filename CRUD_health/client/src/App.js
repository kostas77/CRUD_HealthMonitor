import React, {useState, useEffect} from "react";
import Chart from "chart.js/auto";
import {CategoryScale} from "chart.js";
import 'chartjs-adapter-date-fns';
import './App.css';
import Axios from 'axios'
import {testData} from "./testData";
import PieChart from "./components/PieChart";
import BarChart from "./components/BarChart";
import LineChart from "./components/LineChart";

Chart.register(CategoryScale);

function App() {

    const [name, setName] = useState('')
    const [address, setAddress] = useState('')
    const [website, setWebsite] = useState('')
    const [healthMetricsCategories, setHealthMetricsCategories] = useState([])
    const [allExamResultsForMetric, setAllExamResultsForMetric] = useState([])
    const [chartData, setChartData] = useState({})

    function generateChartData(examResults) {
        const labels = examResults.map(result => result.date);
        const data = examResults.map(result => result.metric_result);
        return {
            labels: labels,
            datasets: [{
                label: 'Exam Results',
                data: data,
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                tension: 0.1
            }]
        };
    }

    useEffect(() => {
        Axios.get("http://localhost:3001/api/get/").then((response) => {
            setHealthMetricsCategories(response.data);
        })
    }, [])

    useEffect(() => {
        Axios.get("http://localhost:3001/api/getAllExamResultsForMetric/2/").then((response) => {
            setAllExamResultsForMetric(response.data);
            if (response.data.length > 0) {
                setChartData(generateChartData(response.data));
            }
        })
    }, [])

    const submitExamProvider = () => {
        Axios.post("http://localhost:3001/api/insert/", {
            nameParam: name,
            addressParam: address,
            websiteParam: website
        }).then(() => {
            alert("successful insert")
        });
    };

    return (
        <div className="App">
            <h1>CRUD APPLICATION</h1>

            <div className="form">
                <label>name:</label>
                <input
                    type="text"
                    name="name"
                    onChange={(e) => {
                        setName(e.target.value);
                    }}/>
                <label>address:</label>
                <input
                    type="text"
                    name="address"
                    onChange={(e) => {
                        setAddress(e.target.value);
                    }}/>
                <label>website:</label>
                <input
                    type="text"
                    name="website"
                    onChange={(e) => {
                        setWebsite(e.target.value);
                    }}/>

                <button onClick={submitExamProvider}> Submit Exam Provider</button>

                <div>
                    {console.log("---------------ALL EXAM RESULTS OBJECT-----------------")}
                    {console.log({allExamResultsForMetric})}
                </div>

                <div>
                    <h1>{allExamResultsForMetric[1].name}</h1>
                    <table>
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>Result</th>
                            <th>Units</th>
                        </tr>
                        </thead>
                        <tbody>
                        {allExamResultsForMetric.map((val) => {
                            return (
                                <tr>
                                    <td>{val.date}</td>
                                    <td>{val.metric_result}</td>
                                    <td>{val.units}</td>
                                </tr>
                            )
                        })}
                        </tbody>
                    </table>
                </div>
            </div>
            {/*<div>*/}
            {/*    /!*<h2>Pie Chart Example</h2>*!/*/}
            {/*    /!*<PieChart chartData={chartData} />*!/*/}
            {/*    /!*<h2>Bar Chart Example</h2>*!/*/}
            {/*    /!*<BarChart chartData={chartData} />*!/*/}
            {/*    /!*<h2>Line Chart Example</h2>*!/*/}
            {/*    /!*<LineChart AllExamResultsForMetric={AllExamResultsForMetric} />*!/*/}
            {/*    {console.log("---------------CHART DATA passing to line chart-----------------")}*/}
            {/*    {console.log({chartData})}*/}
            {/*    /!*<LineChart chartData={chartData} />*!/*/}
            {/*</div>*/}
            {Object.keys(chartData).length > 0 && (
                <div>
                    <h2>Line Chart Example</h2>
                    <LineChart chartData={chartData} />
                </div>
            )}

        </div>
    );
}

export default App;
