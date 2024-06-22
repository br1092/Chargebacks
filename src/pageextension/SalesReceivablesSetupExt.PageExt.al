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
                field("Chargeback Account No."; Rec."CB No. SeriesBGR")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Chargeback No. Series"; Rec."CB No. SeriesBGR")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Chargeback Reversal No. Series"; Rec."CB Reversal No. SeriesBGR")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
            }
        }
    }
}
