Enum Parti {
    NI = 0
    GDR = 1
    LFI = 2
    LREM = 3
    LC = 4
    LR = 5
    MODEM = 6
    NG = 7
    UAI = 8
}

Enum Sexe {
    NC = 0
    F = 1
    H = 2
}


Enum RechercheType{
    Parlementaire
    Organisme
    Intervention
    Amendement
    QuestionEcrite
    Section
    Texteloi
    Commentaire
}

Enum Format{
    json
    xml
    csv
}

Class GroupePolitique {
    [int]$id
    [string]$Slug
    [string]$Nom
    [string]$Acronyme
    [string]$GroupeActuel
    [string]$Couleur
    [string]$Type
    [string]$Order
    [string]$urlNosDeputes
    hidden [string]$urlNosDeputesAPI
    
    GroupePolitique([int]$id,[string]$slug,[string]$nom,[string]$Acronyme,[string]$GroupeActuel,[string]$Couleur,[String]$Order,[string]$Type,[string]$urlNosDeputes,[string]$urlNosDeputesAPI){
        $this.id = $id
        $this.Slug = $slug
        $this.nom = $nom
        $this.Acronyme = $Acronyme
        $this.GroupeActuel = $GroupeActuel
        $this.Couleur = $Couleur
        $this.order = $Order
        $this.type = $type
        $this.urlNosDeputes = $urlNosDeputes   
        $this.urlNosDeputesAPI = $urlNosDeputesAPI
    }

    
}

Class Mandat {
    [String]$Commune
    [String]$Entite
    [String]$Fonction

    Mandat([String]$Commune,[String]$Entite,[String]$Fonction){
        $this.Commune = $Commune
        $this.Entite = $Entite
        $This.Fonction = $Fonction
    }
}

Class Identite{
    [String]$Nom
    [String]$Prenom
    [Sexe]$Sexe
    [DateTime]$DateNaissance
    [String]$LieuNaissance
    [String]$Profession

    Identite([String]$Nom,[String]$Prenom,[Sexe]$Sexe,[Datetime]$DateNaissance,[String]$LieuNaissance,[String]$Profession){
        $this.Nom = $Nom
        $this.Prenom = $Prenom
        $this.Sexe = $Sexe
        $this.DateNaissance = $DateNaissance
        $this.LieuNaissance = $LieuNaissance
        $this.Profession = $Profession  
    }
}

Class IdentitePolitique{
    [String]$Groupe
    [String]$NomCirconscription
    [int]$numcirco
    [int]$PlaceHemicylce
    [DateTime]$DebutDeMandat
    [String[]]$Collaborateurs
    [String]$partirattfinancier
    [int]$NombreDeMandats

    IdentitePolitique([String]$Groupe,[String]$NomCirconscription,[int]$numcirco,[int]$PlaceHemicylce,[DateTime]$DebutDeMandat,[String[]]$Collaborateurs,[String]$partirattfinancier,[int]$NombreDeMandats){
        $this.Groupe = $Groupe
        $this.NomCirconscription = $NomCirconscription
        $this.numcirco = $numcirco
        $this.PlaceHemicylce = $PlaceHemicylce
        $this.DebutDeMandat = $DebutDeMandat
        $this.Collaborateurs = $Collaborateurs
        $this.partirattfinancier = $partirattfinancier
        $this.NombreDeMandats = $NombreDeMandats
    }
}

Class Contact {
    [String]$Twitter
    [String[]]$Email
    [String[]]$Siteweb

    Contact ([String]$Twitter,[String[]]$Email,[String[]]$Siteweb){
        $this.Twitter = $Twitter
        $this.Email = $Email
        $this.Siteweb = $Siteweb
    }
}


Class Depute{
    [int]$id
    [Identite]$Identite
    [IdentitePolitique]$IdentitePolitique
    [Contact]$Contact
    [Mandat[]]$autresmandats
    

    static [depute] NewDepute (){
        return [Depute]::New()
    }

    [Depute]SetId([int]$Id){
        $this.id = $id
        return $this
    }

    [Depute] AddIdentite([Identite]$Identite){
        $this.Identite = $Identite
        return $this
    }

    [Depute] AddIdentitePolitique([IdentitePolitique]$IdentitePolitique){
        $this.IdentitePolitique = $IdentitePolitique
        return $this
    }

    [Depute] AddContact([Contact]$Contact){
        $this.contact = $Contact
        return $this
    }

    [Depute] AddAutresMandats([Mandat]$AutresMandats){
        $this.autresmandats = $AutresMandats
        return $this
    }

    
    
    
}

Class Synthese{
    [int]$id
    [String]$Nom
    [String]$Groupe
    [int]$AmendementsAdoptes
    [int]$AmendementsProposes
    [int]$AmendementsSignes
    [int]$CommisionInterventions
    [int]$CommisionPresences
    [int]$hemicycleInterventions
    [int]$hemicycleInterventionsCourtes
    [int]$PropositionEcrites
    [int]$PropositionsSignees
    [int]$QuestionsEcrites
    [int]$QuestionsOrales
    [int]$Rapports
    [int]$SemainesPresence
   

    Synthese([int]$id,[String]$Nom,[String]$Groupe,[int]$AmendementsAdoptes,[int]$AmendementsProposes,[int]$AmendementsSignes,[int]$CommisionInterventions,[int]$CommisionPresences,[int]$hemicycleInterventions,[int]$hemicycleInterventionsCourtes,[int]$PropositionEcrites,[int]$PropositionsSignees,[int]$QuestionsEcrites,[int]$QuestionsOrales,[int]$Rapports,[int]$SemainesPresence){
        $this.id = $id
        $this.Nom = $Nom
        $This.Groupe = $Groupe
        $This.AmendementsAdoptes = $AmendementsAdoptes
        $This.AmendementsProposes = $AmendementsProposes
        $This.AmendementsSignes = $AmendementsSignes
        $This.CommisionInterventions = $CommisionInterventions
        $This.CommisionPresences = $CommisionPresences
        $This.hemicycleInterventions = $hemicycleInterventions
        $This.hemicycleInterventionsCourtes = $hemicycleInterventionsCourtes
        $This.PropositionEcrites = $PropositionEcrites
        $This.PropositionsSignees = $PropositionsSignees
        $This.QuestionsEcrites = $QuestionsEcrites
        $This.QuestionsOrales = $QuestionsOrales
        $This.Rapports = $Rapports
        $This.SemainesPresence = $SemainesPresence
    }
    
}

Class Intervention {
    [int]$id
    [string]$Titre
    [String]$Lieu
    [DateTime]$Date
    [String]$Type
    [String]$Section
    [String]$SousSection
    [String]$NomIntervenant
    hidden [String]$slugIntervenant
    [String]$Contenu
    [String]$tags
    [String]$Amendements
    [Int[]]$Loi

    Intervention ([Int]$Id,[String]$Titre,[String]$Lieu,[DateTime]$Date,[String]$Type,[String]$Section,[String]$SousSection,[String]$NomIntervenant,[String]$SlugIntervenant,[String]$Contenu,[String]$Tags,[String]$Amendements,[int[]]$Loi){
        $this.id = $Id
        $this.Titre = $Titre
        $this.Lieu = $Lieu
        $this.Date = $Date
        $this.Type = $Type
        $this.Section = $Section
        $this.SousSection = $SousSection
        $this.NomIntervenant = $NomIntervenant
        $this.slugIntervenant = $SlugIntervenant
        $this.Contenu = $Contenu
        $this.tags = $Tags
        $this.Amendements = $Amendements
        $this.Loi = $Loi
    }
}

Class Dossier {
    [int]$id
    [string]$Titre
    [Datetime]$MinDate
    [DateTime]$MaxDate
    [int]$NbInterventions
    [Object[]]$Intervenants
    [Intervention[]]$Seances
    [Document[]]$Documents
    [String[]]$SousSection
    hidden [string[]]$Id_intervenants
    hidden [string[]]$id_seances
    hidden [string[]]$id_documents
    hidden [string[]]$id_soussections


    Dossier([int]$id,[String]$Titre,[int]$NbInterventions,[DateTime]$minDate,[DateTime]$MaxDate,[string[]]$Id_intervenants,[String[]]$id_seances,[string[]]$id_documents,[string[]]$id_soussections){
        $this.id = $id
        $this.Titre = $Titre
        $this.NbInterventions = $NbInterventions
        $this.MinDate = $minDate
        $this.MaxDate = $MaxDate
        $this.Id_intervenants = $Id_intervenants
        $this.id_documents = $id_documents
        $this.id_seances = $id_seances
        $this.id_soussections = $id_soussections
    }
    
    hidden [Void] _LoadIntervenants(){
        
        write-verbose "Chargement des intervenants.."

        if ($this.Id_intervenants){
            [Depute[]]$inter = @()
            foreach ($Id in $this.Id_intervenants){
                
                $temp = Get-RCDepute -Slug $id
                $this.Intervenants += $temp
            }

              
        }

    }

    hidden [void] _LoadSeances(){
        write-verbose "Chargement des seances.."
        if ($this.id_seances){
            $Interventions += @()
            foreach ($id in $this.id_seances){

                $Interventions += Get-RCSeance -id $id

            }

            $this.Seances = $Interventions  
        }
        
        
    }

    hidden [Void] _LoadDocuments(){

        write-verbose "Chargement des seances.."
        if ($this.id_documents){
            $Docs += @()
            foreach ($id in $this.id_documents){

                $Docs += Get-RCDocument -id $id

            }

            $this.Documents = $Docs  
        }
        
        
    }

    hidden [Void] _LoadSousSections(){
        #Jusqu'a  présent, j'ai trouver aucun dossier qui contenait des sous sections.
        #Pas implémentée du coté de NosDeputes.fr?
        write-verbose "Chargement des seances.."
        if ($this.id_soussections){
            $soussec += @()
            foreach ($id in $this.id_soussections){

                $soussec += Get-RCSousSection -id $id

            }

            $this.SousSection = $soussec  
        }
         
    }

    [Dossier] Full(){
        $this._LoadSeances()
        $this._LoadDocuments()
        $this._LoadIntervenants()
        
        #Sous Sections reelement implementé?
        #$this._LoadSousSections()

        return $this
    }

}



Class Circonscription {
    [String]$Nom
    [string]$Num

    Circonscription ([String]$Nom,[Int]$Num){
        $this.nom = $Nom
        $this.num = $Num
    }
}



Class Document {
    [string]$id
    [String]$titre
    [string]$nbcommentaires
    [String]$legislature
    [string]$annexe
    [String]$Type
    [String]$typeDetails
    [String]$Categorie
    [String]$iddossieran
    [datetime]$Date
    hidden[String]$Sourceurl
    [String]$organismeid
    [string]$Signataires
    [String]$Contenue
    hidden[String]$urlNosDeputes

    Document ([string]$id,[String]$titre,[String]$nbcommentaires,[string]$legislature,[string]$annexe,[string]$type,[String]$typeDetails,[String]$Categorie,[string]$iddossieran,[datetime]$date,[string]$Sourceurl,[String]$organismeid,[string]$Signataires,[string]$Contenue,[string]$urlNosDeputes){
    
        $this.id = $id
        $this.titre = $titre
        $this.nbcommentaires = $nbcommentaires
        $this.legislature = $legislature
        $this.annexe =$annexe
        $this.Type = $type
        $this.typeDetails = $typeDetails
        $this.Categorie = $Categorie
        $this.iddossieran = $iddossieran
        $this.Date = $date
        $this.Sourceurl = $Sourceurl
        $this.organismeid = $organismeid
        $this.Signataires= $Signataires
        $this.Contenue = $Contenue
        $this.urlNosDeputes = $urlNosDeputes
    }
}

Class Organisme{
    [int]$Id
    [String]$Nom
    [string]$Type
    Hidden [String]$Slug
    Hidden [string]$api
    [Depute[]]$Membres

    Organisme([int]$id,[String]$Nom,[String]$Type,[String]$Slug,[String]$api){
        $this.Id = $id
        $This.Nom = $Nom
        $this.Type = $Type
        $this.Slug = $slug
        $this.api = $api
    }

    [void]_LoadMembres(){
        $mem = invoke-restMethod -Uri $this.api

        

        foreach($entry in $mem.Deputes.Depute){

            $Collaborateurs = @()
                foreach ($col in $entry.Collaborateurs.Collaborateur){
                        $Collaborateurs += $col
                }

                $autresmandats = @()
                foreach ($autreMandat in $entry.autres_mandats.mandat){
                        $mandat = ""
                        $mandat = $autreMandat.replace(" ","").split("/")
                        if ($mandat){
                            $autresmandats += [Mandat]::New($mandat[0],$mandat[1],$mandat[2])

                        }
                }

                $Emails = @()
                foreach ($mail in $entry.emails.email){
                        $Emails += $mail
                }

            $this.Membres +=[Depute]::New($entry.id,$entry.nom_de_famille,$entry.prenom,$entry.groupe_sigle,$entry.date_naissance,$entry.lieu_naissance,$entry.sexe,$entry.nom_circo,$entry.num_circo,$entry.place_en_hemicycle,$entry.mandat_debut,$entry.profession,$entry.twitter,$entry.nb_mandats,$entry.parti_ratt_financier,$autresmandats,$Collaborateurs,$Emails)
            #$this.Membres += [Depute]::New()
        }
    }

    [Depute[]]GetMembres(){
        if(!($this.Membres)){
            $this._LoadMembres()
        }
        return $this.Membres
    }

    [Depute]GetPresident(){
        if (!$this.Membres){
            $this._LoadMembres()
        }

        $President = $this.Membres | ? {$_.Fonction -eq "President"}
        return $President

        return $this.Membres
    }
    [Depute[]]GetVicePresident(){
        #tbd
        return $this.Membres
    }
}