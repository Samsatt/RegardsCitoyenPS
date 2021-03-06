Function Get-RCIntervention {
    <#
    .SYNOPSIS
    Retourne une intervention bien particuliere émise lors d'une sceance.
    
    .DESCRIPTION
    fournit l'internvention
    
    .PARAMETER Id
   Permet de recuper une interventions précise.
    

    
    .EXAMPLE
    Get-RCIntervention -id 111161

    id             : 234
    Titre          : réunion du 12 octobre 2017 à 9h30
    Lieu           : Commission de la défense nationale et des forces armées
    Date           : 10/12/2017 9:30:00 AM
    Type           : commission
    Section        :
    SousSection    :
    NomIntervenant :
    Contenu        : <p>Auditions de représentants d'associations d'anciens combattants</p>
    tags           :
    Amendements    :
    Loi            : {}
    
    .NOTES
        -Version: 1.0
        -Author: Stéphane van Gulick 
        -CreationDate: 01/02/2018
        -LastModifiedDate: 01/02/2018
        -History:
            01/02/2018: Creation : Stéphane van Gulick
       
            Blog: www.powershelldistrict.com
            Site Source: www.nosdeputes.fr
    #>


    [cmdletBinding(DefaultParameterSetName="id")]
    Param(

        [Parameter(Mandatory=$true,ParameterSetName="id")]
        [ValidateNotNullOrEmpty()]
        [String[]]$id
     
    )


    switch ($PsCmdlet.ParameterSetName) {

        "id"{
            foreach ($i in $id){
                $urlid = ""
                $urlid = $RC_data.Urls.Intervention + $i + "/json"

                try{
                    $Interventions = Invoke-restmethod -uri $urlid
                }Catch [System.Net.WebException]{
                    write-warning "Server indisponible: Merci de vérifier vôtre connection internet."
                    break
                   
                }Catch{
                    $_.exception.message
                }
                

               
                
                Foreach ($ret in $Interventions.intervention){
                    $Date = ""
                    $Date = $ret.date +" "+ $ret.heure
                    $lois = @()
                    foreach ($loi in $ret.lois){
                        $lois += [int]$loi.id
                    }
                    [Intervention]::New($ret.seance_id,$ret.intervention,$ret.seance_Lieu,$Date,$ret.type,$ret.section_id,$ret.soussection,$ret.intervenant_nom,$ret.intervenant_slug,$ret.Contenu,$ret.Tags,$ret.amendements,$Lois)
                    
                }
                #[ProjetDeLoi]::New($ret.id,$ret.Titre,$ret.nb_interventions,$ret.min_date,$ret.max_date,$ret.intervenants,$ret.documents,$ret.seances,$ret.soussections)
                Continue;
            }
        }
        Default {
            throw "Parameter set -> $($PsCmdlet.ParameterSetName) is undefined"
        }
    }

}