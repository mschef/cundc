<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3">
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <pattern id="griechisch">
        <rule context="tei:hi">
            <assert test="not(@style = 'font-family: Greek;')">Falsch formatierter griechischer
                Text. Bitte ersetzen durch &lt;tei:foreign xml:lang="grc-Grek"&gt;<value-of
                    select="."/>&lt;/tei:foreign&gt;</assert>
        </rule>
    </pattern>
</schema>
