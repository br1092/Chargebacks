namespace ALProject.ALProject;

using Microsoft.Sales.Receivables;
using Microsoft.Finance.GeneralLedger.Journal;

pageextension 50101 ApplyCustomerEntriesExt extends "Apply Customer Entries"
{
    // layout
    // {
    // }
    actions
    {
        // addbefore("&Navigate_Promoted")
        addafter(Category_Category5)
        {
            group(Chargeback)
            {
                actionref(EnterChargebacks_Promoted; EnterChargebacks)
                { }
            }
        }
        // addfirst("Ent&ry")
        // addafter("Ent&ry")
        addfirst("Ent&ry")
        {
            // group(Chargeback)
            // {
            // Caption = 'Chargeback';
            action(EnterChargebacks)
            {
                Caption = 'Enter Chargeback(s)';
                Visible = true;
                ApplicationArea = All;
                ToolTip = 'Enter one or more chargeback(s) against the selected Customer Ledger Entry.';
                trigger OnAction()
                var
                    // PostedChargebackEntries: Record ChargebackEntry;
                    // TempChargebackLine: Record ChargebackLine;
                    ApplyChargebacks: Page ApplyChargebacks;

                // ChargebackManagement: Codeunit ChargebackManagementBGR;
                begin
                    ApplyChargebacks.SetTempApplyingCustLedgEntry(Rec);

                    // PostedChargebackEntries := GetPostedChargebackEntries(Rec);
                    // PostedChargebackEntries := ChargebackManagement.GetPostedChargebackEntries(Rec);

                    // ApplyChargebacks.SetPostedChargebackEntries(PostedChargebackEntries);

                    if ApplyChargebacks.RunModal() = Action::OK then
                        CurrPage.Update();

                end;
            }
            // }
        }
    }

    // local procedure GetPostedChargebackEntries(CustLedgerEntry: Record "Cust. Ledger Entry"): Record ChargebackEntry;
    // var
    //     ChargebackEntry: Record ChargebackEntry;
    // begin
    //     ChargebackEntry.Reset();
    //     ChargebackEntry.SetRange("Cust. Ledger Entry No.", CustLedgerEntry."Entry No.");
    //     if not ChargebackEntry.IsEmpty then
    //         exit(ChargebackEntry);
    // end;
}