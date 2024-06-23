namespace ALProject.ALProject;

using Microsoft.Sales.Setup;
using Microsoft.Foundation.NoSeries;
using Microsoft.Finance.GeneralLedger.Account;

tableextension 50100 SalesReceivablesSetupExt_BGR extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "CB Account No.BGR"; Code[20])
        {
            Caption = 'Chargeback Account No.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
            Tooltip = 'Chargeback Account No.';
        }
        field(50101; "CB No. SeriesBGR"; Code[20])
        {
            Caption = 'Chargeback No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Tooltip = 'Chargeback No. Series';
        }
        // field(50102; "CB Reversal No. SeriesBGR"; Code[20])
        // {
        //     Caption = 'Chargeback Reversal No. Series';
        //     DataClassification = CustomerContent;
        //     TableRelation = "No. Series";
        //     Tooltip = 'Chargeback Reversal No. Series';
        // }
    }
}
