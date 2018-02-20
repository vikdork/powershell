﻿function Get-SpecMelStatus
{
<#
.SYNOPSIS
   Skript för att kolla om man har skydd för Spectre och Meltdown
.DESCRIPTION
   Skriptet kollar om man har skydd mot meltdown och Spectre. Det använder sig av micrsofts verktyg för att verifiera om systemet är säkert eller osäkert: https://www.powershellgallery.com/packages/SpeculationControl/1.0.4
   Kör skriptet först för att ladda in funktionen sen kör man det som i exemplen här under. Man måste autentisera sig med ett konto som har administrativa rättigehter på destinationsdatorn
.EXAMPLE
   Get-specMelStatus -computers huddp5132l2
.EXAMPLE
   Get-specMelStatus -computers huddp5132l2, test-viktor01
#>

    [CmdletBinding()]
    Param
            
            ([Parameter(Mandatory=$true,
              ValueFromPipelineByPropertyName=$true,
              Position=0)]
              $Computers
    {
        
            if (-Not (test-path ("\\" + $compName + "\c$\temp\SpeculationControl.psd1")))
            {
               Copy-Item "\\srvdc01\power\Spectre\sp*" -Destination ($compName + ":")
            }
    }
}