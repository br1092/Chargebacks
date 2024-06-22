namespace ALProject.ALProject;
using Microsoft.Sales.Receivables;
using Microsoft.Foundation.NoSeries;
using Microsoft.Finance.ReceivablesPayables;
using Microsoft.Sales.Setup;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Finance.GeneralLedger.Posting;

codeunit 50100 ChargebackManagementBGR
{
    procedure CreateChargebackEntry(ChargebackLine: Record ChargebackLine; var CustLedgerEntry: Record "Cust. Ledger Entry")
    var
        ChargebackEntry: Record ChargebackEntry;
        NoSeriesLine: Record "No. Series Line";
        TempNoSeries: Code[20];
    begin
        ChargebackEntry.Init();
        ChargebackEntry."Entry No." := GetNextChargebackEntryNo();
        ChargebackEntry."Customer No." := CustLedgerEntry."Customer No.";
        ChargebackEntry."Posting Date" := ChargebackLine."Posting Date";
        // ChargebackEntry."Document Type" := CustLedgerEntry."Document Type";
        // ChargebackEntry."Document No." := CustLedgerEntry."Document No.";

        TempNoSeries := GetChargebackNoSeries(false);

        NoSeriesLine.Reset();
        NoSeriesLine.SetRange("Series Code", TempNoSeries);
        NoSeriesLine.SetRange(Open, true);
        if NoSeriesLine.FindFirst() then begin
            // Message('Last No. Used: ' + NoSeriesLine."Last No. Used");
            ChargebackEntry."Chargeback No." := NoSeriesLine."Last No. Used";
        end;

        ChargebackEntry.Amount := ChargebackLine.Amount;
        ChargebackEntry.Description := ChargebackLine.Description;
        ChargebackEntry.Status := ChargebackEntry.Status::Posted;
        // ChargebackEntry."Cust. Ledger Entry No." := CustLedgerEntry."Entry No.";
        ChargebackEntry."App-to Cust. Ledger Entry No." := CustLedgerEntry."Entry No.";

        ChargebackEntry."Account No." := ChargebackLine."Account No.";

        ChargebackEntry.Insert();
    end;

    procedure DeleteChargebackEntry(ChargebackEntryNo: Integer)
    var
        ChargebackEntry: Record ChargebackEntry;
    begin
        if ChargebackEntry.Get(ChargebackEntryNo) then
            ChargebackEntry.Delete();
    end;

    procedure GetPostedChargebackEntries(var CustLedgerEntry: Record "Cust. Ledger Entry"): Record ChargebackEntry;
    var
        ChargebackEntry: Record ChargebackEntry;
    begin
        ChargebackEntry.Reset();
        ChargebackEntry.SetRange("Cust. Ledger Entry No.", CustLedgerEntry."Entry No.");
        // if not ChargebackEntry.IsEmpty then
        // if ChargebackEntry.FindFirst() then
        if ChargebackEntry.FindFirst() then
            exit(ChargebackEntry);
    end;

    procedure PostChargeback(ChargebackLine: Record ChargebackLine; var TempApplyingCustLedgEntry: Record "Cust. Ledger Entry")
    var
        GenJournalLine: Record "Gen. Journal Line";
        TempGenJournalBatch: Record "Gen. Journal Batch";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    // NoSeries: Codeunit "No. Series";
    begin
        GenJournalLine.Init();
        GenJournalLine."Posting Date" := ChargebackLine."Posting Date";
        // GenJournalLine."Document Type" := GenJournalLine."Document Type"::" ";
        GenJournalLine."Document Type" := GenJournalLine."Document Type"::Chargeback;

        GenJournalLine."Posting No. Series" := GetChargebackNoSeries(false);
        GenJournalLine."Document No." := GetNextChargebackNo(GenJournalLine."Posting No. Series");

        GenJournalLine."Account Type" := GenJournalLine."Account Type"::"G/L Account";
        GenJournalLine."Account No." := ChargebackLine."Account No.";

        GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::Customer;
        GenJournalLine."Bal. Account No." := TempApplyingCustLedgEntry."Customer No.";

        GenJournalLine."Applies-to Doc. Type" := TempApplyingCustLedgEntry."Document Type";
        GenJournalLine."Applies-to Doc. No." := TempApplyingCustLedgEntry."Document No.";

        GenJournalLine.Description := ChargebackLine.Description;
        GenJournalLine.Amount := ChargebackLine.Amount;

        GenJournalLine."Dimension Set ID" := TempApplyingCustLedgEntry."Dimension Set ID";

        SalesReceivablesSetup.Reset();
        if SalesReceivablesSetup.FindFirst() then begin
            TempGenJournalBatch.Reset();
            TempGenJournalBatch.SetRange("No. Series", SalesReceivablesSetup."CB No. SeriesBGR");
            if TempGenJournalBatch.FindFirst() then
                GenJournalLine."Journal Batch Name" := TempGenJournalBatch.Name;
        end;

        // Message(format(GenJournalLine));
        GenJnlPostLine.RunWithCheck(GenJournalLine);
        // Message('Posting done.');

        // Add to Chargeback Entry table.
        // CreateChargebackEntry(GenJournalLine);
        // Message('Chargeback Entry created.');
    end;

    // procedure ReverseChargeback(var CustLedgerEntry: Record "Cust. Ledger Entry")
    // var
    //     GenJournalLine: Record "Gen. Journal Line";
    //     TempGenJournalBatch: Record "Gen. Journal Batch";
    //     SalesReceivablesSetup: Record "Sales & Receivables Setup";

    //     GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    //     TempDescription: Text;
    // begin
    //     GenJournalLine.Init();
    //     GenJournalLine."Posting Date" := CustLedgerEntry."Posting Date";
    //     // GenJournalLine."Document Type" := CustLedgerEntry."Document Type"
    //     GenJournalLine."Document Type" := CustLedgerEntry."Document Type"::Invoice;

    //     // GenJournalLine."Document No." := NoSeries.GetNextNo('CHARGEBACK');
    //     GenJournalLine."Posting No. Series" := GetChargebackNoSeries(true);
    //     // GenJournalLine."Document No." := GetNextChargebackNo();
    //     GenJournalLine."Document No." := GetNextChargebackNo(GenJournalLine."Posting No. Series");

    //     // GenJournalLine."Account Type" := GenJournalLine."Account Type"::Customer;
    //     // GenJournalLine."Account No." := CustLedgerEntry."Customer No.";

    //     // GenJournalLine."Bal. Account Type" := CustLedgerEntry."Bal. Account Type";
    //     // GenJournalLine."Bal. Account No." := CustLedgerEntry."Bal. Account No.";

    //     GenJournalLine."Account Type" := CustLedgerEntry."Bal. Account Type";
    //     GenJournalLine."Account No." := CustLedgerEntry."Bal. Account No.";

    //     GenJournalLine."Bal. Account Type" := GenJournalLine."Account Type"::Customer;
    //     GenJournalLine."Bal. Account No." := CustLedgerEntry."Customer No.";

    //     // GenJournalLine."Applies-to Doc. Type" := CustLedgerEntry."Document Type";
    //     // GenJournalLine."Applies-to Doc. No." := CustLedgerEntry."Document No.";

    //     //Reversing creates new invoice.
    //     // GenJournalLine."Applies-to Doc. Type" := GenJournalLine."Applies-to Doc. Type"::Invoice;
    //     // GenJournalLine."Applies-to Doc. No." := GetAppliesToDocNoForReversal(CustLedgerEntry);

    //     // Add 'REVERSE -' to the beginning of the description of the original chargeback
    //     TempDescription := 'CB REVERSAL - ' + format(CustLedgerEntry."Entry No.") + ' - ' + CustLedgerEntry.Description;
    //     GenJournalLine.Description := TempDescription;

    //     GenJournalLine.Amount := CustLedgerEntry.Amount;

    //     GenJournalLine."Dimension Set ID" := CustLedgerEntry."Dimension Set ID";


    //     SalesReceivablesSetup.Reset();
    //     if SalesReceivablesSetup.FindFirst() then begin
    //         TempGenJournalBatch.Reset();
    //         TempGenJournalBatch.SetRange("No. Series", SalesReceivablesSetup."CB Reversal No. SeriesBGR");
    //         if TempGenJournalBatch.FindFirst() then
    //             GenJournalLine."Journal Batch Name" := TempGenJournalBatch.Name;
    //     end;


    //     // Message(format(GenJournalLine));
    //     GenJnlPostLine.RunWithCheck(GenJournalLine);

    //     UpdateChargebackEntryAfterReversal(CustLedgerEntry);
    // end;

    local procedure GetAppliesToCustLedgerEntryNoForReversal(var CustLedgerEntry: Record "Cust. Ledger Entry"): Integer;
    var
        DetailedCustLedgerEntry: Record "Detailed Cust. Ledg. Entry";
    begin
        DetailedCustLedgerEntry.SetRange("Entry Type", DetailedCustLedgerEntry."Entry Type"::Application);
        DetailedCustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type");
        DetailedCustLedgerEntry.SetRange("Document No.", CustLedgerEntry."Document No.");
        DetailedCustLedgerEntry.SetRange("Initial Document Type", DetailedCustLedgerEntry."Initial Document Type"::Invoice);
        DetailedCustLedgerEntry.SetFilter("Cust. Ledger Entry No.", '<>%1', CustLedgerEntry."Entry No.");
        if not DetailedCustLedgerEntry.IsEmpty then
            if DetailedCustLedgerEntry.FindFirst() then
                exit(DetailedCustLedgerEntry."Cust. Ledger Entry No.");
    end;

    local procedure GetAppliesToDocNoForReversal(var CustLedgerEntry: Record "Cust. Ledger Entry"): Code[20]
    var
        CustLedgerEntry2: Record "Cust. Ledger Entry";
        AppliesToEntryNo: Integer;
    begin
        AppliesToEntryNo := GetAppliesToCustLedgerEntryNoForReversal(CustLedgerEntry);
        if CustLedgerEntry2.Get(AppliesToEntryNo) then
            exit(CustLedgerEntry2."Document No.");
    end;

    local procedure GetChargebackCustLedgerEntryNo(var GenJournalLine: Record "Gen. Journal Line"): Integer
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.SetRange("Customer No.", GenJournalLine."Bal. Account No.");
        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::" ");
        CustLedgerEntry.SetRange("Document No.", GenJournalLine."Document No.");
        if not CustLedgerEntry.IsEmpty then
            if CustLedgerEntry.FindFirst() then
                exit(CustLedgerEntry."Entry No.");
    end;

    local procedure GetChargebackNoSeries(IsReversal: Boolean): Code[20]
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesReceivablesSetup.FindFirst() then
            if IsReversal then
                // if StrLen(SalesReceivablesSetup."Chargeback Reversal No. Series") <> 0 then
                    exit(SalesReceivablesSetup."CB Reversal No. SeriesBGR")
            else
                // if StrLen(SalesReceivablesSetup."Chargeback No. Series") <> 0 then
                exit(SalesReceivablesSetup."CB No. SeriesBGR");
    end;

    local procedure GetNextChargebackEntryNo(): Integer
    var
        ChargebackEntry: Record ChargebackEntry;
    begin
        if not ChargebackEntry.IsEmpty then begin
            ChargebackEntry.SetAscending("Entry No.", true);
            if ChargebackEntry.FindLast() then
                exit(ChargebackEntry."Entry No." + 1)
        end else
            exit(1);
    end;

    local procedure GetLastUsedChargebackNo(NoSeriesCode: Code[20]): Code[20]
    var
        NoSeries: Codeunit "No. Series";
    begin
        exit(NoSeries.GetLastNoUsed(NoSeriesCode));
    end;

    local procedure GetNextChargebackNo(NoSeriesCode: Code[20]): Code[20]
    var
        NoSeries: Codeunit "No. Series";
    begin
        // Message('GetNextChargebackNo.NoSeriesCode:' + format(NoSeriesCode));
        exit(NoSeries.GetNextNo(NoSeriesCode));
        // exit(NoSeries.GetLastNoUsed(NoSeriesCode));
    end;

    // local procedure SetNextChargebackNo(NoSeriesCode: Code[20])
    // var
    //     NoSeries : Codeunit "No. Series";
    // begin
    //     NoSeries.GetLastNoUsed()
    // end;

    // local procedure UpdateChargebackEntryAfterReversal(var CustLedgerEntry: Record "Cust. Ledger Entry")
    // var
    //     ChargebackEntry: Record ChargebackEntry;
    //     CustLedgerEntry2: Record "Cust. Ledger Entry";
    //     NoSeriesLine: Record "No. Series Line";
    //     TempNoSeries: Code[20];
    // begin
    //     ChargebackEntry.SetRange("Chargeback No.", CustLedgerEntry."Document No.");
    //     if ChargebackEntry.FindFirst() then begin
    //         TempNoSeries := GetChargebackNoSeries(true);
    //         NoSeriesLine.SetRange("Series Code", TempNoSeries);
    //         NoSeriesLine.SetRange(Open, true);
    //         if NoSeriesLine.FindFirst() then begin
    //             // Message('Last No. Used (Reversal): ' + NoSeriesLine."Last No. Used");
    //             CustLedgerEntry2.SetRange("Document Type", CustLedgerEntry2."Document Type"::Invoice);
    //             CustLedgerEntry2.SetRange("Document No.", NoSeriesLine."Last No. Used");
    //             if CustLedgerEntry2.FindFirst() then begin
    //                 ChargebackEntry."Cust. Ledger Entry No. (Rev.)" := CustLedgerEntry2."Entry No.";
    //                 ChargebackEntry.Status := ChargebackEntry.Status::Reversed;
    //                 // ChargebackEntry."Reversal No." := NoSeriesLine."Last No. Used";
    //                 ChargebackEntry.Modify();
    //             end;
    //         end;
    //     end;
    // end;

    // local procedure UpdateChargebackEntryAfterReversal(var CustLedgerEntry: Record "Cust. Ledger Entry")
    // var
    //     ChargebackEntry: Record ChargebackEntry;
    //     CustLedgerEntry2: Record "Cust. Ledger Entry";
    //     NoSeriesLine: Record "No. Series Line";
    //     TempNoSeries: Code[20];
    // begin
    //     ChargebackEntry.SetRange("Chargeback No.", CustLedgerEntry."Document No.");
    //     if ChargebackEntry.FindFirst() then begin
    //         TempNoSeries := GetChargebackNoSeries(true);
    //         NoSeriesLine.SetRange("Series Code", TempNoSeries);
    //         NoSeriesLine.SetRange(Open, true);
    //         if NoSeriesLine.FindFirst() then begin
    //             // Message('Last No. Used (Reversal): ' + NoSeriesLine."Last No. Used");
    //             CustLedgerEntry2.SetRange("Document Type", CustLedgerEntry2."Document Type"::Invoice);
    //             CustLedgerEntry2.SetRange("Document No.", NoSeriesLine."Last No. Used");
    //             if CustLedgerEntry2.FindFirst() then begin
    //                 ChargebackEntry."Cust. Ledger Entry No. (Rev.)" := CustLedgerEntry2."Entry No.";
    //                 ChargebackEntry.Status := ChargebackEntry.Status::Reversed;
    //                 // ChargebackEntry."Reversal No." := NoSeriesLine."Last No. Used";
    //                 ChargebackEntry.Modify();
    //             end;
    //         end;
    //     end;
    // end;

    procedure UnapplyChargebackAndPost(CustLedgEntry: Record "Cust. Ledger Entry")
    var
        ApplyUnapplyParameters: Record "Apply Unapply Parameters";
        DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
        CustEntryApplyPostedEntries: Codeunit "CustEntry-Apply Posted Entries";
    begin
        // if CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Chargeback then begin
        DtldCustLedgEntry2.Reset();
        DtldCustLedgEntry2.SetRange("Transaction No.", CustLedgEntry."Transaction No.");
        DtldCustLedgEntry2.SetRange("Entry Type", DtldCustLedgEntry2."Entry Type"::Application);
        if DtldCustLedgEntry2.FindSet() then begin
            ApplyUnapplyParameters."Document No." := CustLedgEntry."Document No.";
            ApplyUnapplyParameters."Posting Date" := CustLedgEntry."Posting Date";
            CustEntryApplyPostedEntries.PostUnApplyCustomer(DtldCustLedgEntry2, ApplyUnapplyParameters);
        end;
        // end;
    end;

    procedure UpdateChargebackAfterReversal(Number: Integer)
    var
        ChargebackEntry: Record ChargebackEntry;
        GLEntry: Record "G/L Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TempEntryNo: Integer;
    begin
        // Message('Number: ' + format(Number) + ', RevType: ' + format(RevType));
        GLEntry.Reset();
        // ReversalEntry.SetRange("Entry Type", RevType);
        GLEntry.SetRange("Transaction No.", Number);
        GLEntry.SetRange("Bal. Account Type", GLEntry."Bal. Account Type"::Customer);
        GLEntry.SetRange("Document Type", GLEntry."Document Type"::Chargeback);
        if GLEntry.FindFirst() then begin
            TempEntryNo := GLEntry."Entry No." + 1;
            CustLedgerEntry.SetRange(Reversed, true);
            CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Chargeback);
            CustLedgerEntry.SetRange("Document No.", GLEntry."Document No.");
            if CustLedgerEntry.Get(TempEntryNo) then begin
                // if CustLedgerEntry.FindFirst() then begin
                ChargebackEntry.Reset();
                ChargebackEntry.SetRange("Chargeback No.", CustLedgerEntry."Document No.");
                ChargebackEntry.SetRange("Cust. Ledger Entry No.", TempEntryNo);
                if ChargebackEntry.FindFirst() then begin
                    ChargebackEntry.Status := ChargebackEntry.Status::Reversed;
                    // ChargebackEntry."Cust. Ledger Entry No. (Rev.)" := GLEntry."Entry No." + 1;
                    ChargebackEntry.Modify();
                end;
            end;
        end;
    end;

    procedure UpdateChargebackEntryAfterPosting()
    var
        ChargebackEntry: Record ChargebackEntry;
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.Reset();
        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Chargeback);
        CustLedgerEntry.SetRange("Document No.", GetLastUsedChargebackNo(GetChargebackNoSeries(false)));
        if CustLedgerEntry.FindFirst() then begin
            ChargebackEntry.Reset();
            ChargebackEntry.SetRange("Chargeback No.", GetLastUsedChargebackNo(GetChargebackNoSeries(false)));
            if ChargebackEntry.FindFirst() then begin
                ChargebackEntry."Cust. Ledger Entry No." := CustLedgerEntry."Entry No.";
                ChargebackEntry.Modify();
            end;
        end;
    end;

    // procedure GetChargebackEntries(DocumentNo : Code[20])
    // var
    //     SalesReceivablesSetup: Record "Sales & Receivables Setup";
    // begin
    //     SalesReceivablesSetup.Reset();
    //     if SalesReceivablesSetup.FindFirst() then
    // end;



    // local procedure GetNextChargebackNo(): Code[20]
    // var
    //     SalesReceivablesSetup: Record "Sales & Receivables Setup";
    //     NoSeries: Codeunit "No. Series";
    // begin
    //     if SalesReceivablesSetup.FindFirst() then
    //         if StrLen(SalesReceivablesSetup."Chargeback No. Series") <> 0 then
    //             exit(NoSeries.GetNextNo(SalesReceivablesSetup."Chargeback No. Series"));
    // end;

    // local procedure CreateChargebackEntry(var GenJournalLine: Record "Gen. Journal Line")
    // var
    //     ChargebackEntry: Record ChargebackEntry;
    // begin
    //     ChargebackEntry.Init();
    //     ChargebackEntry."Entry No." := GetNextChargebackEntryNo();
    //     ChargebackEntry."Customer No." := GenJournalLine."Bal. Account No.";
    //     ChargebackEntry."Posting Date" := GenJournalLine."Posting Date";
    //     ChargebackEntry."Document Type" := GenJournalLine."Applies-to Doc. Type";
    //     ChargebackEntry."Document No." := GenJournalLine."Applies-to Doc. No.";
    //     ChargebackEntry.Amount := GenJournalLine.Amount;
    //     ChargebackEntry.Description := GenJournalLine.Description;
    //     ChargebackEntry.Status := ChargebackEntry.Status::Posted;
    //     ChargebackEntry."Cust. Ledger Entry No." := GetChargebackCustLedgerEntryNo(GenJournalLine);
    //     ChargebackEntry.Insert();

    // end;

}
