# Run

Make sure your [execution policy](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies) allows this script to run

```powershell
$Url = 'https://raw.githubusercontent.com/keyansheng/setup-script/main/setup-script.psm1'
Invoke-WebRequest -UseBasicParsing $Url | Invoke-Expression
Install-ScoopAndChocolatey
```
