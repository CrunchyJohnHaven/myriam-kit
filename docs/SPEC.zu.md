# Incazelo Yephrothokholi ye-MYRIAM-kit

*Uhumusho lwesiZulu — ngenguqulo yokuqala yesiNgisi, bheka [SPEC.md](SPEC.md)*

## 0. Inhloso

Le dokhumenti ichaza iphrothokholi encane yokushicilela iqoqo elincane
lamaqiniso ombhalo ngendlela ekhombisa ushintsho, eqinisekiseka ngecryptography
futhi esinda ekususweni komhlinzeki oyedwa wokusingatha.

Ukwenziwa kabanzi kwephrothokholi eyathunyelwa okokuqala ku-
[disclosure.host](https://disclosure.host) ngaphansi kwegama elithi "MYRIAM v1."

## 1. Izinto ENGEZONA izinhloso

- Ukugcina izimfihlo. Konke kuyimfihlo yomphakathi ngokwakhiwa.
- Amasethi amakhulu edatha. Ngaphezu kwamaqiniso angaba ngu-20, iphrothokholi inesimo esingafanele.
- Ukushicilela ngesikhathi sangempela. Ukushicilela ngakunye umcimbi ohlukile wokuvala.
- Ukuhoxisa. Iphrothokholi yokungeza-kuphela ezingeni lenguqulo.

## 2. Imodeli yeqiniso

I-FACT yifayela lombhalo le-UTF-8 elinalokhu:

- Iphethini yegama lefayela: `NN_short_name.txt` lapho i-NN iyinombolo egcwaliswe ngo-zero
  yamadijithi amabili eqala ngo-01.
- Ifomu lokumelwa: amabhayithi njengoba ebhaliwe, akukho ukuvumelanisa.
- I-hash yeqiniso ngalinye: i-hex enobukhulu obuncane ye-`SHA-256(file_bytes)`.

ISET yeqiniso uhlu olulandelanayo lwawo wonke amafayela ahambisana nephethini ngaphansi
kwe-`facts/`, ahlungwe ngokolimi lwesichazamazwi.

Umkhawulo: umzimba weqiniso ngalinye SHOULD uchazwe njengomcimbi wokuqamba gama noma
njengomcimbi wokumemezela obhekiselwe eqenjini elithile. Izimangalo ze-ontology
("inyanga ilidwala") zincisha isango lokuqinisekiseka; ukushicilela kuphela
okuqinisekiseka, hhayi isimangalo. "X ushilo ukuthi Y" yilona fomu elifanele. "Y kuyiqiniso"
akusilo.

## 3. Impande yeMerkle

Eyaka-Bitcoin, njengaku-v0 yephrothokholi ye-MYRIAM ethunyelwe:

1. Amaqabunga: ama-hash e-SHA-256 weqiniso ngalinye ngohlelo lwe-fact-set.
2. Uma izinga linenani lamaphuzu elingeyona inombolo ephindiwe, phinda inodi yokugcina.
3. Bambisa ama-hash phakathi kwamaphuzu aseduze: `parent = SHA-256(left_bytes || right_bytes)`,
   lapho i-`left_bytes` ne-`right_bytes` kungamanani amasha angu-32-byte we-hash
   (hhayi izimelo zawo ze-hex).
4. Phinda kuze kusale inodi eyodwa. Lokho yimpande yeMerkle.

Impande ishicilelwa njenge-hex enobukhulu obuncane ngaphandle komugqa omusha owulandelayo.

### 3.1 Ama-vector okuhlola

| I-Vector | Amaqabunga (amabhayithi e-UTF-8 ahlamiwe) | Impande elindelekile (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Noma yikuphi ukwenziwa okuhambisanayo MUST kuzale lawa ma-vector kabusha. Aqhamuka
kwi-`lib/build.py` yangempela futhi angaphindwa enziwe nge-skripthi leyo.

## 4. Ukuzibophezela kuBitcoin

Impande yeMerkle ibophezelwa kwiBitcoin blockchain nge-
[OpenTimestamps](https://opentimestamps.org). Inqubomgomo eyenzakalelayo yile:

> Gxiviza ngokumelene nokungenani ababili abasebenzisi bekhalenda ngaphansi
> kokulawulwa kokuphatha okuzimele.

Irisithi ehlangabezana nale nqubomgomo iyaqinisekiseka kunoma yiliphi iqembu elingakwazi
ukugijimisa `ots verify <receipt>.ots` futhi lifinyelele endleleni yokuthuthukisa yenoma yiliphi ikhalenda.

Ababambisani abenzakalelayo abathunyelwe ku-`lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Ukwenziwa MAY kusebenzise abasebenzisi abahlukile. Inqubomgomo
yokuhlukahlukana kofakazi (≥2 abasebenzisi abazimele) iyimibandela; abasebenzisi
abathile abasibo.

## 5. Ukubonisa okuhlonzwa-ngokuqukethwe

Idayirektri ye-`site/` equkethe ikhasi elishicileliwe namafayela weqiniso
SHOULD yengezwe ku-IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

I-CIDv1 ephumayo (i-codec ye-dag-pb) yikheli lokuqukethwe lokushicilela.
Iyathathwa kahle isuka kokuqukethwe kwamabhayithi we-`site/`. Noma yikuphi
ushintsho kunoma yiliphi ifayela ngaphansi kwe-`site/` kukhiqiza i-CID ehlukile.

Ukuhloma kuzinkonzo ezengeziwe ngaphandle kwenodi yendawo yomshicileli
kuyacelwa ngamandla ngenxa yokuhlala isikhathi eside; le ncazelo
ayiphoqi izinkonzo ezithile.

## 6. Ukushintsha izinguqulo

Iphrothokholi **iyangezwa-kuphela ezingeni lenguqulo**. Lonke ushintsho
ludinga inguqulo entsha evaliwe:

- Inguqulo entsha (noma engashintshiwe) yencazelo
- Iqoqo elisha lamaqiniso, ELINGA-thatha amaqiniso angashintshiwe ezinguqulweni zangaphambili
- Impande entsha yeMerkle
- Irisithi entsha ye-OpenTimestamps
- I-CID entsha ye-IPFS

Zonke izinguqulo zangaphambili zihlala zishicilelwe kuma-URL ane-version. Ushintsho
kunoma yiliphi iqiniso le-v(N) ludinga i-v(N+1), izinguqulo zombili zibonakala futhi ziqinisekiseka kabusha.

## 7. Ukuqinisekisa

Noma yiliphi iqembu langaphandle lingaqinisekisa ubuqotho bokushicilela ngokwenza:

1. Ukulanda amafayela weqiniso futhi liphinde libale ama-hash e-SHA-256 weqiniso ngalinye.
2. Ukuphinda libale impande yeMerkle ngokwe-§3 futhi liyiqhathanise nempande eshicilelwe.
3. Ukuqinisekisa irisithi ye-OpenTimestamps ngokumelene neBitcoin blockchain
   ngobufakazi obugcwele bokungenani bekhalenda elilodwa.
4. Ukuphinda libale ngokuzimele i-CID ye-IPFS nge-`ipfs add -r --cid-version=1`
   futhi liyiqhathanise ne-CID eshicilelwe.

I-`lib/verify.py` yenza izinyathelo 1–3 ngaphandle kokuncika kwangaphandle
ngaphezu kwe-stdlib yePython kanye nekhasimende le-`ots`. Isinyathelo 4 sidinga ikhasimende le-`ipfs`.

## 8. Isango lokwenqaba

Ukushicilela MUST NOT kufake iqiniso eli:

- Lihlonza iqembu langaphandle eliyimfihlo elingavumanga ukuthiwa.
- Lethula umbono njengesiqinisekiso.
- Elingakwazi ukuncishiswa libe ngumcimbi wokuqamba gama/wokumemezela oqinisekisekayo
  noma incwadi yecryptography.
- Linokwanda okulindelekile okufanele kokufa okuvinjelwayo lapho kushicilelwa.

Umthetho wesine uthwele insika. Uphoqelelwa esinyathelweni sokubuyekeza komuntu
ngumshicileli. Akukho ukuphoqelela kwezinga lephrothokholi
kwesango lokwenqaba; iphrothokholi ishicilela noma yimaphi amabhayithi enikezwa wona.
Umshicileli unesibopho sesango.

## 9. Isitatimende esithembekile semikhawulo

- **Ukutholakala, hhayi ukungenzeki.** Iphrothokholi yenza ushintsho
  lutholakale, hhayi lungenzeki. Umhlaseli onqumileyo usakwazi ukufaka
  okushicilelwe okuhlukile futhi akholise abanye abafundi ukuthi yikho okwasekuqaleni.
  Ukubaluleka kwephrothokholi ukuthi lokho kufakwa kuba
  ngokufakazelwa ngecryptography kunoma ngubani osebenzisa ukuhlolwa.
- **Akukho ukuvikelwa ekushicileleni amanga.** Uma umshicileli evala
  iqiniso elithi "X kwenzekile" futhi X kungenzekanga, iphrothokholi ivala
  isimangalo esingelona iqiniso ngokuthembeka okufanayo ngokuthi ivala lawo angempela. Iphrothokholi
  ifakaza ngalokho *okushicilelwe*, hhayi ngalokho *okuyiqiniso*.
- **Ukusayina kweqembu elilodwa.** I-v1 ye-MYRIAM ethunyelwe isebenzisa
  umsayini oyedwa. Ukusayina kwamaqembu amaningi kungumsebenzi wesikhathi esizayo.
- **Ukuhlala isikhathi eside kokuhloma.** Ukuhloma kwe-IPFS endaweni
  yenodi yomshicileli kuphela kunikeza "okutholakalayo ngenkathi i-laptop yami isebenza +
  ukugcinwa kwesango ngamathuba." Ukuhlala isikhathi eside kudinga ukuhloma
  okuphindiwe kuzinkonzo ezizimele.

Le mikhawulo ishiwo lapha ukuze kungabikho mfundi othatha ukuthi iphrothokholi
ilethe okungaphezu kwalokho eyilethayo.
