{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit NullLoggerImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    SerializeableIntf,
    LoggerIntf,
    AbstractLoggerImpl;

type

    (*!------------------------------------------------
     * logger class that log thing to STDOUT
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    TStdOutLogger = class(TAbstractLogger, ILogger)
    public
        (*!--------------------------------------
         * log message
         * --------------------------------------
         * @param level type of log
         * @param msg log message
         * @param context data related to log message
         *               (if any)
         * @return current instance
         *---------------------------------------*)
        function log(
            const level : string;
            const msg : string;
            const context : ISerializeable = nil
        ) : ILogger; override;
    end;

implementation

    (*!--------------------------------------
     * log message
     * --------------------------------------
     * @param level type of log
     * @param msg log message
     * @param context data related to log message
     *               (if any)
     * @return current instance
     *---------------------------------------*)
    function TStdOutLogger.log(
        const level : string;
        const msg : string;
        const context : ISerializeable = nil
    ) : ILogger;
    begin
        writeln(
            '[', level,'] ',
            FormatDateTime('yyyy-mm-dd hh:nn:ss', Now),
            ' ',
            msg
        );
        if (context <> nil) then
        begin
            writeln('==== Start context ====');
            writeln(context.serialize());
            writeln('==== End context ====');
        end;
        result := self;
    end;

end.
