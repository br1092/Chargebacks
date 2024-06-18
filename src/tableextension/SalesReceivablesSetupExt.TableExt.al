namespace ALProject.ALProject;

using Microsoft.Sales.Setup;
using Microsoft.Foundation.NoSeries;
using Microsoft.Finance.GeneralLedger.Account;

tableextension 50100 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Chargeback Account No."; Code[20])
        {
            Caption = 'Chargeback Account No.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(50101; "Chargeback No. Series"; Code[20])
        {
            Caption = 'Chargeback No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50102; "Chargeback Reversal No. Series"; Code[20])
        {
            Caption = 'Chargeback Reversal No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}
