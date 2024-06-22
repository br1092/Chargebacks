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
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup("Cust. Ledger Entry"."Customer No." where("Entry No." = field("App-to Cust. Ledger Entry No.")));
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(5; "App-to Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Applies-to Document Type';
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup("Cust. Ledger Entry"."Document Type" where("Entry No." = field("App-to Cust. Ledger Entry No.")));
        }
        field(6; "App-to Document No."; Code[20])
        {
            Caption = 'Applies-to Document No.';
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup("Cust. Ledger Entry"."Document No." where("Entry No." = field("App-to Cust. Ledger Entry No.")));

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
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup("Cust. Ledger Entry"."Description" where("Entry No." = field("Cust. Ledger Entry No.")));
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
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup("Cust. Ledger Entry"."Reversed by Entry No." where("Entry No." = field("Cust. Ledger Entry No.")));
            // TableRelation = "Cust. Ledger Entry"."Reversed by Entry No.";
        }
        field(12; "Chargeback No."; Code[20])
        {
            Caption = 'Chargeback No.';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry"."Document No.";
        }
        // field(13; "Reversal No."; Code[20])
        // {
        //     Caption = 'Reversal No.';
        //     DataClassification = CustomerContent;
        //     TableRelation = "Cust. Ledger Entry"."Document No.";
        // }
        field(14; "Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        // field(15; Reversed; Boolean)
        // {
        //     Caption = 'Reversed';
        //     DataClassification = CustomerContent;
        //     // FieldClass = FlowField;
        //     // CalcFormula = lookup("Cust. Ledger Entry" where("Entry No." = field("Cust. Ledger Entry No.")))
        //     TableRelation = "Cust. Ledger Entry"."Reversed";
        // }
        field(16; "App-to Cust. Ledger Entry No."; Integer)
        {
            Caption = 'Applies-to Cust. Ledger Entry No.';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry";
        }
        // field(15; "Transaction No."; Integer)
        // {
        //     Caption = 'Transaction No.';
        //     DataClassification = CustomerContent;
        // }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
