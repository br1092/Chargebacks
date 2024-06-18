namespace ALProject.ALProject;

using Microsoft.Sales.Setup;

pageextension 50102 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Dynamics 365 Sales")
        {
            group(Chargebacks)
            {
                field("Chargeback Account No."; Rec."Chargeback Account No.")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Chargeback No. Series"; Rec."Chargeback No. Series")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Chargeback Reversal No. Series"; Rec."Chargeback Reversal No. Series")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
            }
        }
    }
}
