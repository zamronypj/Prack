#------------------------------------------------------------
# Prack Simple Scalable Web Server (https://github.com/zamronypj/Prack)
#
# @copyright 2018 Ricardo Cruz
# @license   https://github.com/zamronypj/Prack/blob/master/LICENSE (MIT)
#-------------------------------------------------------------

unit AppConfigImpl;

interface

{$mode objfpc}{$H+}

type

    (*!------------------------------------------
     * interface for any class having capability to
     * get application configuration
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *--------------------------------------------*)
    TAppConfig = class (TInterfacedObject, IAppConfig)
    public
        function has(const opt : string) : boolean;
        function getValue(const opt : string; const defValue : string = '') : string;
    end;

implementation

    function TAppConfig.has(const opt : string) : boolean;
    begin

    end;

    function TAppConfig.getValue(const opt : string; const defValue : string = '') : string;
    begin
    end;
end;
