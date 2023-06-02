# The ArpWrite action row in the global\oserver.msi file sometimes creates problems for the msi installer during SharePoint setup
# This row has been removed from the customized oserver.msi file used for this classroom setup to prevent this problem.
D:
CD \SharePoint\SP2013\Global
Rename-Item oserver.msi oserver.old -Force -ErrorAction SilentlyContinue
Copy-Item D:\Tools\oserver.new D:\SharePoint\SP2013\Global\oserver.msi -Force 
