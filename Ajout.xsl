<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link type="text/css" rel="stylesheet" href="cd_catalog.css"/>
            </head>
            <body>
                <div align="center">
                    <a href="./">&#8592; Collection de CD</a>
                    <form class="form">
                        <xsl:attribute name="action">index.php?action=ajout</xsl:attribute>
                        <xsl:attribute name="method">POST</xsl:attribute>
                       <h2>Formulaire d’ajout d’un produit :</h2>
					    <label for="id">ID :</label>
                        <input type="text" id='id' name='id' />
                        <br /><br />
                        <label for="titre">Title :</label>
                        <input type="text" id='titre' name='title' />
                        <br /><br />
                        <label for="artiste">Artiste :</label>
                        <input type="text" id='artiste' name='artist' />
                        <br /><br />
                        <label for="pays">Country :</label>
                        <input type="text" id='pays' name='country' />
                        <br /><br />
                        <div class="btn-container">
                            <button type="reset">Annuler</button>
                            <button type="submit">Ajouter</button>
                        </div>
                    </form>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>