namespace ALProject.ALProject;

using Microsoft.Sales.Receivables;

pageextension 50103 CustomerLedgerEntriesExt extends "Customer Ledger Entries"
{
    layout
    { }
    actions
    {
        // addlast(Category_Process)
        addafter(Category_Category5)
        {
            group(Chargeback)
            {
                actionref(EnterChargebacks_Promoted; EnterChargebacks)
                { }
                // actionref(ReverseChargeback_Promoted; ReverseChargeback)
                // { }
            }
        }
        addlast("F&unctions")
        // addafter("F&unctions")
        {
            // group(Chargeback)
            // {
            action(EnterChargebacks)
            {
                Caption = 'Enter Chargebacks';
                Visible = true;
                ApplicationArea = All;
                ToolTip = 'Enter one or more chargeback(s) against the selected Customer Ledger Entry.';
                trigger OnAction()
                var
                    PostedChargebackEntries: Record ChargebackEntry;
                    TempChargebackLine: Record ChargebackLine;
                    ApplyChargebacks: Page ApplyChargebacks;

                    ChargebackManagement: Codeunit ChargebackManagementBGR;
                begin
                    ApplyChargebacks.SetTempApplyingCustLedgEntry(Rec);

                    // PostedChargebackEntries := GetPostedChargebackEntries(Rec);
                    PostedChargebackEntries := ChargebackManagement.GetPostedChargebackEntries(Rec);

                    // ApplyChargebacks.SetPostedChargebackEntries(PostedChargebackEntries);

                    if ApplyChargebacks.RunModal() = Action::OK then
                        CurrPage.Update();

                end;
            }
            // action(ReverseChargeback)
            // {
            //     Caption = 'Reverse Chargeback';
            //     Visible = true;
            //     ApplicationArea = All;
            //     trigger OnAction()
            //     begin
            //         ReverseChargeback(Rec);
            //     end;
            // }
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

    // local procedure ReverseChargeback(var CustLedgerEntry: Record "Cust. Ledger Entry")
    // var
    //     ChargebackManagement: Codeunit ChargebackManagementBGR;
    // begin
    //     ChargebackManagement.ReverseChargeback(Rec);
    // end;
}
