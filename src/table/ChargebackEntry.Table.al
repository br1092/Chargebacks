table 50101 ChargebackEntry
{
    Caption = 'ChargebackEntry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(5; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;

            // trigger OnLookup()
            // var
            //     IncomingDocument: Record "Incoming Document";
            // begin
            //     IncomingDocument.HyperlinkToDocument("Document No.", "Posting Date");
            // end;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(9; Status; Enum ChargebackStatus)
        {
            Caption = 'Chargeback Status';
            DataClassification = CustomerContent;
        }
        field(10; "Cust. Ledger Entry No."; Integer)
        {
            Caption = 'Cust. Ledger Entry No.';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry";
        }
        field(11; "Cust. Ledger Entry No. (Rev.)"; Integer)
        {
            Caption = 'Cust. Ledger Entry No. (Reversal)';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry";
        }
        field(12; "Chargeback No."; Code[20])
        {
            Caption = 'Chargeback No.';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry"."Document No.";
        }
        field(13; "Reversal No."; Code[20])
        {
            Caption = 'Reversal No.';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry"."Document No.";
        }
        field(14; "Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
