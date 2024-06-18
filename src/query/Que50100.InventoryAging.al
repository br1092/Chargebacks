// namespace ALProject.ALProject;

// using Microsoft.Inventory.Item;
// using Microsoft.Inventory.Ledger;

// query 50100 InventoryAging
// {
//     Caption = 'Inventory Aging';
//     QueryType = Normal;

//     elements
//     {
//         dataitem(Item; "Item")
//         {
//             column(No; "No.")
//             {
//             }
//             column(Description; Description)
//             {
//             }
//             dataitem(ILE; "Item Ledger Entry")
//             {
//                 DataItemLink = "Item No." = Item."No.";
//                 SqlJoinType = LeftOuterJoin;
//                 DataItemTableFilter = "Posting Date" = filter(-30);

//                 column(Quantity; Quantity)
//                 {
//                     Caption = '<30';
//                     Method = sum;
//                 }

//             }

//         }
//     }

//     // var
//     //     UnderThirty: Text;
//     //     UnderSixty: Text;



//     trigger OnBeforeOpen()
//     begin

//     end;
// }
