void creation_login

{
	printf ("Nom : ");
	scanf("%s", employe.nom);
	printf ("Prenom : ");
	scanf ("%s",employe.prenom);
	
	//------------------------------------ créer le username
	
	strncpy(partnom, employe.nom, 6); // on garde 6 lettres du nom de famille
	printf("%s\n", partnom);
	
	strncpy(pseudo, employe.prenom, 1); //la première lettre du prénom en début d'username
	printf("%s\n", pseudo);

	strcat(pseudo,partnom); //on concatène l'initiale du prénom avec les 6 premières lettres du nom 

	printf("%s\n", pseudo);

	strcpy(employe.login_emp.username, pseudo); // on enregistre le pseudo donné dans la struct associée
	
	printf("%s",employe.login_emp.username);
	
	// pour ajouter un chiffre à la fin d'un doublon 
	
	fp=fopen(nomfichier, "r");
	
	recherche(employe.login_emp.username);
	
	if (numero != NON_TROUVE)
	{
		strcat(employe.login_emp.username, i);
		i++ //utilisation de i tout username doublon confondu pour éviter les triplons 
	}
	
	
	//----------------------------------------- créer le mot de passe
	printf("Vous avez maintenant besoin d'un administrateur pour intervenir sur le mot de passe de cet employe");

	while (((strcmp(numutilisateur,employe.login_emp.username[i]))&&(strcmp(motdepasse,employe.login_emp.motdepasse[i]))!=0))
	{
	printf("Entrez votre nom d'utilisateur administrateur : ");
	scanf ("%s", nomutilisateur);
	printf ("Entrez votre mot de passe administrateur : ");
	scanf ("%s", motdepasse);
	}

	
	while ((choixauto != 1)&&(choixauto !=2)&&(choixauto!=3))
	
	{
		printf ("Veuillez entrer le mot de passe choisi : ");
		scanf ("%s", motdepasse);
		strcpy(employe.login_emp.mdp, motdepasse)
		printf ("Quel type est le niveau de droit de cet utilisateur ?\n");
		printf ("1 - Autorisations administrateur (service informatique)\n");
		printf ("2 - Autorisations ressources humaines (service ressources humaines)\n");
		printf ("3 - Autorisations basiques (autres services, usagers)");
		scanf ("%d", &choixauto);
		
		switch (choixauto)
		{
			case 1 : 
				{
				employe.login_emp.valdroit = 0;	//droits administrateur
				}
				break;
			case 2 :
				{
				employe.login_emp.valdroit = 1; //droits rh
				}
				break;
			case 3 :
				{
				employe.login_emp.valdroit = 2; //droits usagers basiques	
				}
			break;
			default : printf ("Mauvaise saisie");
				break;
		}
		
		
	}
	}
	
	
	
}

// ce qui est en fait le menu principal, avec demande du mdp et droits associés
{
	int droits, i, aide;
	char nomutilisateur[TAILLE_NOM], motdepasse[TAILLE_NOM];
	
	i=-1
	for (i=0, i<Nb_Utilisateur, i++)

	while (((strcmp(numutilisateur,employe.login_emp.username[i]))&&(strcmp(motdepasse,employe.login_emp.motdepasse[i]))!=0)&&(aide!=1))
	{
	printf("Entrez votre nom d'utilisateur");
	scanf ("%s", nomutilisateur);
	printf ("Entrez votre mot de passe : ");
	scanf ("%s", motdepasse);

		if ((strcmp(numutilisateur,employe.login_emp.username[i]))&&(strcmp(motdepasse,employe.login_emp.motdepasse[i]))!=0)
		{ 
			creermotdepasse();
		}
	
	}

	droits = employe.login_emp.valdroit[i];
	
		switch droits
		case 1 :
			{
				menu admin
			}
			break;
		case 2 :
			{
				menu RH
			}
			break;
		case 3 :
			{
				menu usager
			}
			break;
	}
	else
	{
		printf("Mauvaise saisie\n");
	}
}
