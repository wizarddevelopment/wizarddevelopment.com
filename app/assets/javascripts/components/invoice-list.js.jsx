var InvoiceRow = React.createClass({

  render: function() {
    var invoice = this.props.invoice;
    return(<tr>
      <td>{invoice.date}</td>
      <td><a href={invoice.public_url} target="blank">#{invoice.number}</a></td>
      <td>{invoice.organization}</td>
      <td>${invoice.amount}</td>
      <td>${invoice.paid}</td>
    </tr>);
  }
});


var InvoiceList = React.createClass({
  styles: {
    width: '50%',
    float: 'left'
  },

  render: function() {
    var invoices = this.props.invoices;
    return(<div style={this.styles}>
      <h1>{invoices.length} Invoices</h1>
      <table>
        <tr>
          <th>Date</th>
          <th>Number</th>
          <th>Client</th>
          <th>Amount</th>
          <th>Paid</th>
        </tr>
        <tbody>
        {invoices.reverse().map(function(invoice){
          return(<InvoiceRow key={invoice.number} invoice={invoice} />);
        })}
      </tbody>
      </table>
    </div>);
  }
});

module.exports = InvoiceList;
