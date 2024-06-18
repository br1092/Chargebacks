// table 50102 InventoryAging
// {
//     Caption = 'InventoryAging';
//     DataClassification = ToBeClassified;
//     TableType = Temporary;

//     fields
//     {
//         field(1; "Item No."; Code[20])
//         {
//             TableRelation = Item;
//         }
//         field(2; Description; Text[100])
//         {
//             FieldClass = FlowField;
//             CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
//         }
//         field(3; "Bucket 1"; Decimal)
//         {
//             Caption = 'Under 30';
//         }
//         field(4; "Bucket 2"; Decimal)
//         {
//             Caption = '31-60';
//         }
//         field(5; "Bucket 3"; Decimal)
//         {
//             Caption = '61-90';
//         }
//         field(6; "Bucket 4"; Decimal)
//         {
//             Caption = '91-120';
//         }
//         field(7; "Bucket 5"; Decimal)
//         {
//             Caption = 'Over 120';
//         }

//         field(8; "Unit of Measure"; Code[10])
//         {
//             FieldClass = FlowField;
//             CalcFormula = lookup(Item."Base Unit of Measure" where("No." = field("Item No.")));
//         }
//     }
//     keys
//     {
//         key(PK; "Item No.")
//         {
//             Clustered = true;
//         }
//     }
// }
