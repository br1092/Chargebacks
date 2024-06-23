// namespace Chargebacks.Chargebacks;

// report 50100 ChargebacksByCustomer
// {
//     ApplicationArea = All;
//     Caption = 'ChargebacksByCustomer';
//     UsageCategory = ReportsAndAnalysis;
//     DefaultRenderingLayout = "ChargebacksByCustomer.docx";
//     dataset
//     {
//         dataitem(ChargebackEntry_BGR; ChargebackEntry_BGR)
//         {
//             column(CustomerNo; "Customer No.")
//             {
//             }
//             column(ChargebackNo; "Chargeback No.")
//             {
//             }
//             column(Amount; Amount)
//             {
//             }
//             column(PostingDate; "Posting Date")
//             {
//             }
//             column(Status; Status)
//             {
//             }
//             column(AccountNo; "Account No.")
//             {
//             }
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(Processing)
//             {
//             }
//         }
//     }
//     rendering
//     {
//         layout(TestWordLayout)
//         {
//             Type = Word;
//             Caption = 'Chargebacks by Customer';
//             Summary = 'Prints Chargebacks by Customer';
//             LayoutFile = 'ChargebacksByCustomer.docx';
//         }
//     }
// }
