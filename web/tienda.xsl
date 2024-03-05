<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Módulo: Lenguajes de marcas y sistemas de gestión de la información
Tarea Evaluativa 2:  XSLT
Autora: Núria Domenech
Fecha: 08/03/2024 
Autoevaluación: https://docs.google.com/document/d/1cDSFXCSOhNAx055G6Yq-7QNbz08EBfAn/edit?usp=sharing&ouid=102950208209144052777&rtpof=true&sd=true
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="/club_voleibol">
  <html lang="es">

    <head>
      <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
      <meta name="description" content="Página principal" />
      <title>titulo de la web</title>
    </head>

    <body>
      <header>
        <img src="../img/logotipo.png" alt="Reservas" />
        <a href="tienda.xml">Tienda</a>
        <a href="equipos.xml">Equipos</a>
        <a href="partidos.xml">Partidos</a>
      </header>

      <main class="principal">
	  
        
          <xsl:apply-templates select="tienda"/>
        
		
      </main>

      <footer>
        <address>&#169; Desarrollado por info@birt.eus</address>
      </footer>
    </body>
  </html>
</xsl:template>

<xsl:template match="tienda">
<xsl:for-each select="articulo">
<article>
 	 <section>
		<img class="articulo" src="../img/{@foto}"/>			
	</section>
  <section>
    <h2><xsl:value-of select="precio"/> </h2>
    <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
    <ul>
      <xsl:for-each select="comentarios">
        <li><xsl:value-of select="."/></li>
      </xsl:for-each>
    </ul>
  </section>
  </article>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
