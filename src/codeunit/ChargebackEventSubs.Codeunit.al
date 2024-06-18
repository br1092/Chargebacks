namespace Chargebacks.Chargebacks;
using Microsoft.Finance.GeneralLedger.Preview;
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
}