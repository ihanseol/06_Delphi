{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Memo.Types;

interface

{$SCOPEDENUMS ON}

uses
  FMX.Text, FMX.Text.UndoManager;

type
  TInsertOption = FMX.Text.TInsertOption deprecated 'use FMX.Text.TInsertOption instead';
  TInsertOptions = FMX.Text.TInsertOptions deprecated 'use FMX.Text.TInsertOptions instead';

  TDeleteOption = FMX.Text.TDeleteOption deprecated 'use FMX.Text.TDeleteOption instead';
  TDeleteOptions = FMX.Text.TDeleteOptions deprecated 'use FMX.Text.TDeleteOptions instead';

  TActionType = FMX.Text.UndoManager.TActionType deprecated 'use FMX.Text.UndoManager.TActionType instead';
  TFragmentInserted = FMX.Text.UndoManager.TFragmentInserted deprecated 'use FMX.Text.UndoManager.TFragmentInserted instead';
  TFragmentDeleted = FMX.Text.UndoManager.TFragmentDeleted deprecated 'use FMX.Text.UndoManager.TFragmentDeleted instead';

  TSelectionPointType = (Left, Right);

  // Type alias for backward compatibility
  TCaretPosition = FMX.Text.TCaretPosition;

implementation

end.
