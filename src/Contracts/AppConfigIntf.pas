#------------------------------------------------------------
# Prack Simple Scalable Web Server (https://github.com/zamronypj/Prack)
#
# @copyright 2018 Ricardo Cruz
# @license   https://github.com/zamronypj/Prack/blob/master/LICENSE (MIT)
#-------------------------------------------------------------

unit AppConfigIntf;

interface

{$mode objfpc}{$H+}

type

    (*!------------------------------------------
     * interface for any class having capability to
     * get application configuration
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *--------------------------------------------*)
    IAppConfig = interface
      ['{B6EC6A70-9498-4E21-B634-F7C9636CF6D7}']

      function has(const opt : string) : boolean;
      function getValue(const opt : string; const defValue : string = '') : string;
    end;

implementation
end;
