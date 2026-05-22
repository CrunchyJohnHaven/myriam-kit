*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Visszaélés-bejelentői Manifeszt Lepecsételő Csomag

Egy kulcsrakész myriam-kit példa olyan visszaélés-bejelentőknek, akik
azzal a konkrét hibamóddal szembesülnek, ahol **a bizonyítékot a
visszaélés-bejelentő és a nyilvánosság közötti közvetítők eltemetik,
szerkesztik vagy megvitatják**. Azok a kanonikus történelmi esetek,
amelyek ellen ez véd:

- Boeing 737 MAX (a belső biztonsági jelentéseket leértékelték/eltemették)
- Theranos (a laboratóriumi vizsgálatokkal kapcsolatos aggályokat
  évekig elnyomták)
- Az FDA-ellenőrök jelentéseit a benyújtás után szerkesztették
- Frances Haugen / Facebook (egy lepecsételt manifeszt bizonyította
  volna, hogy a dokumentumok hitelesek voltak és a megadott
  időpontban léteztek)

Mi ellen véd ez a csomag (protokoll-szinten):

- A [FACT 05](facts/05_threat_model.txt) T1–T3 fenyegetései: a
  dokumentum tartalmának nyilvános vitatása, azon állítások, hogy a
  dokumentumokat nem a megadott időpontban pecsételték le, visszamenőleges
  hamisítás állításai.
- T9: harmadik felek módosított példányokat adnak át az újságíróknak.

Mi ellen **nem** véd ez a csomag:

- A visszaélés-bejelentő elleni személyes megtorlás (T7).
- A visszaélés-bejelentőre gyakorolt nyomás a visszavonásra (T4,
  részben enyhítve a FACT 07 által, amely a hallgatólagos
  visszavonást nyilvánosan észlelhetővé teszi).
- A visszaélés-bejelentő ellen indított jogi eljárás magáért a
  nyilvánosságra hozatalért (T5).
- A visszaélés-bejelentő jellemének hiteltelenítése (T8).
- A közvetítők hallgatólagosan elejtik a történetet (T10).

Ha visszaélés-bejelentő vagy, és fontolgatod ennek a csomagnak a
használatát, **először olvasd el ezt a teljes README-t**. A protokoll
egy eszköz. A protokoll nem helyettesíti a jogi tanácsadót, az
újságírót, a szabályozót vagy a gondos műveleti biztonságot.

## Mit állít elő ez a csomag

Egy kriptográfiailag lepecsételt *manifesztet* a bizonyítékról (nem
magát a bizonyítékot), amely bizonyítja:

1. Az egyes bizonyítékfájlok konkrét bájtjai léteztek a lepecsételés
   pillanatában.
2. A lepecsételés egy konkrét időpontban vagy az előtt történt
   (Bitcoin OTS-tanúsítvány révén).
3. Az eredet, az állítás, a fenyegetésmodell, a fogadó-protokoll és
   a hallgatólagos-visszavonás-tilalmi kötelezettségvállalás
   mindegyike együtt lett nyilatkozva.

Az alapul szolgáló dokumentumok a birtokodban maradnak addig, amíg el
nem küldöd őket egy fogadónak. A fogadók ellenőrzik, hogy ugyanazokat
a bájtokat kapták meg, amelyeket lepecsételtél.

## Mikor használd ezt a csomagot

Fontold meg egy manifeszt lepecsételését **mielőtt** bizonyítékot
továbbítasz egy újságírónak, szabályozónak vagy ügyvédnek, ha az
alábbiak mindegyike igaz:

- Digitális formában lévő bizonyítékkal rendelkezel (PDF-ek, e-mailek,
  képek stb.), amelyet bájthelyesen hitelesként szeretnél megőrizni.
- Számítasz arra, hogy a közvetítők módosíthatják, vitathatják vagy
  eltemethetik a bizonyítékot.
- A továbbításig a birtokodban tudod tartani az alapul szolgáló
  dokumentumokat.
- Nyilvánosan közzé tudod tenni a manifesztet **anélkül**, hogy
  felfednéd a dokumentumok tartalmát (csak a hash-ek nyilvánosak).
- Mérlegelted annak kockázatát, hogy nyilvánosan
  visszaélés-bejelentőként azonosíthatóvá válsz (az aláíró-elv
  mezője). Ha névtelen vagy, használj következetesen álnevet az
  összes kapcsolódó publikációban.
- Ügyvéddel konzultáltál a saját joghatóságodban érvényes
  visszaélés-bejelentő-védelmi jogról.

## Mikor NE használd ezt a csomagot

NE használd ezt a csomagot, ha:

- Maguk a dokumentumok harmadik felekről (betegekről, ügyfelekről,
  alkalmazottakról) tartalmaznak személyes információkat, amelyeket
  nem kellene nyilvánosan hashelhetővé tenni. Egy szerkesztett
  változatot hashelj, ne az eredetit.
- Maga a manifeszt közzététele oly módon azonosítaná a
  visszaélés-bejelentőt, ahogyan ahhoz ő nem járult hozzá.
- Még nem konzultáltál ügyvéddel. A protokoll egy eszköz; a
  visszaélés-bejelentő-védelmi jog joghatóságfüggő, és a
  protokollon kívül él.
- Lehet, hogy később vissza akarsz vonni bármely állítást. A pecsét
  állandó; új lepecsételt korrekciók az egyetlen tisztességes módja
  a felülvizsgálatnak.
- Kényszer vagy időnyomás alatt teszed ezt. A protokoll felerősíti a
  kényszert; a megtagadási kapu (myriam-kit `SPEC §8`) éppúgy
  vonatkozik a visszaélés-bejelentőkre, mint a közzétevőkre.

## Hogyan forkold ezt a csomagot egy valódi nyilvánosságra hozatalhoz

```bash
# 1. Másold ezt a példát egy új könyvtárba
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Távolítsd el a fiktív tartalmat; helyettesítsd a valódi tényekkel.
# A facts/ alatti minden fájl egy tény. Olvasd el mindegyiket és helyettesítsd.
$EDITOR facts/01_example_notice.txt   # módosítsd valódi fedőnyilatkozatra
$EDITOR facts/02_provenance.txt       # a bizonyítékod valódi eredete
$EDITOR facts/03_evidence_manifest.txt # hasheld a valódi dokumentumaidat és sorold fel őket
$EDITOR facts/04_allegation_summary.txt # a valódi állításod
$EDITOR facts/05_threat_model.txt     # a valódi várható válaszaid
$EDITOR facts/06_recipient_protocol.txt # igazítsd a fogadódhoz
$EDITOR facts/07_no_retraction_commitment.txt # a visszavonás-nélküli nyilatkozatod
$EDITOR facts/08_signing_principal.txt # a valódi aláíró-identitásod (vagy álnév)

# 3. Frissítsd a site/index.html-t, hogy tükrözze a valódi tényeket.
# A seal.sh szkript NEM tölti ki automatikusan a HTML-t; a kézi
# szerkesztés az emberi felülvizsgálati lépés.
$EDITOR site/index.html

# 4. Lepecsételés.
bash build/seal.sh
# Kimenetek: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Helyi ellenőrzés.
python3 build/verify.py

# 6. Tedd közzé a manifesztet (NEM a dokumentumokat) bármely(ek)en:
#    - Egy általad ellenőrzött statikus hoston (Cloudflare Pages, GitHub Pages stb.)
#    - Az IPFS hálózaton a kinyomtatott CID-en
#    - Mindkettőn (ajánlott)

# 7. Külön továbbítsd az alapul szolgáló dokumentumokat a fogadónak
#    egy általad választott biztonságos csatornán (Signal, SecureDrop stb.).
#    A fogadó ellenőrzi a fájl-hash-eket a manifeszteddel szemben.
```

## Hash-ek számítása a valódi bizonyítékfájlokhoz

Egy dokumentumfájl SHA-256 hash-elése:

```bash
shasum -a 256 my_document.pdf
```

Az első 64 hexadecimális karakter a SHA-256. Tedd ezt a manifesztbe.

Egyszerre sok fájlt is hashelhetsz:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Ez adja meg az adatokat a `facts/03_evidence_manifest.txt` számára.

## Műveleti biztonsági megjegyzések

A MYRIAM protokoll NEM nyújt műveleti biztonságot. Bizonyíték-tartósságot
nyújt. Még mindig szükséged van:

- Biztonságos kommunikációs csatornára az ügyvédedhez
  ([Signal](https://signal.org/), személyesen, vagy az ügyvéded
  bevezetett biztonságos csatornája)
- Biztonságos tárolási helyre az alapul szolgáló dokumentumokhoz
  (nyugalmi állapotban titkosítva, nem a munkáltatód által elérhető
  felhőszolgáltatásokon)
- Tiszta eszközre a lepecsételéshez (egy személyes laptop, amely
  nincs a munkáltatói fiókokhoz társítva; lehetőleg olyan, amelyet
  csak erre a célra használsz)
- Tiszta hálózatra a közzétételhez (nem a munkáltatód hálózata, nem
  az otthoni IP-d, ha a munkáltatód idézést bocsáthat ki az ISP-d
  ellen)

Ajánlott olvasmányok a visszaélés-bejelentők műveleti biztonságáról:

- [The Intercept SecureDrop dokumentációja](https://securedrop.org/)
- [Freedom of the Press Foundation forrásai](https://freedom.press/)
- [Az EFF surveillance self-defense útmutatója](https://ssd.eff.org/)

Konzultáld ezeket MIELŐTT elkezded a lepecsételési folyamatot. A
protokoll nem véd a protokoll meghívása előtt hozott rossz opsec
döntések ellen.

## Amit a fogadóknak tudniuk kell

Küldd el a fogadóknak ezt a README-t a lepecsételt manifesztettel
együtt. Maga a manifeszt tartalmazza a fogadó-protokollt (FACT 06),
de a README kibővíti a fogadó szerepét:

- **Újságírók**: először ellenőrizzék a manifeszt saját integritását.
  Majd kérjék be a dokumentumokat egy különálló biztonságos csatornán.
  A közzététel előtt ellenőrizzék, hogy az egyes dokumentumok
  SHA-256-ja egyezik a manifesztben szereplővel. NE tegyék közzé a
  dokumentumokat a visszaélés-bejelentő hozzájárulása nélkül; tegyék
  közzé a lepecsételt manifeszt létezését és az ellenőrzési
  következtetésüket.
- **Szabályozók**: ugyanaz az ellenőrzési folyamat. A lepecsételt
  manifeszt plusz az egyező dokumentumok a hivatalos
  bizonyíték-láncolat-gyűjtésen kívül elérhető legerősebb
  bizonyítási forma.
- **Ügyvédek**: a lepecsételt manifeszt forenzikus rögzítést biztosít
  arra, hogy a dokumentumok a megadott időpontban léteztek. Hogy
  bármely konkrét joghatóság bizonyítási szabályait kielégíti-e,
  azt nektek kell meghatároznotok.

## Ami ez a csomag NEM

- Nem a jogi tanácsadó helyettesítője.
- Nem garancia arra, hogy bárki cselekedni fog a nyilvánosságra
  hozatalod alapján.
- Nem védelem a megtorlás ellen.
- Nem a dokumentumok tartalmának hitelesítése (csak a
  lepecsételés-időbeli bájtoké).
- Nem mód arra, hogy bárkivel névtelenül kommunikálj — a pecsét
  nyilvános; ha az aláíró-elv neved valódi, azonosítva vagy.

## Záró gondolatok

Egy lepecsételt manifeszt egy apró dolog. Ez egy bájtfolyam, amely
azt bizonyítja, hogy egy nagyobb bájtfolyam-halmaz egy adott
formában létezett egy adott időpontban. Ez a kicsiség az ereje:
egyetlen dolgot csinál, és ezt az egy dolgot a Bitcoin blokklánc
élettartama alatt csinálja.

Ha azért olvasod ezt, mert fontolod, hogy visszaélés-bejelentővé
válsz, kérlek: először beszélj ügyvéddel. Használd a fenti
műveleti biztonsági útmutatókat. Aztán, és csak akkor, ha mindezek
a felsőbb szintű megfontolások rendben vannak, fontold meg ezt a
csomagot a nyilvánosságra hozatalod kriptográfiai gerinceként. A
kripto a könnyű rész. A kripto felsőbb szintje az, ahol a valódi
kockázat él.

## Licenc

Közkincs (CC0). Forkold. Javítsd. Használd engedélykérés nélkül.
