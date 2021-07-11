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
                    <a href="./">&#8592; liste des produits</a>
                    <xsl:for-each select="catalog/cd[@id=$id]">
                        <form class='form'>
                            <xsl:attribute name="action">index.php?action=modif&amp;id=<xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:attribute name="method">POST</xsl:attribute>
                            <h2>Formulaire d’edition du cd :<xsl:value-of select="@id"/></h2>
                            <div class="img">
                                <img>
                                    <xsl:attribute name="style">width:50px</xsl:attribute>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="image"/>
                                    </xsl:attribute>
                                </img>
                            </div>
                            <label for="titre">Title :</label>
                            <input type="text" id='titre' name='titre'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="title"/>
                                </xsl:attribute>
                            </input>
                            <label for="artiste">Artiste :</label>
                            <input type="text" id='artiste' name='artiste'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="artist"/>
                                </xsl:attribute>
                            </input>
                            <label for="pays">Country :</label>
                            <input type="text" id='pays' name='pays'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="country"/>
                                </xsl:attribute>
                            </input>

                            <label for="image">Image :</label>
                            <input type="text" id='image' name='image'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="image"/>
                                </xsl:attribute>
                            </input>
                            
                            <div class="btn-container">
                                <button type="reset">Annuler</button>
                                <button type="submit">Modifier</button>
                            </div>
                        </form>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>