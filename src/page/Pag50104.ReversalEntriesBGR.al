namespace Chargebacks.Chargebacks;

using Microsoft.Finance.GeneralLedger.Reversal;

page 50104 ReversalEntriesBGR
{
    ApplicationArea = All;
    Caption = 'ReversalEntriesBGR';
    PageType = List;
    SourceTable = "Reversal Entry";
    UsageCategory = History;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies erroneous postings that you want to undo by using the Reverse function.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the account number that the reversal was posted to.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the amount on the entry to be reversed.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ToolTip = 'Specifies the amount of the entry in LCY.';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ToolTip = 'Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                }
                field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
                {
                    ToolTip = 'Specifies the total of the ledger entries that represent credits, expressed in LCY.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the currency code for the amount on the line.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                }
                field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
                {
                    ToolTip = 'Specifies the total of the ledger entries that represent debits, expressed in LCY.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the record.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number of the transaction that created the entry.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the document type that the entry belongs to.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the value of the Entry Type field.', Comment = '%';
                }
                field("FA Posting Category"; Rec."FA Posting Category")
                {
                    ToolTip = 'Specifies the posting category that is used for fixed assets.';
                }
                field("FA Posting Type"; Rec."FA Posting Type")
                {
                    ToolTip = 'Specifies the posting type, if Account Type field contains Fixed Asset.';
                }
                field("G/L Register No."; Rec."G/L Register No.")
                {
                    ToolTip = 'Specifies the number of the general ledger register, where the general ledger entry in this record was posted.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the name of the journal batch, a personalized journal layout, that the entries were posted from.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Reversal Type"; Rec."Reversal Type")
                {
                    ToolTip = 'Specifies the value of the Reversal Type field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the source code that specifies where the entry was created.';
                }
                field("Source Currency Amount"; Rec."Source Currency Amount")
                {
                    ToolTip = 'Specifies the value of the Source Currency Amount field.', Comment = '%';
                }
                field("Source No."; Rec."Source No.")
                {
                    ToolTip = 'Specifies where the entry originated.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the source type that applies to the source number that is shown in the Source No. field.';
                }
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
                field("Transaction No."; Rec."Transaction No.")
                {
                    ToolTip = 'Specifies the number of the transaction that was reversed.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ToolTip = 'Specifies the amount of VAT that is included in the total amount.';
                }
            }
        }
    }
}
