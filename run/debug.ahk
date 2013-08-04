global kLogFile := "debug.log"

LogWrite(data)
{
	;FileAppend, %data%`n, %kLogFile%
}
