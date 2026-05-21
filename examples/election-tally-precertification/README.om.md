*Hiikkaa Afaan Oromoo — fakkii Afaan Ingilizii isa jalqabaa argachuuf, ilaali [README.md](README.md)*

# Kiitii Chappeessa Sagalee Filannoo Dura-Mirkanaa'uu

Fakkeenya myriam-kit kan qopha'ee kennamu, boordii canvasser naannoo,
abbootii filannoo isteetii, fi gartuulee qaba-shamarii filannoo kan barbaadan
sagalee yeroo mirkana'aa, Bitcoin-iin bu'uureeffame, jijjiirama ifa godhu kan
chappeefame maxxansuuf.

**Cufa** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Wanti chappaan kun HIN GOONE (jalqaba dubbisi)

Chappaan kun yeroo cryptografii kan mirkana'e ta'a. Inni mirkana'eensaa sirrii
ta'uu fi dhabuu mirkanaa'uu hin danda'u. Failure-mode-iin armaan gadii **dirree chappaa keessa hin jiru**:

1. **Maashinii sagalee saxaaxa.** Yoo firmware jijjirame yookaan walitti
   qabama sagalee dogoggora qabaate ta'e, chappaan lakkoofsa dogoggoraa qulqullummaa
   ol'aanaadhaan bu'uureessuu danda'a. Chappaan oomisha sirna tabulation argee;
   sirna sana keessatti waan jiru hin argu.

2. **Sagalee dhiibuu / sagalee dhabamsiisuu caasaa keessaa.** Cufa bakkawwan
   sagalee, jijjiirama seera ID, jijjiirama sadarkaa kufaatii sagalee posta,
   fi haquu galmeessaa hundeen mirkana'aa caala duraa raawwatamu. Chappaan
   sagalee lakkaa'aman galmeessa, kan lakkaa'amuu qaban miti.

3. **Odeessa sobaa filannoo.** Chappaan himannaa filannoo kandidaatota, miidiyaa,
   yookaan platformiidhaan godhamu hin murteessu. Mirkanaa'eensi chappeefame
   odeeffannoo sobaa keessatti caqasamuu danda'a, akkuma ittisaaf caqasamuu danda'utti.
   Yerootli cryptografii content-neutral ti.

4. **Sobni mirkana'eensa dura yeroo walitti qabama sagalee yookaan lakkaa'umsa.**
   Jijjiirama harvesting sagalee, addaan citu sanduuqa kaayyoo, addaan
   citiinsa galmee oggeessummaa yeroo lakkaa'umsa — hundi yeroo chappaa
   dura raawwatama. Chappaan duubatti deebi'ee isaan ifa baasuu hin danda'u.

5. **Dirqisiisuu abbaa mirkana'eensaa.** Mirkana'eensi dirqisiifame chappa
   cryptografii fudhatamaa bu'aa dirqisiifamee uuma. Chappaan
   qondaalli mallattoo akka kenne mirkaneessa, maaliifii miti.

6. **Mirkana'eensi dogoggoraa boodaa hin sirreeffamne.** Faayidaan chappaa
   sirreessaa dhugaa argachuu (qorannoo, lakkoofsa deebii, mana murtii) booda
   irratti hundaa'a, kan chappaan walbira qabamuu danda'u. Yoo sirreessaan
   akkanaa hin dhufne, chappaan galmee qofaa ta'ee turee dogoggora gargaaruu danda'a.

7. **Adda durummaa istaatistiikii fi argisiisa pattern-ii.** Chappaan margins
   amantaa hin qabne, addaa naannoo, yookaan dabaa Benford-law calalliisa hin baasu.
   Isaan hojii xiinxalaa daataa chappeefame irratti, taatee chappa miti.

8. **Loltoota down-ballot kan qajeelfama qorannoo dhalbuu qaban.** Loltoonni xixiqqoo
   tarkaanfii lakkoofsa deebii laafaa qabu; chappaa tokko qofti kabaja qabaatee loltoota
   hunda fuula sagalee irratti yeroo per-race scoping hin qabne haguuguu hin danda'u.

**Kutaan armaan olii kan dangaa amanamummaa qabu kiitii kanaaf bu'uura load-bearing dha.**
Qondaaltoonni chappeessuu walqixa fudhatama jechuun amanan, akka golti'aatti
itti dhimma bahu. Kiitiin sun ifa godhuu qaba: kun *qajeelfama
non-repudiation kan yeroo mirkana'aa qofaaf*, mirkana sirrummaa filannoo miti.

---

## Wanti kiitiin kun chappeessuu DIDA QABU

Kiitiin guutuu pattern dhugaa armaan gadii kanneen, fayyadamaan ajaja mallattoo
sirrii qabu illee kaa'e iyyuu fudhachuu didu ta'ee qophaa'e:

- **Eenyummaa filataa dhuunfaa.** Dhugaan kamuu filataa moggaasuu,
  sagalee filataa wajjin walqabsiisuu, yookaan dirree namni eenyummaa isaa
  irra-deebi'ee beekamuu danda'u kamuu mul'isuu hin qabu.
- **Murtee mallattoo per-ballot.** PII guutuu; chappeessuun galmee jijjiiraaraa
  murtee booda mormamuu danda'an uuma.
- **Dhugaa maxxansi isaa filataa miidhamaa beeksisu kamuu.** Bu'aalee sadarkaa
  naannoo kan akka filataa xixiqqoo (yeroo baay'ee <50 sagalee) keessatti
  filannoon hubatamuu danda'u.
- **Sagalee sagaleen hundi osoo hin lakkaa'amne chappeefame.** Kiitiin lakkoofsoota
  partial-count akka "sagalee guutuu" dhiyaate fudhachuu didu. Dura-mirkana'eensi
  jechuun *sagaleen hundi lakkaa'amee, mirkana'eensa qajeelaa dura* —
  *yeroo lakkaa'umsa* miti.
- **Mirkana'eensa walqabuu yookaan kan haalaan irratti hundaa'u.** Chappaan
  dhugaa argisiisuu qaba, haala miti.
- **Lakkoofsi mana murtii hin xumuramne keessaa baase** osoo dhugaa
  hidhata chappeefame addatti kennaa baasa hin ibsiine.
- **Eenyu kamuu abbaa mirkana'eensa naannoo sanaa hin taane chappeessuu.**

Dida'aan ofii isaa akka dhugaatti chappeefamuu danda'a ("Abbaan kun chappeessa X gaafate;
kiitiin rule-Y didaa irratti hundaa'uun fudhachuu dide"), galmee uummataa
yaalii itti dhimma badhaa'aa uuma.

---

## Wanti kiitiin kun chappeessu

Dhugaa 8, yeroo mirkana'aa:

1. **Beeksisa fakkeenyaa** — maxxansaan kun fakkeenya ta'uu ibsa (mirkana'eensoonni
   dhugaa kana baasuun yookaan jijjiirama).
2. **Eenyummaa naannoo** — naannoo, guyyaa filannoo, abbaa mirkana'eensaa,
   qondaaltoota mirkana'eensa maqaa fi gahee.
3. **Sagalee mirkana'aa** — walitti qabama sagalee per-contest per-candidate +
   sagalee over/under + write-in.
4. **Maamiloota fi mirkana'eensa sagalee** — walumaagalatti kaayame,
   walumaagalatti tabulated, walumaagalatti fudhatama dhabe akkaataa kaateegorii,
   adda baasuu mode, dhugaa filataa galmaa'e.
5. **Manifesto meeshaa fi audit-trail** — modeelii tabulator + hash firmware,
   hash faayilii CVR, hash arrkaayivii suuraa sagalee, hash custody-log,
   hash policy mallattoo-walsimsiisa.
6. **Daangaa fi kakaasota yeroo mirkana'aa** — daangaa mallattoo-walsimsiisaa hojii
   irra jiru, daangaa kakaasaa lakkoofsa deebii, margins dhugaa per-contest,
   waadaa seed RLA.
7. **Beeksisa hidhata fi galmee didaa** — manni murtii eegamu, jijjiirama lakkoofsa
   booda qorannoo jala jiran, garee baafaman, miseensonni boordii morman;
   tarree ifa pattern kiitiin chappeessuu didee.
8. **Abbaa mallattoo** — eenyummaa Boordii Canvasser + maqaa fi paartii mallattoo
   tokkoon tokkoo + odeeffannoo cabbii cryptografii.

Dhugaan tokkoon tokkoo akkaataa didaa-gate-ii dha: *"Dhugaan kun X qofa himata.
Y hin himatu"* (Y armaan olii kutaa "Hin Goonu" keessaa failure-mode dhiyoo).

---

## Wanti kiitiin kun ittisu

- **Jijjiirama dhokataa walitti qabama sagalee mirkana'eensa booda** — jijjiirama
  integer kamiyyuu FACT 03 irratti SHA-256 adda, hidda Merkle adda uuma,
  mirkanaa'umsa OTS kufa.
- **"Sagalee argaman" dhokataadhaan galchamaa** — herrega FACT 04 reconciliation
  yeroo mirkana'eensaa qulqullinaan fixated.
- **Himannaa firmware-jijjiramaa** — FACT 05 manifesto meeshaa yeroo mirkana'eensaa
  qabsiisa.
- **Jijjiirama meeshaa qorannoo mirkana'eensa booda** — manifesto hash FACT 05
  jijjiirama kamiyyuu mirkana'eensa booda CVR, suuraa sagalee, log custody,
  yookaan policy mallattoo-walsimsiisa irraa qabata.
- **Daangaa fi kakaasaa irra-deebi'iinsa ibsa** — FACT 06 seerota hojii
  irra jiran yeroo mirkana'eensaa qabsiisa (daangaa mallattoo-walsimsiisaa,
  kakaasaa lakkoofsa deebii, daangaa balaa RLA).

## Yeroo seenaa yookaan dhihoo seenaa keessatti kiitiin gargaaruu danda'u ture

Kiitiin sun hundee gaarii uumeera — *furtuu miti* — keessoolee:

- **Antrim County, Michigan (2020).** Bu'aaleen jalqabaa qajeelaa hin taane kandidaata
  jijjiirame argisiisanii booda bu'aa faallaatti sirreeffaman. Chappaa sirreessaa dura
  taasifame yeroo beeksisa jalqabaa fi yeroo sirreessaa, lamaanuu cryptografii waliin
  mirkanaa'aa, refrence uummataaf kennuu danda'u.
- **Maricopa County, Arizona (2020–2022).** Iratti yaalii hedduu kan walitti
  qabama deebii-lakkaa'aman/irra-qoraman taasifame. Chappaa yeroo mirkana'eensaa
  reference shakkii hin qabne kan irratti walitti qabamni hundi diff godhamuu danda'u
  kenna ture.
- **Florida 2000 (canvass Bush v. Gore).** Walitti qabama mirkanaa'aa per-county
  dhiibbaa lakkoofsa deebii jala jijjiraman; chappaa dura-recount per-county
  waan tokkoon tokkoon county dura-tarkaanfilee lakkoofsa deebii qajeelaa
  jalqabuu dura mirkanaa'a tiksuu danda'a ture.
- **Filannoo biyya alaa adda addaa kanneen "sirreessaa" mirkana'eensa booda
  galmaa'an.** Naannoo-eegumsa-hin-qabne.

Kiitiin sun 2020 keessatti walgaltee maashinii sirrummaa, walgaltee
seera sagalee posta, yookaan filannoo kamuu kan gaaffii hundee dhugaa
walfalliessuu malee galmee walfalliessuu qabu hin furre.

## Yoom akka kiitii kana fayyadamtan

- Naannoon kana adeemsa mirkana'eensaa tasgabbii fi audit-iin qorame qaba; haaraa
  bu'uura uummataa hin jijjiramne kan dabaluu barbaada.
- Calalliisaa mirkana'eensa booda eegda, fi reference jijjiirama-ifa-godhu
  barbaadda.
- Ajaja seeraa qabda tuuta dhugaa tarreeffame osoo PII hin mul'isin
  maxxansuuf.
- Adeemsa qorannoo yookaan RLA paaraleelii qabda, chappaan oomisha
  sirreessaa-dhugaa wajjin walbira qabamuu danda'a.

## Yoom akka kiitii kana HIN fayyadamne

- **Bakka qorannoo-balaa-daangessitu, lakkoofsa deebii harkaa, yookaan qorannoo
  filannoo booda bakka hin buusin.** Kiitiin kun *dabaluu*, bakka buusuu miti.
- **Yoo qondaalli mirkana'eensaa abbaa murtii dhugaa hin taane hin fayyadaminaa**
  (caqasa sobaa uuma).
- **Tabulation gidduu hin fayyadaminaa.** Kiitiin kun yeroo mirkana'eensaa adda
  ta'eef. Chappaaleen partial-count reference dogoggorsiisaa uuma.
- **Filannoon haqaa, sirrii, yookaan qajeelaa ta'uu himachuuf hin fayyadaminaa**
  — sana gochuu hin danda'u.
- **Dhiibba jala yeroo mirkana'eensaa dura chappeessuuf, yookaan ibsa dhugaa
  hidhata baasuuf hin fayyadaminaa.** Didi, didaa illee chappeessi.
- **Akka teaater of-mirkana'eensaatti hin fayyadaminaa.** Chappaan sagalee
  sobaa galmee uummataa hin jijjiramne sobaa ta'a, ittisa isaa miti. Qajeelfamni
  karaa lamaan ciica; kun amanamummaa isaati.

## Mirkana'eensa dhugaaf akkamiin kiitii kana fork goonu

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # qabiyyee fakkeenyaa qabiyyee dhugaa waliin jijjiiri
bash build/seal.sh     # mallattoo mirkana'eensa qajeelaa irratti yookaan booda chappeessi
python3 build/verify.py
```

**Yeroon barbaachisaa:** chappaan yeroo mirkana'eensaa CHAPPEESSI, dura miti. Chappaan
mirkana'eensa qajeelaa dura uumamu galmee soba-faayidaa "kun bu'aa qajeelaa" uuma.
Chappaan booda taasifamu non-repudiation tooftaa baratamaadha.

## Walitti hidhata waliin bu'uura filannoo jiruu

- **Boordii Filannoo Isteetii / mirkana'eensa EAC.** Kiitiin kun galmee
  mirkana'eensa qajeelaa wajjin maxxansa. Mirkana'eensa seeraa hin jijjiru.
- **Qorannoo balaa-daangessuu.** Hash CVR FACT 05 keessa jirtu, hash sirumaa
  meeshaan RLA fayyadamu. Chappaan CVR audit-iin qorame walitti qabama
  mirkana'aa wajjin walitti maxxansa.
- **Tarkaanfii lakkoofsa deebii.** Lakkoofsi deebii seera isteetii jalatti
  kakaafame tuuta dhugaa chappeefame HAARAA uuma (yeroo adda, hash adda, naannoo
  walfakkaata). Chappaaleen lamaan walumaan jiraatu; tokkoollee biraa
  hin haquu. Diff chappaalee gidduu jiru galmee uummataa kan jechuun
  lakkoofsi deebii maal jijjiire.
- **Election Markup Language (EML) fi Common Data Format (CDF).** Qaamonni dhugaa
  oomisha EML/CDF naannoon qabu irraa argamuu danda'an ta'uu qaba, kiitiin
  data-format-iin akka adda hin baafamne.
- **Mallattoo boordii canvasser paartii lamaan.** Variant multi-signature naannoo
  boordii canvasser walqixa paartii lamaaniifuu jajjabeefama.

## Wanti kiitiin kun BAKKA HIN BUUFNE

- Mirkana'eensa seeraa seera filannoo isteetii jalatti
- Mirkana'eensa sirna sagalee EAC
- Qorannoo balaa-daangessuu / lakkoofsa deebii harkaa
- Tarkaanfii lakkoofsa deebii fi qorannoo filannoo booda
- Ajaja mana murtii yookaan mana murtii morma filannoo

## Maaliif kiitiin kun v0.3.0+ keessatti jiraate

Kun fakkeenya hojjetame 6ffaa myriam-kit waliin oomishame. Kiitiin sun karaa
adeemsa autoresearch akka Karpathy-tti ibsame oomishame
`~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md` keessa. Variantonni gaaffii sadii
(imitation / first-principles / constraint-first) caaseffama kiitii paaraalelii
oomishan; variant constraint-first sadarkaa olaanaa rubric ulfaateessaa irratti
argate, fi kiitii xumuraa caasaa isaa wajjin cohesion variant imitation fi qabiyyee
hojii-irra-oolmaa variant first-principles walitti maxxansa.

Autoresearchichi mataan isaa akka pattern gaaffii fuula duraaf
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` keessatti ibsame jira.

## Eyyama

Mirga uummataa (CC0). Fork godhaa. Beekamtii hin barbaachisu.
