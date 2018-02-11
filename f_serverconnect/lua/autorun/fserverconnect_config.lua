--[[----------------------------------------------
	Général Config
-------------------------------------------------]]

FServerConnect = FServerConnect or {}

-- Model du pnj
FServerConnect.Model = "models/Eli.mdl"

-- Nom du serveur actuel
FServerConnect.ServerName = "TonServeur"

-- Nom du second serveur
FServerConnect.SecondServerName = "TonServeur"

-- Adresse ip du second serveur
FServerConnect.ServerIP = "192.168.1.67"

-- Port du second serveur
FServerConnect.Port = "27017"

-- Puissance du blur dans la frame
FServerConnect.BlurPower = 50

-- Dessiner le nom de l'addon au dessus du pnj
FServerConnect.DrawAddonName = true

-- Message de bienvenue, {name} est le pseudo du joueur
FServerConnect.WelcomeMSG = "Bienvenue {name}"

-- Message de demande, {name} est le nom du serveur
FServerConnect.Suggestion = "Souhaites tu te connecter au serveur {name} ?"
