var LineChart = require("react-chartjs").Line;

function rand(min, max, num) {
  var rtn = [];
  while (rtn.length < num) {
    rtn.push((Math.random() * (max - min)) + min);
  }
  return rtn;
}

var AccountsGraph = module.exports = React.createClass({
  render: function() {
    var chartData = {
      labels: this.props.labels,
      datasets: [
        {
          label: "Invoices",
          fillColor: "rgba(220,220,220,0.2)",
          strokeColor: "rgba(220,220,220,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: this.props.invoices.map(i => i.amount)
        },
        {
          label: "Payments",
          fillColor: "rgba(151,187,205,0.2)",
          strokeColor: "rgba(151,187,205,1)",
          pointColor: "rgba(151,187,205,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(151,187,205,1)",
          data: this.props.payments.map(function(p){return p.amount;})
        }
      ]
    };
    var chartOptions = {

    };
    var style = {
      width:"100%",
      hight: "600px"
    };
    return <LineChart data={chartData} options={chartOptions} style={style} />
  }
});
