namespace Chargebacks.Chargebacks;

page 50103 PostedChargebacksSubform_BGR
{
    ApplicationArea = All;
    Caption = 'Posted Chargebacks';
    PageType = ListPart;
    SourceTable = ChargebackEntry_BGR;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // Visible = PostedChargebacksVisible;
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Chargeback Status field.';
                }
                // field("Cust. Ledger Entry No."; Rec."Cust. Ledger Entry No.")
                // {
                //     ToolTip = 'Specifies the value of the Cust. Ledger Entry No. field.';
                // }
                // field("Cust. Ledger Entry No. (Rev.)"; Rec."Cust. Ledger Entry No. (Rev.)")
                // {
                //     ToolTip = 'Specifies the value of the Cust. Ledger Entry No. (Reversal) field.';
                // }
                field("Chargeback No."; Rec."Chargeback No.")
                {
                    ToolTip = 'Specifies the value of the Chargeback No. field.';
                }
                // field("Reversal No."; Rec."Reversal No.")
                // {
                //     ToolTip = 'Specifies the value of the Reversal No. field.';
                // }
                // field("Customer No."; Rec."Customer No.")
                // {
                //     ToolTip = 'Specifies the value of the Customer No. field.';
                // }
                // field("Document No."; Rec."Document No.")
                // {
                //     ToolTip = 'Specifies the value of the Document No. field.';
                // }
                // field("Document Type"; Rec."Document Type")
                // {
                //     ToolTip = 'Specifies the value of the Document Type field.';
                // }
                // field(SystemCreatedAt; Rec.SystemCreatedAt)
                // {
                //     ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                // }
                // field(SystemCreatedBy; Rec.SystemCreatedBy)
                // {
                //     ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                // }
                // field(SystemId; Rec.SystemId)
                // {
                //     ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                // }
                // field(SystemModifiedAt; Rec.SystemModifiedAt)
                // {
                //     ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                // }
                // field(SystemModifiedBy; Rec.SystemModifiedBy)
                // {
                //     ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                // }
            }
        }
    }

    // var
    //     PostedChargebacksVisible: Boolean;

    // procedure SetVisibility(CustLedgerEntryNo: Integer)
    // var
    //     ChargebackEntry: Record ChargebackEntry;
    // begin
    //     PostedChargebacksVisible := false;
    //     ChargebackEntry.Reset();
    //     ChargebackEntry.SetRange("Cust. Ledger Entry No.", CustLedgerEntryNo);
    //     if ChargebackEntry.FindFirst() then
    //         PostedChargebacksVisible := true;
    // end;
}
