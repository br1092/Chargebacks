namespace Chargebacks.Chargebacks;

using Microsoft.Sales.History;
using ALProject.ALProject;

pageextension 50104 SalesInvoiceStatsExt extends "Sales Invoice Stats."
{
    layout
    {
        addafter(AmountLCY)
        {
            field("Chargeback Amount"; Rec."Chargeback Amount")
            {
                ApplicationArea = All;
                Caption = 'Chargeback Amount';
                Visible = true;
            }
        }
    }
}
