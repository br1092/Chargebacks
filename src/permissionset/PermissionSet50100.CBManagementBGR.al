namespace ALProject.ALProject;

permissionset 50100 CBManagementBGR
{
    Assignable = true;
    Caption = 'ChargebackManagement', MaxLength = 30;
    Permissions =
        table ChargebackLine = X,
        tabledata ChargebackLine = RMID,
        table ChargebackEntry = X,
        tabledata ChargebackEntry = RMID,
        codeunit ChargebackManagementBGR = X,
        page ChargebackLineEntry = X,
        page ApplyChargebacks = X,
        page ChargebackEntries = X;
}
