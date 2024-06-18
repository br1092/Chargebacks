// namespace ALProject.ALProject;
// using System.Text;

// codeunit 50101 HelperFunctions
// {
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", OnResolveDateFilterToken, '', true, true)]
//     // local procedure MyFilters(DateToken: Text; var FromDate: Date; var ToDate: Date; Handled: Boolean)
//     // begin
//     //     if DateToken.ToLower() = 'zerotothirty' then begin
//     //         FromDate := Today() - 30;
//     //         ToDate := Today();
//     //         Handled := true;
//     //     end;
//     // end;

//     procedure CreateDaysBackFilter(DaysBack: Integer): Text
//     var
//     // FromDate: Date;
//     // ToDate: Date;
//     // FilterString: Text;
//     begin
//         // FromDate := Today() - DaysBack;
//         exit(format(Today() - DaysBack) + '..' + format(Today()));
//     end;

//     procedure GetNextEntryNo(TableNo: Integer) : Integer
//     var
//         RecRef: RecordRef;
//         FieldRef: FieldRef;
//         KeyRef: KeyRef;
//         LastEntryNo: Integer;
//         KeyIndex: Integer;
//     begin
//         LastEntryNo := 0;
//         RecRef.Open(TableNo);
//         RecRef.SetLoadFields(1);
//         KeyRef := RecRef.KeyIndex(1);
//         FieldRef := KeyRef.FieldIndex(1);
//         KeyIndex := FieldRef.Number;
//         if FieldRef.Type <> FieldRef.Type::Integer then
//             error('Primary Key is no an Integer.');
//         if RecRef.FindLast() then begin
//             FieldRef := RecRef.Field(KeyIndex);
//             LastEntryNo := FieldRef.Value
//         end;
//         RecRef.Close();
//         exit(LastEntryNo+1);
//     end;

// }
