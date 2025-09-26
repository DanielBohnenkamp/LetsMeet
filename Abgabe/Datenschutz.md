# Datenschutz auf der Let's Meet Website
---

## Situationsbeschreibung
---
Im Rahmen der Dating-Platform "Let's Meet" werden diverse personenbezogene Daten erhoben, insbesonderes auffällig sind hierbei besonders schützenswerte Daten wie z.B. sexuelle Orientierung, Bilder und ähnliches.


## Aber was genau bedeutet das?
---
Generell gesprochen werden die Daten mit Zustimmung aller Beteiligten erhoben. Selbstverständlich muss das Vorgehen dafür geprüft werden. Die Löschung der Daten muss auf Anfrage ebenfalls gegeben sein.
Da wir uns mit der Erstellung der Datenbank beschäftigen, gibt es zwar die ein oder andere Sicherheitsvorkehrung, die getroffen werden kann - und auch muss - aber die endgültige Darstellung und Verfügbarkeit der Daten liegt in den Händen des finalen Produktes. Beispielsweise müssen nach dem § 147 der Abgabenordnung (AO) die Aufbewahrungspflichten für steuerrelevante Unterlagen eingehalten werden. Rechnungen gehören zu den "empfangenen und abgesandten Handels- oder Geschäftsbriefen", was eine Archivierungspflicht von 10 Jahren bedeutet. Wenn also die Finanzabteilung noch keine Zeit hatte, diese zu archivieren (z. B. wenn ein Kunde ein Abomodell von Let's Meet abgeschlossen hat), darf man diese nicht einfach löschen. Deswegen wurde sich gezielt gegen Funktionen wie ON DEL CASCADE entschieden.


## Was gibt es dann für Möglichkeiten in PostgresSQL?
---
Innerhalb von PostgreSQL kommen die meisten Kunden nicht auf die Tabellen oder Datenbanken - außer über die bereitgestellten Frontend-Apps o.Ä. Innerhalb der eigenen Firma gelten Datenschutzverordnungen und müssen strengst überwacht werden (wie z. B. mit Nutzerzugriffen, Datenversenden von Abteilung zu Abteilung, Jahresanalysen
- Sparsam mit der Vergabe von Rechten sein. Ein normaler Nutzer braucht keinen Zugriff auf alle Tabellen.
- In Postgres ist zudem die Verwendung von 'encryption at rest' oder sogar aktiver Verschlüsselung möglich. Solte es zu einem Datenleck kommen sind die Daten so zumindes weitgehend gesichert.
- Mit acc_last_update kann die Inaktivität eines Nutzers geprüft, und dementsprechend Inhalte fristgerecht gelöscht werden.

Quellen:

Art. 15 DSGVO - Anrecht auf das zur Verfügung stellen aller erhobenen Daten in leserlicher Form
Art. 16 DSGVO - Anrecht auf Korrektur fehlerhafter Daten
Art. 17 DSGVO - Anrecht auf das löschen aller Daten (auf Anfrage bzw Kündigung eines Vertrages)
Art. 45 BZRG  - Anrecht auf 'vergessen werden' - unaufgefordertes löschen aller Daten nach Verwendung bzw einhalten gesetzlicher Löschfristen.

