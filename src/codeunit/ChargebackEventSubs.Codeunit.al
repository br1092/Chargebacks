namespace Chargebacks.Chargebacks;
using Microsoft.Finance.GeneralLedger.Preview;
using Microsoft.Finance.GeneralLedger.Reversal;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.Finance.ReceivablesPayables;
using Microsoft.Sales.Receivables;
using Microsoft.Foundation.Navigate;
using Microsoft.Finance.GeneralLedger.Journal;
using ALProject.ALProject;

codeunit 50101 ChargebackEventSubs
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", 'OnBeforeErrorIfPositiveAmt', '', true, false)]
    local procedure OnBeforeErrorIfPositiveAmt(GenJnlLine: Record "Gen. Journal Line"; var RaiseError: Boolean)
    begin
        if GenJnlLine."Document Type" = GenJnlLine."Document Type"::Chargeback then
            RaiseError := false;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnBeforeCheckDtldCustLedgEntry', '', false, false)]
    local procedure OnBeforeCheckDtldCustLedgEntry(CustLedgEntry: Record "Cust. Ledger Entry"; var IsHandled: Boolean)
    var
        // ApplyUnapplyParameters: Record "Apply Unapply Parameters";
        // DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
        // CustEntryApplyPostedEntries: Codeunit "CustEntry-Apply Posted Entries";
        ChargebackManagement: Codeunit ChargebackManagementBGR;
    begin

        if CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Chargeback then begin
            ChargebackManagement.UnapplyChargebackAndPost(CustLedgEntry);
            // DtldCustLedgEntry2.Reset();
            // DtldCustLedgEntry2.SetRange("Transaction No.", CustLedgEntry."Transaction No.");
            // DtldCustLedgEntry2.SetRange("Entry Type", DtldCustLedgEntry2."Entry Type"::Application);
            // if DtldCustLedgEntry2.FindSet() then begin
            //     ApplyUnapplyParameters."Document No." := CustLedgEntry."Document No.";
            //     ApplyUnapplyParameters."Posting Date" := CustLedgEntry."Posting Date";
            //     CustEntryApplyPostedEntries.PostUnApplyCustomer(DtldCustLedgEntry2, ApplyUnapplyParameters);
            // end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnAfterReverseEntries', '', false, false)]
    local procedure OnAfterReverseEntries(Number: Integer; RevType: Integer; HideDialog: Boolean)
    var
        ChargebackManagement: Codeunit ChargebackManagementBGR;
    begin
        ChargebackManagement.UpdateChargebackAfterReversal(Number);
    end;
    // var
    //     ChargebackEntry: Record ChargebackEntry;
    //     GLEntry: Record "G/L Entry";
    //     CustLedgerEntry: Record "Cust. Ledger Entry";
    //     TempEntryNo: Integer;
    // begin
    //     // Message('Number: ' + format(Number) + ', RevType: ' + format(RevType));
    //     GLEntry.Reset();
    //     // ReversalEntry.SetRange("Entry Type", RevType);
    //     GLEntry.SetRange("Transaction No.", Number);
    //     GLEntry.SetRange("Bal. Account Type", GLEntry."Bal. Account Type"::Customer);
    //     if GLEntry.FindFirst() then begin
    //         TempEntryNo := GLEntry."Entry No." + 1;
    //         CustLedgerEntry.SetRange(Reversed, true);
    //         CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Chargeback);
    //         CustLedgerEntry.SetRange("Document No.", GLEntry."Document No.");
    //         if CustLedgerEntry.Get(TempEntryNo) then begin
    //             // if CustLedgerEntry.FindFirst() then begin
    //             ChargebackEntry.Reset();
    //             ChargebackEntry.SetRange("Chargeback No.", CustLedgerEntry."Document No.");
    //             ChargebackEntry.SetRange("Cust. Ledger Entry No.", TempEntryNo);
    //             if ChargebackEntry.FindFirst() then begin
    //                 ChargebackEntry.Status := ChargebackEntry.Status::Reversed;
    //                 // ChargebackEntry."Cust. Ledger Entry No. (Rev.)" := GLEntry."Entry No." + 1;
    //                 ChargebackEntry.Modify();
    //             end;
    //         end;
    //     end;
    // end;



    // [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnAfterCheckDtldCustLedgEntry', '', false, false)]
    // local procedure OnAfterCheckDtldCustLedgEntry(DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry"; CustLedgerEntry: Record "Cust. Ledger Entry")
    // var
    //     ChargebackEntry: Record ChargebackEntry;
    //     GLEntry: Record "G/L Entry";
    // begin

    //     if CustLedgerEntry."Document Type" = CustLedgerEntry."Document Type"::Chargeback then begin
    //         GLEntry.Reset();
    //         GLEntry.SetRange(Reversed, true);
    //         GLEntry.SetRange("Document Type", GLEntry."Document Type"::Chargeback);
    //         GLEntry.SetFilter("Reversed Entry No.", '<>0');
    //         if GLEntry.FindSet() then
    //             repeat
    //                 ChargebackEntry.Reset();
    //                 ChargebackEntry.SetRange("Document No.", GLEntry."Document No.");
    //                 ChargebackEntry.SetRange(Status, ChargebackEntry.Status::Posted);
    //                 if ChargebackEntry.FindSet() then
    //                     repeat
    //                         ChargebackEntry.Status := ChargebackEntry.Status::Reversed;
    //                     until ChargebackEntry.Next() = 0;
    //             until GLEntry.Next() = 0;
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnBeforeReverseEntries', '', false, false)]
    // local procedure OnBeforeReverseEntries(Number: Integer; RevType: Integer; var IsHandled: Boolean; HideDialog: Boolean; var ReversalEntry: Record "Reversal Entry")
    // begin
    // end;
}