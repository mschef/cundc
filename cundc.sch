<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3">
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>

    <pattern id="a1a_kontrolle-zitate">
        <rule context="tei:p//tei:qs | tei:p//tei:qe">
            <assert test="false()"> Zitate innerhalb desselben &lt;tei:p&gt;, die mit &lt;qs&gt; und
                &lt;qe&gt; getaggt sind, sollen stattdessen - unter Berücksichtigung der
                Wohlgeformtheit des XML - mit &lt;tei:quote&gt; getaggt werden. </assert>
        </rule>
        <!--        <rule context="tei:p/descendant::tei:qs">
            <assert test="following-sibling::tei:qe"> Zitate innerhalb desselben &lt;tei:p&gt;, die
                mit &lt;qs&gt; und &lt;qe&gt; getaggt sind, sollen stattdessen - unter
                Berücksichtigung der Wohlgeformtheit des XML - mit &lt;tei:quote&gt; getaggt werden.
            </assert>
        </rule>-->
    </pattern>

    <!--    <pattern id="a1b_anfuehrungszeichen">
        <rule context="tei:p/text()">
            <assert test="contains(., '&quot;')"></assert>
        </rule>
    </pattern>-->

    <pattern id="a2a_bibelzitate">
        <rule context="tei:p">
            <report
                test="*[matches(string-join(text(), ''), '.*[A-Za-z]{2}\s\d+,\d+(-\d+|f\.)?.*')]">
                Bibelzitat entdeckt: <value-of select="."/>
            </report>
        </rule>
    </pattern>

    <pattern id="a4_vd16-nummern">
        <rule context="tei:ref[@type = 'vd16']">
            <assert test="matches(@cRef, '^[A-Za-z]\+[0-9]{3}$')"> VD16-Nummer <value-of
                    select="@cRef"/> ist falsch kodiert. VD16-Nummern müssen durch ein Pluszeichen
                getrennt werden, z.B. also M+136, L+116 usw. </assert>
        </rule>
    </pattern>

    <!-- TODO: Falls möglich mit Register verbinden, sodass Fehlermeldung gleich die zugehörige ID anzeigt. -->

    <pattern id="a5_personen">
        <rule context="tei:rs[@type = 'person']">
            <assert test="@xml:id"> xml:id für <value-of select="."/> fehlt! </assert>
        </rule>
    </pattern>
    
    <pattern id="a8_griechisch">
        <rule context="tei:hi">
            <assert test="not(@style = 'font-family: Greek;')">Falsch formatierter griechischer
                Text. Bitte ersetzen durch &lt;tei:foreign xml:lang="grc-Grek"&gt;<value-of
                    select="."/>&lt;/tei:foreign&gt;</assert>
        </rule>
    </pattern>
</schema>
