namespace Chargebacks.Chargebacks;

using Microsoft.Sales.History;
using ALProject.ALProject;

tableextension 50101 SalesInvoiceHeaderExt extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Chargeback Amount"; Decimal)
        {
            Caption = 'Chargeback Amount';
            FieldClass = FlowField;
            CalcFormula = sum(ChargebackEntry.Amount where("App-to Document No." = field("No."), Status = const(Posted)));
        }
    }
}
