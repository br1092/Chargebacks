namespace ALProject.ALProject;

using Microsoft.Sales.Receivables;
using Microsoft.Foundation.NoSeries;
using Microsoft.Sales.Setup;
using Microsoft.Finance.GeneralLedger.Posting;
using Chargebacks.Chargebacks;
using Microsoft.Finance.GeneralLedger.Journal;

page 50101 ApplyChargebacks_BGR
{
    ApplicationArea = All;
    Caption = 'Apply Chargebacks';
    PageType = Worksheet;
    SourceTable = ChargebackLine_BGR;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Applying Document';
                ShowCaption = true;
                // Caption = 'General';
                field(ApplyingPostingDate; ApplyingCustLedgEntry."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posting Date';
                    Editable = false;
                    ToolTip = 'Specifies the posting date of the entry to be applied. This date is used to find the correct exchange rate when applying entries in different currencies.';
                }
                field(ApplyingDocumentType; ApplyingCustLedgEntry."Document Type")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Document Type';
                    Editable = false;
                    ToolTip = 'Specifies the document type of the entry to be applied.';
                }
                field(ApplyingDocumentNo; ApplyingCustLedgEntry."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Document No.';
                    Editable = false;
                    ToolTip = 'Specifies the document number of the entry to be applied.';
                }
                field(ApplyingCustomerNo; ApplyingCustLedgEntry."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer No.';
                    Editable = false;
                    ToolTip = 'Specifies the customer number of the entry to be applied.';
                    Visible = false;
                }
                field(ApplyingCustomerName; ApplyingCustLedgEntry."Customer Name")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Name';
                    Editable = false;
                    ToolTip = 'Specifies the customer name of the entry to be applied.';
                    Visible = true;
                }
                field(ApplyingDescription; ApplyingCustLedgEntry.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the description of the entry to be applied.';
                    Visible = true;
                }
                field(ApplyingCurrencyCode; ApplyingCustLedgEntry."Currency Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Currency Code';
                    Editable = false;
                    ToolTip = 'Specifies the code for the currency that amounts are shown in.';
                }
                field(ApplyingAmount; ApplyingCustLedgEntry.Amount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Amount';
                    Editable = false;
                    ToolTip = 'Specifies the amount on the entry to be applied.';
                }
                field(ApplyingRemainingAmount; ApplyingCustLedgEntry."Remaining Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Remaining Amount';
                    Editable = false;
                    ToolTip = 'Specifies the amount on the entry to be applied.';
                }
            }
            group(ChargebackEntry)
            {
                Caption = 'Chargeback Entry';
                ShowCaption = true;
                repeater(RepeaterGeneral)
                {
                    // ShowCaption = false;
                    // field("Chargeback No."; Rec."Line No.")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     ToolTip = 'Specifies the Line No. to be used for the chargeback.';
                    // }
                    field("Posting Date"; Rec."Posting Date")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the Posting Date to be used for the chargeback.';
                    }
                    field("Account No."; Rec."Account No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the G/L Account No. to be used for the chargeback.';
                    }
                    field("Account Name"; Rec."Account Name")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'The Name of the selected G/L Account to be used for the chargeback.';
                    }
                    field(Description; Rec.Description)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the description of the chargeback.';
                    }
                    field(Amount; Rec.Amount)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the amount of the chargeback.';
                    }
                }
            }

            part(PostedChargebacksSubform; PostedChargebacksSubform_BGR)
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = true;
                SubPageLink = "Cust. Ledger Entry No." = field("Cust. Ledger Entry No.");
                UpdatePropagation = Both;
                Visible = PostedChargebacksVisible;
            }
            // group(PostedChargebacks)
            // {
            //     Caption = 'Posted Chargebacks';
            //     ShowCaption = true;
            //     Visible = PostedIsVisible;
            //     repeater(RepeaterPosted)
            //     {
            //         Editable = false;
            //         Visible = PostedIsVisible;
            //         // ShowCaption = false;
            //         field("PostedChargebackEntriesEntryNo"; PostedChargebackEntries."Entry No.")
            //         {
            //             Caption = 'Entry No.';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Entry No. of the Chargeback Entry.';
            //         }
            //         // field(PostedChargebackEntriesCustomerNo; PostedChargebackEntries."Customer No.")
            //         // {
            //         //     Caption = 'Customer No.';
            //         //     ApplicationArea = Basic, Suite;
            //         //     ToolTip = 'Specifies the Customer No. of the Chargeback Entry.';
            //         // }
            //         field(PostedChargebackEntriesAccountNo; PostedChargebackEntries."Account No.")
            //         {
            //             Caption = 'Account No.';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Account No. of the Chargeback Entry.';
            //         }
            //         field(PostedChargebackEntriesPostingDate; PostedChargebackEntries."Posting Date")
            //         {
            //             Caption = 'Posting Date';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Posting Date of the Chargeback Entry.';
            //         }
            //         // field(PostedChargebackEntriesDocumentType; PostedChargebackEntries."Document Type")
            //         // {
            //         //     Caption = 'Document Type';
            //         //     ApplicationArea = Basic, Suite;
            //         //     ToolTip = 'Specifies the Document Type of the Chargeback Entry.';
            //         // }
            //         // field(PostedChargebackEntriesDocumentNo; PostedChargebackEntries."Document No.")
            //         // {
            //         //     Caption = 'Document No.';
            //         //     ApplicationArea = Basic, Suite;
            //         //     ToolTip = 'Specifies the Document No. of the Chargeback Entry.';
            //         // }
            //         field(PostedChargebackEntriesDescription; PostedChargebackEntries.Description)
            //         {
            //             Caption = 'Description';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Description of the Chargeback Entry.';
            //         }
            //         field(PostedChargebackEntriesAmount; PostedChargebackEntries.Amount)
            //         {
            //             Caption = 'Amount';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Amount of the Chargeback Entry.';
            //         }
            //         field(PostedChargebackEntriesStatus; PostedChargebackEntries.Status)
            //         {
            //             Caption = 'Status';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Status of the Chargeback Entry.';
            //         }
            //         field(PostedChargebackEntriesCustLedgerEntryNo; PostedChargebackEntries."Cust. Ledger Entry No.")
            //         {
            //             Caption = 'Cust. Ledger Entry No.';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Cust. Ledger Entry No. of the Chargeback Entry.';
            //         }
            //         field(PostedChargebackEntriesCustLedgerEntryNoRev; PostedChargebackEntries."Cust. Ledger Entry No. (Rev.)")
            //         {
            //             Caption = 'Cust. Ledger Entry No. (Rev.)';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Cust. Ledger Entry No. (Rev.) of the Chargeback Entry.';
            //         }
            //         field(PostedChargebackEntriesChargebackNo; PostedChargebackEntries."Chargeback No.")
            //         {
            //             Caption = 'Chargeback No.';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Chargeback No. of the Chargeback Entry.';
            //         }
            //         field(PostedChargebackEntriesReversalNo; PostedChargebackEntries."Reversal No.")
            //         {
            //             Caption = 'Reversal No.';
            //             ApplicationArea = Basic, Suite;
            //             ToolTip = 'Specifies the Reversal No. of the Chargeback Entry.';
            //         }
            //     }
            // }
        }
    }

    actions
    {
        area(processing)
        {
            group("Manage")
            {
                Caption = 'Manage';
                action(PostSelectedChargeback)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post Chargeback';
                    Enabled = true;
                    Image = New;
                    ToolTip = 'Posts the selected Chargeback Line.';

                    trigger OnAction()
                    begin
                        if Rec.Amount = 0 then
                            error('Please enter an Amount.')
                        else
                            SubmitChargeback(Rec, ApplyingCustLedgEntry);
                        Rec.Delete();
                        // UpdatePostedChargebackEntries();
                        CurrPage.Update();
                    end;
                }
                // action(PostAllChargebacks)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Post All Chargebacks';
                //     Enabled = true;
                //     Image = Post;
                //     ToolTip = 'Posts all Chargeback Lines.';

                //     trigger OnAction()
                //     begin
                //         if not Rec.IsEmpty then begin
                //             Rec.FindFirst();
                //             repeat
                //                 if Rec.Amount > 0 then
                //                     SubmitChargeback(Rec, ApplyingCustLedgEntry);
                //                 Rec.DeleteAll();
                //                 CurrPage.Update();
                //             until Rec.Next() = 0;
                //         end;
                //     end;
                // }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Post';

                actionref(PostSelectedChargeback_Promoted; PostSelectedChargeback)
                {
                }
                // actionref(PostAllChargebacks_Promoted; PostAllChargebacks)
                // {
                // }
            }
        }
    }

    var
        // PostedChargebackEntries: Record ChargebackEntry temporary;
        ApplyingCustLedgEntry: Record "Cust. Ledger Entry";
        // PostedIsVisible: Boolean;
        PostedChargebacksVisible: Boolean;

    // trigger OnClosePage()
    // var
    //     DialogLabel2: Label 'Chargeback Lines have been enetered but not posted. Would you like to post them now?';
    //     DialogLabel: Label 'Are you sure that you would like to post a chargeback for %1 against Cust. Ledger Entry: %2 (Document Type: %3, Document No.: %4)?';
    // begin
    //     // Message('Apply chargebacks here.');
    //     if not Rec.IsEmpty then begin
    //         Rec.FindFirst();
    //         repeat
    //             if Rec.Amount > 0 then
    //                 // if Dialog.Confirm('Are you sure that you would like to post a chargeback for ' + Format(Rec.Amount) + ' against Cust. Ledger Entry: ' + format(ApplyingCustLedgEntry."Entry No.") + '?') then begin
    //                 if Dialog.Confirm(StrSubstNo(DialogLabel, Format(Rec.Amount), format(ApplyingCustLedgEntry."Entry No."), format(ApplyingCustLedgEntry."Document Type"), format(ApplyingCustLedgEntry."Document No."))) then begin
    //                     PostChargeback(Rec, ApplyingCustLedgEntry);
    //                     CreateChargebackEntry(Rec, ApplyingCustLedgEntry);
    //                 end
    //         // else
    //         //     Message('Do not post');
    //         until Rec.Next() = 0;
    //     end;
    // end;

    trigger OnOpenPage()
    begin
        SetPostedChargebackVisibility();
    end;

    trigger OnAfterGetRecord()
    begin
        // SetVisibility();
        // CurrPage.PostedChargebacksSubform.Page.SetVisibility(ApplyingCustLedgEntry."Entry No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        Rec."Line No." := xRec."Line No." + 1;
        Rec."Posting Date" := ApplyingCustLedgEntry."Posting Date";
        Rec."Cust. Ledger Entry No." := ApplyingCustLedgEntry."Entry No.";
        if SalesReceivablesSetup.FindFirst() then
            if StrLen(SalesReceivablesSetup."CB Account No.BGR") <> 0 then begin
                Rec."Account No." := SalesReceivablesSetup."CB Account No.BGR";
                Rec.CalcFields("Account Name");
            end;
    end;

    procedure SetApplyingCustLedgEntry(var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        ApplyingCustLedgEntry := CustLedgerEntry;
    end;

    // procedure SetPostedChargebackEntries(var ChargebackEntry: Record ChargebackEntry)
    // begin
    //     PostedIsVisible := false;
    //     // if not ChargebackEntry.IsEmpty then begin
    //     // if ChargebackEntry.FindFirst() then begin
    //     // repeat
    //     // if ChargebackEntry."Entry No." > 0 then begin
    //     if ChargebackEntry.FindSet() then begin
    //         // PostedChargebackEntries := ChargebackEntry;
    //         PostedChargebackEntries.Copy(ChargebackEntry);
    //         PostedIsVisible := true;
    //     end;
    //     // end;
    //     // until ChargebackEntry.Next() = 0;
    //     // end
    // end;

    local procedure CreateChargebackEntry(ChargebackLine: Record ChargebackLine_BGR; var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        ChargebackManagement: Codeunit ChargebackManagement_BGR;
    begin
        ChargebackManagement.CreateChargebackEntry(ChargebackLine, CustLedgerEntry);
    end;

    local procedure PostChargeback(ChargebackLine: Record ChargebackLine_BGR; var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        ChargebackManagement: Codeunit ChargebackManagement_BGR;
    begin
        ChargebackManagement.PostChargeback(ChargebackLine, CustLedgerEntry);
    end;

    local procedure SubmitChargeback(ChargebackLine: Record ChargebackLine_BGR; var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
    begin
        PostChargeback(ChargebackLine, CustLedgerEntry);
        CreateChargebackEntry(ChargebackLine, CustLedgerEntry);
        // UpdateChargebackAfterPosting(ChargebackLine);
        UpdateChargebackAfterPosting();
    end;

    local procedure SetPostedChargebackVisibility()
    var
        ChargebackEntry: Record ChargebackEntry_BGR;
    begin
        PostedChargebacksVisible := false;
        ChargebackEntry.Reset();
        ChargebackEntry.SetRange("Cust. Ledger Entry No.", ApplyingCustLedgEntry."Entry No.");
        if not ChargebackEntry.IsEmpty() then
            PostedChargebacksVisible := true;
    end;

    // local procedure UpdateChargebackAfterPosting(ChargebackLine: Record ChargebackLine_BGR)
    local procedure UpdateChargebackAfterPosting()
    var
        ChargebackManagement: Codeunit ChargebackManagement_BGR;
    begin
        ChargebackManagement.UpdateChargebackEntryAfterPosting();
    end;

    // local procedure UpdatePostedChargebackEntries()
    // var
    //     ChargebackManagement: COdeunit ChargebackManagement;
    // begin
    //     PostedChargebackEntries := ChargebackManagement.GetPostedChargebackEntries(ApplyingCustLedgEntry);

    //     // if not PostedChargebackEntries.IsEmpty() then
    //     if PostedChargebackEntries."Entry No." > 0 then
    //         PostedIsVisible := true;
    // end;



    // procedure GetChargebackLines(): Record ChargebackLine
    // begin
    //     exit(Rec);
    // end;

    //     procedure SetApplyingCustLedgEntry()
    //     begin
    //         SetApplyingCustledgEntrySalesHeader();
    //     end;

    // local procedure PostChargeback(var ChargebackLine: Record ChargebackLine)
    // var
    //     GenJournalLine: Record "Gen. Journal Line";
    //     // SalesReceivablesSetup: Record "Sales & Receivables Setup";
    //     NoSeries: Codeunit "No. Series";

    //     GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    // begin
    //     GenJournalLine.Init();
    //     // GenJournalLine."Journal Template Name" := 'GENERAL';
    //     // GenJournalLine."Journal Batch Name" := 'CHARGEBACK';
    //     // GenJournalLine."Line No." := 10000;
    //     GenJournalLine."Posting Date" := ChargebackLine."Posting Date";
    //     GenJournalLine."Document Type" := GenJournalLine."Document Type"::" ";
    //     GenJournalLine."Document No." := NoSeries.GetNextNo('CHARGEBACK');
    //     GenJournalLine."Account Type" := GenJournalLine."Account Type"::"G/L Account";
    //     GenJournalLine."Account No." := ChargebackLine."Account No.";
    //     // if SalesReceivablesSetup.FindFirst() then
    //     //     if StrLen(SalesReceivablesSetup."Chargeback Account No.") <> 0 then
    //     //         GenJournalLine."Account No." := SalesReceivablesSetup."Chargeback Account No.";

    //     GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::Customer;
    //     GenJournalLine."Bal. Account No." := ApplyingCustLedgEntry."Customer No.";
    //     GenJournalLine."Applies-to Doc. Type" := ApplyingCustLedgEntry."Document Type";
    //     GenJournalLine."Applies-to Doc. No." := ApplyingCustLedgEntry."Document No.";

    //     GenJournalLine.Description := ChargebackLine.Description;
    //     GenJournalLine.Amount := ChargebackLine.Amount;

    //     GenJournalLine."Dimension Set ID" := ApplyingCustLedgEntry."Dimension Set ID";

    //     Message(format(GenJournalLine));
    //     GenJnlPostLine.RunWithCheck(GenJournalLine);

    //     // GenJournalLine.SendToPosting(Codeunit::"Gen. Jnl.-Post");
    // end;

}
