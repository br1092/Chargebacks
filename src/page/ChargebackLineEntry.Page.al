namespace ALProject.ALProject;

page 50100 ChargebackLineEntry
{
    ApplicationArea = All;
    Caption = 'ChargebackLineEntry';
    PageType = ListPart;
    // PageType = List;
    SourceTable = ChargebackLine;
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                ShowCaption = false;
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the Line No. to be used for the chargeback.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the G/L Account No. to be used for the chargeback.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the amount of the chargeback.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the description of the chargeback.';
                }
            }
        }
    }

    // actions
    // {
    //     area(processing)
    //     {
    //         group("Manage")
    //         {
    //             Caption = 'Manage';
    //             action(NewChargeback)
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'New Chargeback';
    //                 Enabled = true;
    //                 Image = New;
    //                 ToolTip = 'Adds a new chargeback line.';

    //                 trigger OnAction()
    //                 begin
    //                     Message('Add new chargeback line.');
    //                 end;
    //             }
    //             // action(ItemAttributeTranslations)
    //             // {
    //             //     ApplicationArea = Basic, Suite;
    //             //     Caption = 'Translations';
    //             //     Image = Translations;
    //             //     RunObject = Page "Item Attribute Translations";
    //             //     RunPageLink = "Attribute ID" = field(ID);
    //             //     ToolTip = 'Opens a window in which you can define the translations for the selected item attribute.';
    //             // }
    //         }
    //     }
    //     area(Promoted)
    //     {
    //         group(Category_Process)
    //         {
    //             Caption = 'Manage';

    //             actionref(NewChargeback_Promoted; NewChargeback)
    //             {
    //             }
    //             // actionref(ItemAttributeTranslations_Promoted; ItemAttributeTranslations)
    //             // {
    //             // }
    //         }
    //     }
    // }

    // trigger OnClosePage()
    // begin
    //     Message('Apply chargebacks now.');
    // end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     Rec."Line No." += 1;
    // end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Line No." := xRec."Line No." + 1;
    end;

}
