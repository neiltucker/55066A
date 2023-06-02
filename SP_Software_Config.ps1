cls
Echo "*****     The Installation of SharePoint 2013 will begin shortly ....     *****"
Echo "*****     Please wait until the process is complete (10 - 20 minutes)     *****"
D:
CD \SharePoint\SP2013
Start-Process -Wait -NoNewWindow -PassThru -FilePath D:\SharePoint\SP2013\Setup.exe -ArgumentList "/Config D:\Labfiles\SP_Software_Config.xml"