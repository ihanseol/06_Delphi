{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2024 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit DesignerTypes;

interface

type
  TShowState = (ssNormal, ssMinimized, ssMaximized);

  TDesignerStateItem = (dsVisible, dsIconic, dsZoomed);
  TDesignerState = set of TDesignerStateItem;

implementation

end.
