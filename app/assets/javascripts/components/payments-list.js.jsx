var PaymentRow = React.createClass({

  render: function() {
    var {payment} = this.props;
    return(<tr>
      <td>{payment.date}</td>
      <td>{payment.client_id}</td>
      <td>#{payment.notes}</td>
      <td>${payment.amount}</td>
    </tr>);
  }
});


var PaymentList = React.createClass({
  styles: {
    width: '50%',
    float: 'left'
  },

  render: function() {
    var invoices = this.props.payments;
    return(<div style={this.styles}>
      <h1>{invoices.length} Payments</h1>
      <table>
        <tr>
          <th>Date</th>
          <th>Client</th>
          <th>Notes</th>
          <th>Amount</th>
        </tr>
        <tbody>
        {invoices.reverse().map(function(payment){
          return(<PaymentRow key={payment.id} payment={payment} />);
        })}
      </tbody>
      </table>
    </div>);
  }
});

module.exports = PaymentList;
