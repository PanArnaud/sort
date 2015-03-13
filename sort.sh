#!/bin/bash



#Suppression du fichier test courant
rm --recursive test/
#Création du fichier test
mkdir test/
cd test/

##Début Génération

#Première boucle for permettant de créer 5 dossiers de fichier txt
for i in `seq 1 5`; do
	#Nous allons travailler sur des liste de i * 1000 nombres
	let "folder = $i * 700"
	#Création du répertoire portant le nom du nombre de ligne d'un fichier txt
	mkdir $folder/
	#Cette boucle for se charge d'éxécuter le script permettant la génération de la liste de nombre aléatoire
	for j in `seq 1 8`; do
		php ../gen.php N=$folder > $folder/"${folder}_${j}.txt"
	done
done

##Fin Génération

#Cette boucle for va parcourir tout les dossier que nous avons créer
for i in '700' '1400' '2100' '2800' '3500'; do #  '1500' '2000' '2500'
	cd $i
	
	for fichier in `ls`; do
		for function in 'bubble' 'insertion_star' 'selection' 'insertion'; do #  'selection' 'insertion'
		 	(time -p php ../../driver.php F="${function}" N="${i}" < $fichier) 2>> time_"${function}".txt
		done
	done	

	for function in 'bubble' 'insertion_star' 'selection' 'insertion'; do # 'insertion_star' 'selection' 'insertion'
		sed -i '/real/d' time_"${function}".txt
		sed -i '/^[\t]*$/d' time_"${function}".txt
		(awk '{print $NF}' time_"${function}".txt) > timer_"${function}".txt
		rm time_"${function}".txt

		nblignes_partielles=$(awk 'END { print NR }' timer_"${function}".txt)
		(nawk '{ print(total+=$1) }' timer_"${function}".txt) > somme_partiel_"${function}".txt
		rm timer_"${function}".txt
		somme=$(tail -1 somme_partiel_"${function}".txt)	
		average=$(echo "scale=3; $somme" / "($nblignes_partielles " / "2)" | bc)
		echo $average	$i >> ../average_"${function}".dat
	done

	cd ../
done

gnuplot ../plot.sh