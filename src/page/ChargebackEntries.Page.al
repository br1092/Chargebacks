namespace ALProject.ALProject;

page 50102 ChargebackEntries
{
    ApplicationArea = All;
    Caption = 'Chargeback Entries';
    PageType = List;
    SourceTable = ChargebackEntry;
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Chargeback No."; Rec."Chargeback No.")
                {
                    ToolTip = 'Specifies the value of the Chargeback No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Document Type"; Rec."App-to Document Type")
                {
                    ToolTip = 'Specifies the value of the Applies-to Document Type field.';
                }
                field("Document No."; Rec."App-to Document No.")
                {
                    ToolTip = 'Specifies the value of the Applies-to Document No. field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Cust. Ledger Entry No."; Rec."Cust. Ledger Entry No.")
                {
                    ToolTip = 'Specifies the value of the Cust. Ledger Entry No. field.';
                }
                field("Applies-to Cust. Ledger Entry No."; Rec."App-to Cust. Ledger Entry No.")
                {
                    ToolTip = 'Specifies the value of the Applies-to Cust. Ledger Entry No. field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Chargeback Status field.';
                }
                // field("Reversed"; Rec."Reversed")
                // {
                //     ToolTip = 'Specifies the value of the Reversed field.';
                // }
                // field("Reversal No."; Rec."Reversal No.")
                // {
                //     ToolTip = 'Specifies the value of the Reversal No. field.';
                // }
                field("Cust. Ledger Entry No. (Rev.)"; Rec."Cust. Ledger Entry No. (Rev.)")
                {
                    ToolTip = 'Specifies the value of the Cust. Ledger Entry No. (Reversal) field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                // field(SystemCreatedAt; Rec.SystemCreatedAt)
                // {
                //     ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                // }
                // field(SystemCreatedBy; Rec.SystemCreatedBy)
                // {
                //     ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                // }
                // field(SystemId; Rec.SystemId)
                // {
                //     ToolTip = 'Specifies the value of the SystemId field.';
                // }
                // field(SystemModifiedAt; Rec.SystemModifiedAt)
                // {
                //     ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                // }
                // field(SystemModifiedBy; Rec.SystemModifiedBy)
                // {
                //     ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                // }
            }
        }
    }
    actions
    {
        area(processing)
        {
            group("Manage")
            {
                Caption = 'Manage';
                action(DeleteChargeback)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Delete Chargeback';
                    Enabled = true;
                    Image = New;
                    ToolTip = 'Deletes the selected Chargeback Entry.';

                    trigger OnAction()
                    begin
                        DeleteChargebackEntry(Rec);
                        CurrPage.Update();
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Manage';

                actionref(DeleteChargeback_Promoted; DeleteChargeback)
                {
                }
            }
        }
    }

    local procedure DeleteChargebackEntry(var ChargebackEntry: Record ChargebackEntry)
    var
        ChargebackManagement: Codeunit ChargebackManagementBGR;
    begin
        ChargebackManagement.DeleteChargebackEntry(ChargebackEntry."Entry No.");
    end;
}
