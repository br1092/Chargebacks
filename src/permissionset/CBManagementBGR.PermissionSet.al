namespace ALProject.ALProject;

permissionset 50100 CBManagement_BGR
{
    Assignable = true;
    Caption = 'ChargebackManagement', MaxLength = 30;
    Permissions =
        table ChargebackLine_BGR = X,
        tabledata ChargebackLine_BGR = RMID,
        table ChargebackEntry_BGR = X,
        tabledata ChargebackEntry_BGR = RMID,
        codeunit ChargebackManagement_BGR = X,
        page ChargebackLineEntry_BGR = X,
        page ApplyChargebacks_BGR = X,
        page ChargebackEntries_BGR = X;
}
