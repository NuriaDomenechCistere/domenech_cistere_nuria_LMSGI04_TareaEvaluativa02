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

		
		<main>
			  <xsl:apply-templates select="equipo"/>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="equipo">
<xsl:variable name="nombre_entrenador" select="entrenador/nombre"/>
    <xsl:choose>
        <xsl:when test="entrenador/nombre='Julio Velasco'">
            <h1><a href="{entrenador/url}"><xsl:value-of select="$nombre_entrenador"/></a></h1>
            <article class="equipos">
                <h4><xsl:value-of select="nombre"/></h4>
                <p>
                    <xsl:apply-templates select="jugadores/jugador[@titular='si']"/>
                </p>
            </article>
        </xsl:when>
    </xsl:choose>
</xsl:template>

<xsl:template match="jugadores/jugador[@titular='si']">
    <p>
        <xsl:value-of select="@camiseta"/> -
        <xsl:value-of select="nombre"/>
    </p>
</xsl:template>

</xsl:stylesheet>