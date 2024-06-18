// namespace ALProject.ALProject;
// using Microsoft.Inventory.Item;
// using Microsoft.Inventory.Ledger;

// codeunit 50102 InventoryAgingManagement
// {
//     procedure CreateDictionary(): Dictionary of [Code[20], List of [Decimal]]
//     var
//         Item: Record Item;
//         ItemLedgerEntry: Record "Item Ledger Entry";
//         ReturnDictionary: Dictionary of [Code[20], List of [Decimal]];
//         TempList: List of [Decimal];
//         TempQuantity: Decimal;
//         DaysOld: Integer;
//     begin
//         // Returns 1
//         // Message(format(Today() - (Today() - 1)));
//         Item.Reset();
//         Item.SetLoadFields("No.");
//         Clear(ReturnDictionary);
//         if Item.FindFirst() then
//             repeat
//                 Clear(TempList);
//                 TempList.Add(0);
//                 TempList.Add(0);
//                 TempList.Add(0);
//                 TempList.Add(0);
//                 TempList.Add(0);
//                 ItemLedgerEntry.Reset();
//                 ItemLedgerEntry.SetLoadFields("Item No.", Quantity, "Posting Date");
//                 ItemLedgerEntry.SetRange("Item No.", Item."No.");
//                 if ItemLedgerEntry.FindFirst() then
//                     repeat
//                         DaysOld := Today() - ItemLedgerEntry."Posting Date";
//                         // 0-30
//                         if DaysOld <= 30 then begin
//                             TempQuantity := TempList.Get(1);
//                             TempQuantity += ItemLedgerEntry.Quantity;
//                             TempList.Set(1, TempQuantity);
//                         end;
//                         if DaysOld > 30 then begin
//                             // 31-60
//                             if DaysOld <= 60 then begin
//                                 TempQuantity := TempList.Get(2);
//                                 TempQuantity += ItemLedgerEntry.Quantity;
//                                 TempList.Set(2, TempQuantity);
//                             end else
//                                 // 61-90
//                                 if DaysOld <= 90 then begin
//                                     TempQuantity := TempList.Get(3);
//                                     TempQuantity += ItemLedgerEntry.Quantity;
//                                     TempList.Set(3, TempQuantity);
//                                 end else
//                                     // 91-120
//                                     if DaysOld <= 120 then begin
//                                         TempQuantity := TempList.Get(4);
//                                         TempQuantity += ItemLedgerEntry.Quantity;
//                                         TempList.Set(4, TempQuantity);
//                                         // > 120
//                                     end else begin
//                                         TempQuantity := TempList.Get(5);
//                                         TempQuantity += ItemLedgerEntry.Quantity;
//                                         TempList.Set(5, TempQuantity);
//                                     end;
//                         end;
//                     until ItemLedgerEntry.Next() = 0;
//                 ReturnDictionary.Add(Item."No.", TempList);
//             until Item.Next = 0;
//         exit(ReturnDictionary);

//     end;

//     // procedure GetInventoryAging(): Record InventoryAging;
//     // var
//     //     InventoryAging: Record InventoryAging;
//     //     AgingDictionary: Dictionary of [Code[20], List of [Decimal]];
//     //     AgingList: List of [Decimal];
//     //     i: Integer;
//     // begin
//     //     AgingDictionary := CreateDictionary();

//     //     i := 1;
//     //     foreach AgingList in AgingDictionary.Values() do begin
//     //         InventoryAging.Init();
//     //         InventoryAging."Item No." := AgingDictionary.Keys.Get(i);
//     //         InventoryAging."Bucket 1" := AgingList.Get(1);
//     //         InventoryAging."Bucket 2" := AgingList.Get(2);
//     //         InventoryAging."Bucket 3" := AgingList.Get(3);
//     //         InventoryAging."Bucket 4" := AgingList.Get(4);
//     //         InventoryAging."Bucket 5" := AgingList.Get(5);
//     //         InventoryAging.Insert();
//     //         i += 1;
//     //     end;
//     // end;
// }
