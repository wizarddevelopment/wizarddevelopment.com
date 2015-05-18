var AccountsGraph = require('./accounts-graph');
var InvoiceList = require('./invoice-list');
var PaymentList = require('./payments-list');

var AccountDetails = module.exports = React.createClass({
  render: function() {
    var {invoices, payments} = this.props;
    return(<div>
      <AccountsGraph {...this.props.ledger} />
      <InvoiceList invoices={invoices}/>
      <PaymentList payments={payments}/>
    </div>);
  }
});
