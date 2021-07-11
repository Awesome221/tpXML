<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:template match="/">
        <html>

            <head>
                <link type="text/css" rel="stylesheet" href="cd_catalog.css"/>

            </head>
            <body>
                <h1>projetXML</h1>

                <a href="index.php?action=ajout">Ajouter un nouveau produits </a>
                <div align="right">
                    <form method="POST" action="index.php">   
                        <label for="name">Recherche: </label>
                        <input type="text" name="name" placeholder="rechercher par titre, artiste..."/>
                        
                        <label for="research"></label>  
                        <input type="submit" name="research" value="submit"/>
                    </form>
                    </div>
                <br/>
                <br />
                <table>
                    <tr><th>ID</th>
                        <th>Title</th>
                        <th>Artist</th>
                        <th>Country</th>
                        <th>Image</th>
                        <th>Modifier</th>
                        <th>Supprimer</th>
                    </tr>
                    <xsl:for-each select="catalog/cd">
                        <tr>
                            <td>
                                <xsl:value-of select="@id"/>
                            </td>
                            <td>
                                <xsl:value-of select="title"/>
                            </td>
                            <td>
                                <xsl:value-of select="artist"/>
                            </td>
                            <td>
                                <xsl:value-of select="country"/>
                            </td>
                            <td>
                                <xsl:for-each select="image">
                                    <img style="width:100px" align="">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="@url"/>
                                        </xsl:attribute>
                                    </img>
                                </xsl:for-each>
                            </td>
                            <td>
                                <a>
                                    <xsl:attribute name="href">
                                       index.php?action=modif&amp;id=<xsl:value-of select="@id"/>
                                    </xsl:attribute>
                                    Modifier</a>
                            </td>
                            <td>
                                <a>
                                    <xsl:attribute name="href">
                                        index.php?action=supp&amp;id=<xsl:value-of select="@id"/>
                                    </xsl:attribute>
                                    Supprimer</a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
