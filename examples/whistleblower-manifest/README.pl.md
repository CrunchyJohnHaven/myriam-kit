*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw pieczęci manifestu sygnalisty

Gotowy do użycia przykład myriam-kit dla sygnalistów stojących w obliczu
specyficznego trybu niepowodzenia, w którym **dowody są zakopywane,
edytowane lub kwestionowane przez pośredników między sygnalistą a opinią
publiczną**. Kanoniczne przypadki historyczne, przed którymi broni ten
zestaw:

- Boeing 737 MAX (wewnętrzne raporty bezpieczeństwa lekceważone/zakopywane)
- Theranos (obawy dotyczące testów laboratoryjnych tłumione przez lata)
- Raporty inspektorów FDA edytowane po złożeniu
- Frances Haugen / Facebook (zapieczętowany manifest udowodniłby, że
  dokumenty były autentyczne i istniały w deklarowanym czasie)

Przed czym ten zestaw broni (w terminologii protokołu):

- T1–T3 w [FACT 05](facts/05_threat_model.txt): publiczne kwestionowanie
  treści dokumentów, twierdzenia, że dokumenty nie były zapieczętowane
  w deklarowanym czasie, twierdzenia o retroaktywnym sfabrykowaniu.
- T9: osoby trzecie przekazujące dziennikarzom zmienione kopie.

Przed czym ten zestaw **nie** broni:

- Osobistych odwetów przeciwko sygnaliście (T7).
- Nacisków na sygnalistę, by się wycofał (T4, częściowo łagodzone przez
  FACT 07 czyniącą ciche wycofanie publicznie wykrywalnym).
- Działań prawnych przeciwko sygnaliście za samo ujawnienie (T5).
- Dyskredytowania charakteru sygnalisty (T8).
- Pośredników po cichu wyciszających historię (T10).

Jeśli jesteś sygnalistą rozważającym użycie tego zestawu, **przeczytaj
najpierw całe to README**. Protokół to narzędzie. Protokół nie zastępuje
prawnika, dziennikarza, organu regulacyjnego ani starannego bezpieczeństwa
operacyjnego.

## Co ten zestaw produkuje

Kryptograficznie zapieczętowany *manifest* dowodów (a nie same dowody),
który udowadnia:

1. Konkretne bajty każdego pliku dowodowego istniały w momencie pieczętowania.
2. Pieczętowanie nastąpiło w określonym czasie lub przed nim (poprzez
   atest Bitcoin OTS).
3. Pochodzenie, oskarżenie, model zagrożeń, protokół odbiorcy oraz
   zobowiązanie braku cichego wycofania zostały zadeklarowane razem.

Dokumenty bazowe pozostają w twoim posiadaniu, dopóki nie wyślesz ich do
odbiorcy. Odbiorcy weryfikują, że otrzymali te same bajty, które
zapieczętowałeś.

## Kiedy używać tego zestawu

Powinieneś rozważyć zapieczętowanie manifestu **przed** przekazaniem
dowodów dziennikarzowi, organowi regulacyjnemu lub adwokatowi, jeśli
wszystkie poniższe są prawdziwe:

- Posiadasz dowody w formie cyfrowej (PDF, e-maile, obrazy itp.), które
  chcesz zachować jako bajtowo autentyczne.
- Oczekujesz, że pośrednicy mogą zmienić, zakwestionować lub zakopać
  dowody.
- Możesz zatrzymać dokumenty bazowe w swoim posiadaniu do momentu
  przekazania.
- Możesz publikować manifest publicznie **bez** ujawniania treści
  dokumentów (publiczne są tylko hashe).
- Rozważyłeś ryzyko stania się publicznie identyfikowalnym jako
  sygnalista (pole signing-principal). Jeśli zachowujesz anonimowość,
  używaj konsekwentnie pseudonimu we wszystkich powiązanych publikacjach.
- Skonsultowałeś się z adwokatem na temat prawa ochrony sygnalistów
  w twojej jurysdykcji.

## Kiedy NIE używać tego zestawu

NIE używaj tego zestawu, jeśli:

- Same dokumenty zawierają dane osobowe osób trzecich (pacjentów,
  klientów, pracowników), które nie powinny być publicznie haszowalne.
  Haszuj wersję zredagowaną, nie oryginał.
- Sam akt opublikowania manifestu identyfikowałby sygnalistę w sposób,
  na który nie wyraził zgody.
- Nie skonsultowałeś się jeszcze z adwokatem. Protokół to narzędzie;
  prawo ochrony sygnalistów jest specyficzne dla jurysdykcji i żyje
  poza protokołem.
- Możesz chcieć później wycofać jakiekolwiek pojedyncze oskarżenie.
  Pieczęć jest trwała; nowe zapieczętowane korekty są jedynym uczciwym
  sposobem rewizji.
- Robisz to pod przymusem lub presją czasową. Protokół wzmacnia
  przymus; brama odmowy (myriam-kit `SPEC §8`) stosuje się do sygnalistów
  tak samo jak do wydawców.

## Jak rozwidlić ten zestaw do prawdziwego ujawnienia

```bash
# 1. Skopiuj ten przykład do nowego katalogu
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Usuń fikcyjną treść; zastąp swoimi prawdziwymi faktami.
# Każdy plik w facts/ to jeden fakt. Przeczytaj każdy i zastąp.
$EDITOR facts/01_example_notice.txt   # zmień na prawdziwe oświadczenie wstępne
$EDITOR facts/02_provenance.txt       # prawdziwe pochodzenie twoich dowodów
$EDITOR facts/03_evidence_manifest.txt # zhaszuj prawdziwe dokumenty i wymień je
$EDITOR facts/04_allegation_summary.txt # twoje prawdziwe oskarżenie
$EDITOR facts/05_threat_model.txt     # twoje prawdziwe oczekiwane reakcje
$EDITOR facts/06_recipient_protocol.txt # dostosuj do swojego odbiorcy
$EDITOR facts/07_no_retraction_commitment.txt # twoja deklaracja braku wycofania
$EDITOR facts/08_signing_principal.txt # twoja prawdziwa tożsamość podpisująca (lub pseudonim)

# 3. Zaktualizuj site/index.html, by odzwierciedlał prawdziwe fakty.
# Skrypt seal.sh NIE wypełnia HTML automatycznie; ręczna edycja
# to krok przeglądu ludzkiego.
$EDITOR site/index.html

# 4. Zapieczętuj.
bash build/seal.sh
# Wyjście: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Zweryfikuj lokalnie.
python3 build/verify.py

# 6. Opublikuj manifest (NIE dokumenty) na dowolnym z:
#    - Statycznym hoście pod twoją kontrolą (Cloudflare Pages, GitHub Pages itp.)
#    - Sieci IPFS pod wydrukowanym CID
#    - Obu (zalecane)

# 7. Oddzielnie przekaż dokumenty bazowe odbiorcy
#    przez bezpieczny kanał według twojego wyboru (Signal, SecureDrop itp.).
#    Odbiorca weryfikuje hashe plików względem twojego manifestu.
```

## Obliczanie hashów dla prawdziwych plików dowodowych

Aby zhaszować plik dokumentu za pomocą SHA-256:

```bash
shasum -a 256 my_document.pdf
```

Pierwsze 64 znaki szesnastkowe to SHA-256. Wstaw to do manifestu.

Możesz zhaszować wiele plików naraz:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

To daje ci dane dla `facts/03_evidence_manifest.txt`.

## Uwagi o bezpieczeństwie operacyjnym

Protokół MYRIAM NIE zapewnia bezpieczeństwa operacyjnego. Zapewnia
*trwałość dowodową*. Nadal potrzebujesz:

- Bezpiecznego kanału komunikacji z twoim adwokatem
  ([Signal](https://signal.org/), osobiście lub ustalony bezpieczny
  kanał twojego adwokata)
- Bezpiecznego miejsca przechowywania dla dokumentów bazowych
  (szyfrowane w spoczynku, nie w usługach chmurowych, do których ma
  dostęp twój pracodawca)
- Czystego urządzenia do pieczętowania (osobisty laptop niezwiązany
  z kontami pracodawcy; najlepiej taki używany wyłącznie do tego celu)
- Czystej sieci do publikacji (nie sieć twojego pracodawcy, nie twój
  domowy adres IP, jeśli twój pracodawca mógłby wezwać twojego ISP)

Zalecana lektura na temat bezpieczeństwa operacyjnego dla sygnalistów:

- [The Intercept's SecureDrop documentation](https://securedrop.org/)
- [Freedom of the Press Foundation's resources](https://freedom.press/)
- [EFF's surveillance self-defense guide](https://ssd.eff.org/)

Skonsultuj się z nimi PRZED rozpoczęciem procesu pieczętowania. Protokół
nie chroni przed złymi decyzjami opsec podjętymi przed wywołaniem
protokołu.

## Co odbiorcy powinni wiedzieć

Wyślij odbiorcom to README razem z zapieczętowanym manifestem. Manifest
sam w sobie zawiera protokół odbiorcy (FACT 06), ale README rozszerza
rolę odbiorcy:

- **Dziennikarze**: najpierw zweryfikuj integralność samego manifestu.
  Następnie zażądaj dokumentów oddzielnym bezpiecznym kanałem. Zweryfikuj,
  że SHA-256 każdego dokumentu pasuje do manifestu przed publikacją.
  NIE publikuj dokumentów bez zgody sygnalisty; opublikuj istnienie
  zapieczętowanego manifestu i swoje wnioski z weryfikacji.
- **Organy regulacyjne**: ten sam proces weryfikacji. Zapieczętowany
  manifest plus pasujące dokumenty to najsilniejsza forma dowodowa
  dostępna poza formalnym zbiorem łańcucha kontroli.
- **Adwokaci**: zapieczętowany manifest zapewnia forensyczne zakotwiczenie
  istnienia dokumentów w deklarowanym czasie. Czy spełnia on zasady
  dowodowe konkretnej jurysdykcji — to do twojej oceny.

## Czym ten zestaw NIE jest

- Nie zastępuje doradztwa prawnego.
- Nie gwarantuje, że ktokolwiek podejmie działania w sprawie twojego
  ujawnienia.
- Nie chroni przed odwetem.
- Nie jest uwierzytelnieniem treści dokumentów (jedynie ich bajtów
  w momencie pieczętowania).
- Nie jest sposobem na anonimową komunikację z kimkolwiek — pieczęć
  jest publiczna; jeśli twoje signing-principal to prawdziwe imię,
  jesteś zidentyfikowany.

## Zakończenie

Zapieczętowany manifest to mała rzecz. To jeden strumień bajtów
dowodzący, że większy zestaw strumieni bajtów istniał w określonej
formie w określonym czasie. Ta małość jest jego siłą: robi tylko jedną
rzecz, i robi tę jedną rzecz przez cały okres życia blockchaina Bitcoin.

Jeśli czytasz to, ponieważ rozważasz zostanie sygnalistą, proszę:
najpierw porozmawiaj z adwokatem. Skorzystaj z przewodników bezpieczeństwa
operacyjnego powyżej. Następnie, wtedy i tylko wtedy, gdy wszystkie te
rozważania na wcześniejszych etapach są w porządku, rozważ ten zestaw
jako kryptograficzny kręgosłup twojego ujawnienia. Krypto to łatwa część.
Wszystko, co jest powyżej krypto, to miejsce, gdzie żyje prawdziwe ryzyko.

## Licencja

Domena publiczna (CC0). Rozwidlaj. Ulepszaj. Używaj bez pytania o pozwolenie.
