<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xml [
  <!ENTITY nbsp   "&#160;">
  <!ENTITY aelig  "&#230;">
  <!ENTITY eacute "&#233;">
  <!ENTITY quot   "&#34;">
  <!ENTITY ndash  "&#8211;">
]>

<xsl:stylesheet version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" doctype-system="" doctype-public="" indent="yes" omit-xml-declaration="no" />

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:xhtml="http://www.w3.org/1999/xhtml"
      xmlns:xlink="http://www.w3.org/1999/xlink">
      <head>
        <title>Curriculum Vit&aelig; | R&eacute;sum&eacute;</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" />
        <link rel="stylesheet" type="text/css" href="/css/cv.css" />
      </head>
      <body>
        <xsl:apply-templates select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' hresume ')][1]" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="node()[contains(concat(' ', @class, ' '), ' hresume ')]">
    <div style="width:80%;padding:10%;">
      <xsl:choose>
        <xsl:when test="descendant-or-self::node()[name()='header']">
          <xsl:apply-templates select="descendant-or-self::node()[name()='header'][1]" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' vcard ')][1]" />
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="descendant-or-self::node()[name()='section' and count(ancestor::node()[name()='section']) = 0]">
          <xsl:apply-templates select="descendant-or-self::node()[name()='section' and count(ancestor::node()[name()='section']) = 0]" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' summary ')]">
            <h1 class="subsection">Summary</h1>
            <xsl:variable name="summary" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' summary ')][1]" />
            <p>
              <xsl:value-of select="$summary" />
              <xsl:call-template name="footnote"><xsl:with-param name="element" select="$summary" /></xsl:call-template>
            </p>
          </xsl:if>
          <xsl:if test="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' vevent ') and contains(concat(' ', @class, ' '), ' education ')]">
            <h1 class="subsection">Education</h1>
            <ol class="itemize">
              <xsl:for-each select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' vevent ') and contains(concat(' ', @class, ' '), ' education ')]">
                <li class="li-itemize">
                  <xsl:apply-templates select="self::node()" />
                </li>
              </xsl:for-each>
            </ol>
          </xsl:if>
          <xsl:if test="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' vevent ') and contains(concat(' ', @class, ' '), ' experience ')]">
            <h1 class="subsection">Experience</h1>
            <ol class="itemize">
              <xsl:for-each select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' vevent ') and contains(concat(' ', @class, ' '), ' experience ')]">
                <li class="li-itemize">
                  <xsl:apply-templates select="self::node()" />
                </li>
              </xsl:for-each>
            </ol>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="descendant-or-self::node()[name()='footer'][1]">
          <xsl:apply-templates select="descendant-or-self::node()[name()='footer'][1]" />
        </xsl:when>
        <xsl:when test="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' footnotes ')]">
          <hr />
          <dl class="thefootnotes">
            <xsl:apply-templates select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' footnotes ')]" />
          </dl>
        </xsl:when>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template match="node()[name()='header']">
    <xsl:apply-templates select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' vcard ')][1]" />
  </xsl:template>

  <xsl:template match="node()[contains(concat(' ', @class, ' '), ' vcard ')]">
    <div class="row">
      <div class="flushleft">
        <b><xsl:value-of select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' fn ')][1]" /></b><br />
        <xsl:apply-templates select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' adr ')][1]" />
      </div>
      <div class="flushright">
        <xsl:for-each select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' url ') or contains(concat(' ', @class, ' '), ' email ') or contains(concat(' ', @class, ' '), ' tel ')]">
          <xsl:call-template name="linkify"><xsl:with-param name="element" select="self::node()" /></xsl:call-template>
          <xsl:call-template name="footnote"><xsl:with-param name="element" select="self::node()" /></xsl:call-template>
          <br />
        </xsl:for-each>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="node()[contains(concat(' ', @class, ' '), ' adr ')]">
    <xsl:variable name="sa" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' street-address ')]" />
    <xsl:variable name="loc" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' locality ')]" />
    <xsl:variable name="reg" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' region ')]" />
    <xsl:variable name="pc" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' postal-code ')]" />
    <xsl:for-each select="$sa">
      <xsl:value-of select="self::node()" /><br />
    </xsl:for-each>
    <xsl:value-of select="$loc" />
    <xsl:if test="string($loc) and string($reg)">&nbsp;</xsl:if>
    <xsl:value-of select="$reg" />
    <xsl:if test="(string($loc) or string($reg)) and string($pc)">&nbsp;&nbsp;</xsl:if>
    <xsl:value-of select="$pc" />
    <xsl:if test="string($loc) or string($reg) or string($pc)"><br /></xsl:if>
  </xsl:template>

  <xsl:template match="node()[name()='section']">
    <xsl:variable name="depth" select="count(ancestor::node()[name()='section'])" />
    <xsl:variable name="header" select="node()[name()='h1'][1]" />
    <section>
      <xsl:element name="h{$depth+1}">
        <xsl:attribute name="class">subsection</xsl:attribute>
        <xsl:copy-of select="$header/node()" />
        <xsl:call-template name="footnote"><xsl:with-param name="element" select="$header" /></xsl:call-template>
      </xsl:element>
      <xsl:for-each select="node()[name()='blockquote']">
        <xsl:copy-of select="self::node()" />
      </xsl:for-each>
      <xsl:for-each select="node()[name()='p']">
        <p>
          <xsl:for-each select="node()">
            <xsl:call-template name="linkify"><xsl:with-param name="element" select="self::node()" /></xsl:call-template>
            <xsl:call-template name="footnote"><xsl:with-param name="element" select="self::node()" /></xsl:call-template>
          </xsl:for-each>
          <xsl:call-template name="footnote"><xsl:with-param name="element" select="self::node()" /></xsl:call-template>
        </p>
      </xsl:for-each>
      <xsl:apply-templates select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' vcalendar ')][1]" />
      <xsl:apply-templates select="child::node()[name()='ul' and contains(concat(' ', @class, ' '), ' skills ')]" />
      <ul class="itemize">
        <li class="li-itemize"><xsl:apply-templates select="descendant::node()[name()='section']" /></li>
      </ul>
    </section>
  </xsl:template>

  <xsl:template match="node()[contains(concat(' ', @class, ' '), ' vcalendar ')]">
    <xsl:variable name="depth" select="count(ancestor::node()[contains(concat(' ', @class, ' '), ' vcalendar ')])" />
    <ol class="itemize">
      <xsl:if test="$depth > 0">
        <xsl:attribute name="class">itemize nested</xsl:attribute>
      </xsl:if>
      <xsl:for-each select="node()[contains(concat(' ', @class, ' '), ' vevent ')]">
        <li class="li-itemize">
          <xsl:apply-templates select="self::node()" />
        </li>
      </xsl:for-each>
    </ol>
  </xsl:template>

  <xsl:template match="node()[contains(concat(' ', @class, ' '), ' vevent ')]">
    <xsl:variable name="desc" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' description ')][1]" />
    <div class="row">
      <div class="flushleft">
        <xsl:variable name="org" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' org ')][1]" />
        <xsl:variable name="title" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' title ')][1]" />
        <xsl:variable name="summary" select="child::node()[contains(concat(' ', @class, ' '), ' summary ')][1]" />
        <xsl:if test="string($org)">
          <b><xsl:call-template name="linkify"><xsl:with-param name="element" select="$org" /></xsl:call-template></b>
          <xsl:call-template name="footnote"><xsl:with-param name="element" select="$org" /></xsl:call-template>
          <br />
        </xsl:if>
        <xsl:if test="string($title)">
          <xsl:call-template name="linkify"><xsl:with-param name="element" select="$title" /></xsl:call-template>
          <xsl:call-template name="footnote"><xsl:with-param name="element" select="$title" /></xsl:call-template>
          <br />
        </xsl:if>
        <xsl:if test="string($summary)">
          <xsl:variable name="skills" select="$summary/child::node()[contains(concat(' ', @class, ' '), ' skill ')]" />
          <xsl:choose>
            <xsl:when test="$skills">
              <xsl:for-each select="$skills">
                <xsl:copy-of select="self::node()" />
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="linkify"><xsl:with-param name="element" select="$summary" /></xsl:call-template>
              <xsl:call-template name="footnote"><xsl:with-param name="element" select="$summary" /></xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
          <br />
        </xsl:if>
        <xsl:if test="string($desc) and not($desc/child::node()[text()])">
          <ul class="onecollist">
            <li class="onecolitem"><xsl:apply-templates select="$desc" /></li>
          </ul>
        </xsl:if>
      </div>
      <div class="flushright">
        <xsl:for-each select="node()[contains(concat(' ', @class, ' '), ' location ')]">
          <xsl:variable name="adr" select="descendant-or-self::node()[contains(concat(' ', @class, ' '), ' adr ')]" />
          <xsl:choose>
            <xsl:when test="$adr">
              <xsl:apply-templates select="$adr" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="child::node()" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        <xsl:for-each select="(self::node() | node()[name()='ol' and not(contains(concat(' ', @class, ' '), ' vcalendar '))]/node()[name()='li' and not(contains(concat(' ', @class, ' '), ' vevent '))])[node()[contains(concat(' ', @class, ' '), ' dtstart ')]]">
          <xsl:variable name="dtstart" select="node()[contains(concat(' ', @class, ' '), ' dtstart ')]" />
          <xsl:variable name="dtend" select="node()[contains(concat(' ', @class, ' '), ' dtend ')]" />
          <xsl:value-of select="$dtstart" />
          <xsl:choose>
            <xsl:when test="$dtend">&ndash;<xsl:value-of select="$dtend" /></xsl:when>
            <xsl:otherwise>&ndash;Present</xsl:otherwise>
          </xsl:choose>
          <xsl:call-template name="footnote"><xsl:with-param name="element" select="($dtstart | $dtend)[1]/parent::node()" /></xsl:call-template>
          <br />
        </xsl:for-each>
      </div>
    </div>
    <xsl:choose>
      <xsl:when test="$desc/child::node()[text() and contains(concat(' ', @class, ' '), ' vevent ')]">
        <xsl:apply-templates select="$desc" />
      </xsl:when>
      <xsl:when test="$desc/child::node()[text() and not(contains(concat(' ', @class, ' '), ' vevent '))]">
        <ul class="onecollist">
          <xsl:for-each select="$desc/child::node()[name()='li']">
            <li class="onecolitem">
              <xsl:copy-of select="self::node()" />
            </li>
          </xsl:for-each>
        </ul>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="node()[name()='footer']">
    <hr />
    <dl class="thefootnotes">
      <xsl:apply-templates select="child::node()[contains(concat(' ', @class, ' '), ' footnotes ')]" />
    </dl>
  </xsl:template>

  <xsl:template match="node()[(name()='ol' or name()='ul') and contains(concat(' ', @class, ' '), ' footnotes ')]">
    <xsl:for-each select="child::node()[name()='li']">
      <dt class="dt-thefootnotes"><a id="note-{self::node()/@id}" href="#ref-{self::node()/@id}"><xsl:number value="position()" /></a></dt>
      <dd class="dd-thefootnotes"><xsl:value-of select="self::node()" /></dd>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="footnote">
    <xsl:param name="element" />
    <xsl:if test="$element/@xlink:href">
      <sup><a id="ref-{substring($element/@xlink:href, 2)}" href="#note-{substring($element/@xlink:href, 2)}" title="{string(//node()[concat('#', @id)=$element/@xlink:href])}"><xsl:value-of select="count(/descendant-or-self::node()[contains(concat(' ', @class, ' '), ' footnotes ')]/child::node()[concat('#', @id)=$element/@xlink:href]/preceding-sibling::node()[name()='li']) + 1" /></a></sup>
    </xsl:if>
  </xsl:template>

  <xsl:template name="linkify">
    <xsl:param name="element" />
    <xsl:choose>
      <xsl:when test="$element/@href">
        <a href="{$element/@href}"><xsl:value-of select="$element" /></a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$element" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

