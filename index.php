<?php
function afficherXml($xml, $xsl, $id = ""){
	$xmlDoc = new DOMDocument();
	$xmlDoc->load($xml);

	$xslDoc = new DOMDocument();
	$xslDoc->load($xsl);

	$proc = new XSLTProcessor();
	$proc->importStyleSheet($xslDoc);
  $proc->setParameter('', 'id', $id);
	echo $proc->transformToXML($xmlDoc);
}

function ajouterProd($xml){
	$catalog=simplexml_load_file($xml);
	if(isset($_POST['title']) && isset($_POST['artiste']) && isset($_POST['pays'])){
		$cd=$catalog->addChild("cd");
		$cd->addAttribute("id", $_POST['id']);
		$cd->addChild("title", $_POST['title']);
		$cd->addChild("artiste", $_POST['artist']);
		$cd->addChild("country", $_POST['country']);

		$catalog->asXML($xml);
	}
}

function updateFile($xml, $id){
	$catalog = simplexml_load_file($xml);
	$i = 0;

	foreach($catalog as $cd)
	{ 
	  if ($cd->attributes()->id == $id) {
            if (
                isset($_POST['title']) &&
                isset($_POST['artiste']) &&
                isset($_POST['pays'])
            ) {
                $catalog->cd[$i]->title = $_POST['title'];
                $catalog->cd[$i]->artiste = $_POST['artiste'];
                $catalog->cd[$i]->pays = $_POST['pays'];
            }

            $catalog->asXML($xml);
            break;
        }
        $i++;
    }
}

function supprimer($xml, $id)
{
    $catalog = simplexml_load_file($xml);
    $i = 0;
    foreach ($catalog as $cd) {
        if ($cd->attributes()->id == $id) {
            unset($catalog->cd[$i]);
            $catalog->asXML($xml);
            break;
        }
        $i++;
    }
}

if(!isset($_REQUEST["action"])){
  afficherXml("cdcatalogjs.xml", "stylesxsl.xsl");
}
elseif($_REQUEST["action"]== "ajout"){
	if (count($_POST) === 0) {
		afficherXml("cdcatalogjs.xml", "Ajout.xsl");
	}
	else{
  ajouterProd("cdcatalogjs.xml");
  afficherXml("cdcatalogjs.xml", "stylesxsl.xsl");}
}
elseif($_REQUEST["action"]== "modif"){
  $id = $_REQUEST["id"];
  if (count($_POST) === 0) {
  	afficherXml("cdcatalogjs.xml", "Modif.xsl", $id);
  }
  else{
  	updateFile("cdcatalogjs.xml", $id);
  	afficherXml("cdcatalogjs.xml", "stylesxsl.xsl");
  }
}
else {
    $id = $_REQUEST["id"];
    supprimer("cdcatalogjs.xml", $id);
    afficherXml("cdcatalogjs.xml", "stylesxsl.xsl");
    }
    
function rechercher($xml){
	if(isset($_POST['research']))
        {
            $titre = $_POST['name'];
            $catalog = simplexml_load_file($xml);
            foreach($catalog->cd as $cd)
            {
                if(($cd->title == $titre) || ($cd->artist == $titre) || ($cd->id == $titre) || ($cd->country == $titre)) 
                { 
                	$id=$cd['id'];
                        echo "$cd".
                        "<table>".
                                "<tr>"."<th>"."Id"."</th>".
                                        "<th>"."Title"."</th>".
                                        "<th>"."Artiste"."</th>".
                                        "<th>"."Country"."</th>".
                                "</tr>".

                                "<tr>"."<td>"."$id"."</td>".
                                        "<td>"."$cd->title"."</td>".
                                        "<td>"."$cd->artist"."</td>".
                                        "<td>"."$cd->country"."</td>".
                                "</tr>".
                        "</table>";
                        break;
                      }
                    }
                  }
}
rechercher('cdcatalogjs.xml');     
?>
