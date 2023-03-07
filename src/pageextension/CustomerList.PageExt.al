pageextension 50100 "LBC Customer List" extends "Customer List"
{

    //#region Documentation
    // DEMO - PMC - 07/03/2023 - This page extends "Customer List" to:
    //  - Add a Demo Action to demostrate extensibility concept.
    //#endregion Documentation

    actions
    {
        addlast(processing)
        {
            group(LBCActionGroup)
            {
                Caption = 'Lacor';
                Visible = true;
                ToolTip = 'It contains demo action related to Lacor Hospital';
                ShowAs = Standard;
                action(LBCShowBalanceAction)
                {
                    ApplicationArea = All;
                    Enabled = true;
                    Caption = 'Show Customer Balance';
                    ToolTip = 'It shows a message containing Customer Balance';
                    Ellipsis = false;
                    trigger OnAction()
                    begin
                        ShowCustomerBalance;
                    end;
                }
            }
        }
        addlast(Promoted)
        {
            group(LBCActionGroup_Promoted)
            {
                Caption = 'Lacor';
                Visible = true;
                ToolTip = 'It contains demo action related to Lacor Hospital';
                ShowAs = Standard;
                actionref(LBCShowBalanceAction_Promoted; LBCShowBalanceAction)
                {
                }
            }
        }
    }   // End Action

    /// <summary>
    /// DEMO - It shows a message with customer balance
    /// </summary>
    local procedure ShowCustomerBalance()
    var
        CustomerBalanceMessageTemplate: Label '%1 for %2 %3 is %4.', MaxLength = 999, Comment = '', Locked = false;
    begin
        Rec.CalcFields("Balance (LCY)");
        // ---
        Message(CustomerBalanceMessageTemplate,
                Rec.FieldCaption("Balance (LCY)"),
                Rec.TableCaption,
                Rec."No.",
                Format(Rec."Balance (LCY)", 0, 9));
    end;


}