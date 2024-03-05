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
		<meta charset="utf-8"/>
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
			<h1>PARTIDOS</h1>

            <table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>
             <xsl:apply-templates select="partido">
			 <xsl:sort select="fecha" order="descending" />
			 </xsl:apply-templates>
			</table>	
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="partido">
    <xsl:choose>
        <xsl:when test="lugar/@ciudad='Lima'">
				<tr>
					<td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
					<td><xsl:value-of select="fecha"/></td>
                    <xsl:choose>
	<xsl:when test="equipos/local/@puntuacion &lt; equipos/visitante/@puntuacion">

    <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
    </xsl:when>
    <xsl:otherwise>
				<td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
	</xsl:otherwise>
	</xsl:choose>
					 
				</tr>
				
        </xsl:when>
    </xsl:choose>
</xsl:template>






</xsl:stylesheet>