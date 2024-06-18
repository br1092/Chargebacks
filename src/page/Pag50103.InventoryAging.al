// namespace ALProject.ALProject;

// page 50103 InventoryAging
// {
//     ApplicationArea = All;
//     Caption = 'Inventory Aging';
//     PageType = List;
//     SourceTable = InventoryAging;
//     UsageCategory = ReportsAndAnalysis;
//     Editable = false;

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Item No."; Rec."Item No.")
//                 {
//                     ToolTip = 'Specifies the value of the Item No. field.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ToolTip = 'Specifies the value of the Description field.';
//                 }
//                 field("Unit of Measure"; Rec."Unit of Measure")
//                 {
//                     ToolTip = 'Specifies the value of the Unit of Measure field.';
//                 }
//                 field("Bucket 1"; Rec."Bucket 1")
//                 {
//                     ToolTip = 'Specifies the value of the Under 30 field.';
//                 }
//                 field("Bucket 2"; Rec."Bucket 2")
//                 {
//                     ToolTip = 'Specifies the value of the 31-60 field.';
//                 }
//                 field("Bucket 3"; Rec."Bucket 3")
//                 {
//                     ToolTip = 'Specifies the value of the 61-90 field.';
//                 }
//                 field("Bucket 4"; Rec."Bucket 4")
//                 {
//                     ToolTip = 'Specifies the value of the 91-120 field.';
//                 }
//                 field("Bucket 5"; Rec."Bucket 5")
//                 {
//                     ToolTip = 'Specifies the value of the Over 120 field.';
//                 }
//             }
//         }
//     }

//     // trigger OnInit()
//     // trigger OnOpenPage()
//     // var
//     //     InventoryAgingManagement: Codeunit InventoryAgingManagement;
//     // begin
//     //     Rec := InventoryAgingManagement.GetInventoryAging();
//     //     Rec.CalcFields(Description);
//     // end;

//     trigger OnOpenPage()
//     var
//         // InventoryAging: Record InventoryAging;
//         InventoryAgingManagement: Codeunit InventoryAgingManagement;
//         AgingDictionary: Dictionary of [Code[20], List of [Decimal]];
//         AgingList: List of [Decimal];
//         i: Integer;
//     begin
//         AgingDictionary := InventoryAgingManagement.CreateDictionary();

//         i := 1;
//         foreach AgingList in AgingDictionary.Values() do begin
//             Rec.Init();
//             Rec."Item No." := AgingDictionary.Keys.Get(i);
//             Rec."Bucket 1" := AgingList.Get(1);
//             Rec."Bucket 2" := AgingList.Get(2);
//             Rec."Bucket 3" := AgingList.Get(3);
//             Rec."Bucket 4" := AgingList.Get(4);
//             Rec."Bucket 5" := AgingList.Get(5);
//             Rec.Insert();
//             i += 1;
//         end;
//         Rec.FindFirst();
//     end;
// }
