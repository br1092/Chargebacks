table 50100 ChargebackLine_BGR
{
    Caption = 'ChargebackLine';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            NotBlank = true;
        }
        field(2; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = "G/L Account";
        }
        field(3; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; "Account Name"; Text[100])
        {
            Caption = 'Account Name';
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("Account No.")));
        }
        field(7; "Cust. Ledger Entry No."; Integer)
        {
            Caption = 'Cust. Ledger Entry No.';
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }

}
