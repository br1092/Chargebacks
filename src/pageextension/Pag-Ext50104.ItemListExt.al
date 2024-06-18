// namespace ALProject.ALProject;

// using Microsoft.Inventory.Item;

// pageextension 50104 ItemListExt extends "Item List"
// {
//     layout
//     { }
//     actions
//     {
//         // addlast(Category_Process)
//         addafter(Category_Process)
//         {
//             group(Test)
//             {
//                 actionref(CreateDictionary_Promoted; CreateDictionary)
//                 { }
//             }
//         }
//         addlast(Action126)
//         // addafter("F&unctions")
//         {
//             // group(Chargeback)
//             // {
//             action(CreateDictionary)
//             {
//                 Caption = 'Create Dictionary';
//                 Visible = true;
//                 ApplicationArea = All;
//                 trigger OnAction()
//                 var
//                     InventoryAgingManagement: Codeunit InventoryAgingManagement;
//                 begin
//                     InventoryAgingManagement.CreateDictionary();
//                 end;
//             }
//             // }
//         }
//     }
// }
