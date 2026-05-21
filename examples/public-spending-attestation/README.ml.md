# Public Spending Attestation Seal Kit

*മലയാള പരിഭാഷ — യഥാർത്ഥ ഇംഗ്ലീഷ് പതിപ്പിന് [README.md](README.md) കാണുക*

ബജറ്റ്-നിർവ്വഹണ രേഖകൾ (കരാർ അവാർഡുകൾ, വിതരണങ്ങൾ, deliverable
acceptances) ഇഷ്യു ചെയ്ത നിമിഷത്തിൽ ക്രിപ്റ്റോഗ്രാഫിക്കായി anchor ചെയ്യാൻ
ആഗ്രഹിക്കുന്ന മുനിസിപ്പൽ, സംസ്ഥാന, പ്രവിശ്യാ, ദേശീയ സർക്കാരുകൾക്കായുള്ള ഒരു
turnkey myriam-kit ഉദാഹരണം — അങ്ങനെ പൊതുചെലവ് രേഖകളുടെ നിശ്ശബ്ദ
മുൻകാല പ്രാബല്യത്തിലുള്ള പരിഷ്കരണം പരസ്യമായി കണ്ടെത്താവുന്നതാകുന്നു.

ഈ സീൽ ഒരു **forensic anchor** ആണ്, integrity certification അല്ല. ഇത്
ധനകാര്യ അധികാരി report ചെയ്ത ദിവസം എന്താണ് report ചെയ്തതെന്ന്,
പിന്നീട് പരസ്യമായി കാണാവുന്ന ക്രിപ്റ്റോഗ്രാഫിക് discrepancy ഉൽപ്പാദിപ്പിക്കാതെ
നിശ്ശബ്ദമായി പരിഷ്കരിക്കാനാകാത്ത രൂപത്തിൽ രേഖപ്പെടുത്തുന്നു.

---

## ഈ kit ചെയ്യാത്തത് (ആദ്യം വായിക്കുക)

സീൽ എന്നത് attest ചെയ്തതിന്റെ ഒരു ക്രിപ്റ്റോഗ്രാഫിക് timestamp ആണ്. attest
ചെയ്തത് **നിയമപരമോ, ന്യായമോ, സത്യസന്ധമോ** ആയിരുന്നോ എന്ന് അതിന്
പരിശോധിക്കാനാകില്ല. ഇനിപ്പറയുന്ന failure modes **സീലിന്റെ domain-ന്
പുറത്താണ്**:

1. **Upstream അഴിമതിയും kickbacks-ഉം.** ഒരു procurement rigged ആയിരുന്നു,
   കൈക്കൂലി കാരണം ഒരു vendor തിരഞ്ഞെടുക്കപ്പെട്ടു, ഒരു sole-source ന്യായീകരണം
   fabricate ചെയ്യപ്പെട്ടു, അല്ലെങ്കിൽ ഒരു സമ്മതിച്ച kickback percentage വഴി
   ഒരു കരാർ inflate ചെയ്യപ്പെട്ടു എങ്കിൽ — സീൽ as-recorded transaction-നെ
   inflate ചെയ്ത വിലയിലും അനുകൂല vendor-ലും ഉയർന്ന integrity-യിൽ anchor
   ചെയ്യുന്നു. സീൽ ധനകാര്യ സിസ്റ്റത്തിന്റെ output observe ചെയ്യുന്നു;
   ഇഷ്യു ചെയ്യലിന്റെ upstream-ലുള്ള അഴിമതിയിലേക്ക് അതിന് കാഴ്ച ഇല്ല.
   Brazil-ന്റെ *Operação Lava Jato* ആയിരക്കണക്കിന് Petrobras കരാറുകളിൽ
   വ്യവസ്ഥാപിതമായ ~3% cartel-administered kickbacks documentation ചെയ്തു,
   അവ ഇഷ്യു ചെയ്യൽ സമയത്ത് പൂർണ്ണമായും routine ആയിരുന്നതുപോലെ സീൽ ചെയ്യപ്പെടുമായിരുന്നു.

2. **Beneficial ownership-ന്റെ Shell-company concealment.** "Acme
   Construction Ltd." എന്നതിന് അവാർഡ് ചെയ്ത ഒരു കരാർ പബ്ലിക് രജിസ്ട്രിയിലെ
   entity നാമത്തോടെ സീൽ ചെയ്യപ്പെടുന്നു. "Acme" യഥാർത്ഥത്തിൽ ഒരു
   വെളിപ്പെടുത്താത്ത politically exposed person-ന്റെ നിയന്ത്രണത്തിലാണെങ്കിൽ,
   അല്ലെങ്കിൽ ഒരൊറ്റ cartel-ന്റെ നിയന്ത്രണത്തിലുള്ള ഡസൻ കണക്കിന് shell
   companies-ലൊന്നാണെങ്കിൽ, സീൽ surface entity-യെ anchor ചെയ്യുന്നു.
   Beneficial-ownership transparency എന്നത് ഒരു വേറിട്ട regime ആണ്
   (FATF Recommendation 24, EU 5AMLD/6AMLD, US Corporate Transparency
   Act) അതിന്റെ output-ന് അതിന്റേതായ sealing protocol ആവശ്യമാണ്.

3. **ഇഷ്യു ചെയ്യലിന് മുമ്പുള്ള Accounting fraud.** ധനകാര്യ അധികാരി തന്നെ
   സീൽ ചെയ്യപ്പെടുന്നതിന് മുമ്പ് record fabricate ചെയ്താൽ — phantom
   കരാറുകൾ, payroll-ലെ ghost employees, fictitious deliverable
   acceptances — സീൽ fabrication-നെ anchor ചെയ്യുന്നു. Record record
   ചെയ്ത നിമിഷം false ആണെന്ന് സീലിന് കണ്ടെത്താനാകില്ല; സീൽ ചെയ്തതിന്
   ശേഷം record മാറ്റം വരുത്തിയിട്ടുണ്ടോ എന്ന് മാത്രമേ കണ്ടെത്താനാകൂ.

4. **Selective publication / cherry-picking.** ഒരു ധനകാര്യ അധികാരി
   transactions-ന്റെ ഒരു *subset* — clean ones — പ്രസിദ്ധീകരിച്ച് അവ
   മാത്രം സീൽ ചെയ്യാം. സീൽ പ്രസിദ്ധീകരണത്തിലുള്ളത് anchor ചെയ്യുന്നു;
   പ്രസിദ്ധീകരണത്തിൽ ഉണ്ടാകേണ്ടിയിരുന്ന transactions-ന്റെ ലോകം അത്
   anchor ചെയ്യുന്നില്ല. ഈ kit-ന്റെ FACT 07 (companion disclosures
   ഉം refusal record-ഉം) ഘടനാപരമായ പ്രതിരോധമാണ്, പക്ഷേ ഇഷ്യു ചെയ്യുന്ന
   അധികാരി താൻ സീൽ ചെയ്യാത്തവയെക്കുറിച്ച് സത്യസന്ധനായിരിക്കണം എന്നതിനെ
   ആശ്രയിച്ചാണ്.

5. **Off-books അല്ലെങ്കിൽ extrabudgetary spending.** സർക്കാർ ഉടമസ്ഥതയിലുള്ള
   സംരംഭങ്ങൾ, sovereign wealth funds, special-purpose vehicles,
   അല്ലെങ്കിൽ extrabudgetary trust accounts വഴി കടന്നുപോകുന്ന പൊതുചെലവ്
   സീൽ anchor ചെയ്യുന്ന ബജറ്റിൽ പ്രത്യക്ഷപ്പെടണമെന്നില്ല. ബജറ്റ്
   സിസ്റ്റത്തിനുള്ളിൽ report ചെയ്തത് സീൽ രേഖപ്പെടുത്തുന്നു; സിസ്റ്റത്തിന്
   പുറത്തുള്ള ചെലവ് സീലിന്റെ domain-ന് പുറത്താണ്. Iraq Coalition
   Provisional Authority (CPA) 2003–2004 തർക്കങ്ങളിൽ ഏകദേശം USD 9 ബില്യൺ
   cash വിതരണങ്ങൾ ഉൾപ്പെട്ടിരുന്നു, അവയുടെ records ഭാഗികമായി
   നഷ്ടപ്പെട്ടു; വിതരണ നിമിഷത്തിൽ ഉണ്ടായിരുന്ന records സീൽ ചെയ്യുന്നത് അവയെ
   anchor ചെയ്യുമായിരുന്നു, പക്ഷേ CPA നിലനിർത്താത്ത records സൃഷ്ടിക്കില്ലായിരുന്നു.

6. **ഇഷ്യു ചെയ്യലിന് ശേഷമുള്ള "explanation" മർദ്ദം.** സീൽ ചെയ്ത ഒരു
   overrun, ഒരു സീൽ ചെയ്ത sole-source, അല്ലെങ്കിൽ ഒരു സീൽ ചെയ്ത change
   order പിന്നീട് രാഷ്ട്രീയ അധികാരം ആഗ്രഹിക്കുന്ന ഏതെങ്കിലും framing-ഓടെ
   re-narrate ചെയ്യാം. ഇഷ്യു ചെയ്യൽ തീയതിയിലെ FACTS സീൽ anchor ചെയ്യുന്നു,
   പക്ഷേ ആ വസ്തുതകൾ പിന്നീട് സപ്പോർട്ട് ചെയ്യുന്ന narrative-നെക്കുറിച്ച്
   അത് prejudge ചെയ്യുന്നില്ല.

7. **Coerced attestation.** ഉത്തരവാദപ്പെട്ട ധനകാര്യ പ്രിൻസിപ്പൽ
   transactions തെറ്റായി പ്രതിനിധീകരിക്കുന്ന ഒരു attestation-ൽ ഒപ്പിടാൻ
   coerce ചെയ്യപ്പെടുകയാണെങ്കിൽ, സീൽ coerced signature-ഓടെ coerced
   attestation-ന് anchor ചെയ്യുന്നു. സീൽ ആരാണ് ഒപ്പിട്ടത് (FACT 08)
   verify ചെയ്യുന്നു, അവർ എന്തുകൊണ്ട് ഒപ്പിട്ടു എന്നതല്ല. Coerced
   attestation സീൽ ചെയ്യുന്നത് coerced output-ന്റെ ഒരു സ്ഥിരമായ പൊതു
   record ഉൽപ്പാദിപ്പിക്കുന്നു — പിന്നീടുള്ള ഉത്തരവാദിത്വത്തിന് ഉപയോഗപ്രദമാണ്,
   പക്ഷേ നിമിഷത്തിലെ coercion-നെതിരെ ഒരു പ്രതിരോധമല്ല.

8. **അധികാരപരിധികളിലുടനീളമുള്ള താരതമ്യം.** ഒരു സീൽ ചെയ്ത ചെലവ് അതിന്റെ
   ഇഷ്യു ചെയ്യുന്ന അധികാരപരിധിയുടെ നിയമപരമായ regime-നെതിരെ മാത്രമേ
   വായിക്കാനാകൂ. "എന്തുകൊണ്ടാണ് Municipality X സേവനം Z-ന് Y നൽകിയത്,
   അതേസമയം Municipality W V മാത്രം നൽകി?" എന്നത് സീൽ ചെയ്യലിന് താഴെയുള്ള
   ഒരു comparative-analysis ചോദ്യമാണ്. Cross-jurisdiction benchmarking
   സീൽ ചെയ്ത ഡാറ്റയിലെ ഒരു analytical ടാസ്ക് ആണ്, സീലിന്റെ property അല്ല.

**മുകളിലുള്ള honest-limits വിഭാഗം ഈ kit-ന്റെ load-bearing ഭാഗമാണ്.**
സീൽ ചെയ്യൽ integrity-യ്ക്ക് തുല്യമാണെന്ന് വിശ്വസിക്കുന്ന ധനകാര്യ
ഉദ്യോഗസ്ഥരും രാഷ്ട്രീയക്കാരും ഈ kit ഒരു shield ആയി ഉപയോഗിക്കും. kit
വ്യക്തമായി പറയണം: ഇത് *ഇഷ്യു ചെയ്യൽ നിമിഷത്തിനായുള്ള ഒരു non-repudiation
primitive* ആണ്, ചെലവിന്റെ integrity-യുടെ ഒരു proof അല്ല.

---

## ഈ kit സീൽ ചെയ്യാൻ വിസമ്മതിക്കേണ്ടത്

സാധുവായ signing authority ഉള്ള ഒരു ഉപയോക്താവ് സമർപ്പിച്ചാലും ഇനിപ്പറയുന്ന
fact patterns നിരസിക്കാൻ kit configure ചെയ്തിരിക്കുന്നു:

- **Principal-signing level-ന് താഴെയുള്ള individual സർക്കാർ-employee
  നാമങ്ങൾ.** ഒരു വസ്തുതയും individual procurement-office staff, individual
  treasury clerks, individual scoring-panel members, അല്ലെങ്കിൽ ഒരു പൊതു
  മുഖമുള്ള ഉത്തരവാദിത്വ റോളിലല്ലാത്ത ഏതെങ്കിലും സ്വാഭാവിക വ്യക്തിയെ
  നാമകരണം ചെയ്യാൻ പാടില്ല. Line staff-നുള്ള exposure-to-retaliation റിസ്ക്
  transparency benefit-നേക്കാൾ കൂടുതലാണ്; അവരുടെ identities internal
  controls-ൽ (FACT 05 sign-off log-ന്റെ hash) സീൽ ചെയ്യപ്പെടുന്നു,
  attestation-ന്റെ body-ൽ അല്ല.

- **Vendor PII.** ഒരു വസ്തുതയും supplier ബാങ്ക് അക്കൗണ്ട് നമ്പറുകൾ, individual
  supplier-employee നാമങ്ങൾ, supplier ഹോം വിലാസങ്ങൾ, സ്വാഭാവിക വ്യക്തികളുടെ
  supplier tax IDs, supplier cost structure അടങ്ങിയ internal pricing
  breakdowns, അല്ലെങ്കിൽ പ്രസിദ്ധീകരണം supplier interests-നെ ഉപദ്രവിക്കുകയും
  anti-corruption-ന് സേവനം ചെയ്യാതിരിക്കുകയും ചെയ്യുന്ന മറ്റേതെങ്കിലും
  commercial-PII ഫീൽഡ് ഉൾപ്പെടുത്താൻ പാടില്ല. അത്തരം വിവരങ്ങൾ HASH
  ചെയ്യാം (FACT 05) പക്ഷേ പ്രസിദ്ധീകരിക്കാൻ പാടില്ല.

- **Security-classified ചെലവുകൾ.** National-security statutes പ്രകാരം
  classify ചെയ്ത ചെലവുകൾ ഈ kit പ്രകാരം സീൽ ചെയ്യാൻ യോഗ്യമല്ല. Classified
  handling വ്യത്യസ്ത ക്രിപ്റ്റോഗ്രാഫിക്, നിയമപരമായ ആവശ്യകതകളുള്ള ഒരു വ്യത്യസ്ത
  പ്രശ്നമാണ്. Reader-ന് പ്രസിദ്ധീകരണം design പ്രകാരം partial ആണെന്ന് അറിയാൻ
  exclusion തന്നെ FACT 07 R3-ൽ വെളിപ്പെടുത്തപ്പെടുന്നു.

- **തിരിച്ചറിയപ്പെട്ട സ്വാഭാവിക വ്യക്തികൾക്കെതിരെ tax obligations-ന്റെ
  Civil enforcement.** Enforcement ചെലവുകൾ പൊതുചെലവുകളാണെങ്കിലും,
  enforcement-ൽ individual taxpayers നാമകരണം ചെയ്യൽ നിരസിക്കപ്പെടുന്നു:
  privacy ഉപദ്രവം transparency benefit-നേക്കാൾ കൂടുതലാണ്, tax-court
  reporting പ്രകാരം സമാന്തര transparency നിലവിലുണ്ട്.

- **Pre-issuance transactions.** ഔപചാരിക അവാർഡിന് മുമ്പുള്ള കരാർ ഇല്ല;
  ഔപചാരിക ഇഷ്യു ചെയ്യലിന് മുമ്പുള്ള വിതരണം ഇല്ല. ഒരു draft കരാർ
  അല്ലെങ്കിൽ pending payment execute ചെയ്തതുപോലെ സീൽ ചെയ്യുന്നത് false
  certainty സൃഷ്ടിക്കുന്നു.

- **ഉത്തരവാദപ്പെട്ട ധനകാര്യ പ്രിൻസിപ്പൽ അല്ലാത്ത ആരെങ്കിലും സീൽ ചെയ്യൽ.**
  ഒരു കരാറുകാരന്, vendor, council അംഗത്തിന്, പത്രപ്രവർത്തകന്, അല്ലെങ്കിൽ
  observer-ന് ഇത് ഇഷ്യു ചെയ്ത ധനകാര്യ അധികാരിക്ക് പകരം "പൊതുചെലവ് record"
  സീൽ ചെയ്യാൻ കഴിയില്ല. (അവർക്ക് ഒരു വ്യത്യസ്ത പ്രസിദ്ധീകരണത്തിൽ സ്വന്തം
  പ്രിൻസിപ്പലിന് കീഴിൽ സ്വന്തം നിരീക്ഷണങ്ങൾ സീൽ ചെയ്യാം.)

- **"Free of corruption" framings.** "ഈ ചെലവ് നിയമപരവും അഴിമതിയില്ലാത്തതും
  ആയിരുന്നു" അല്ലെങ്കിൽ "procurement demonstrably ന്യായമായിരുന്നു" എന്ന
  രൂപത്തിലുള്ള ഏതെങ്കിലും framing സീൽ ചെയ്യാൻ kit നിരസിക്കുന്നു. അത്തരം
  claims kit-ന്റെ domain-ന് അപ്പുറം epistemically ആണ്.

- **FACT 07 companion disclosures ഒഴിവാക്കുന്ന പ്രസിദ്ധീകരണങ്ങൾ.**
  Accompanying disclosure-ഉം refusal record-ഉം ഇല്ലാത്ത transactions-ന്റെ
  ഒരു പ്രസിദ്ധീകരണം ഈ kit പ്രകാരം നിയമാനുസൃതമായ MYRIAM പ്രസിദ്ധീകരണമല്ല.

ഒരു refusal തന്നെ ഒരു വസ്തുതയായി സീൽ ചെയ്യാം ("ഈ കക്ഷി X സീൽ ചെയ്യാൻ
അഭ്യർത്ഥിച്ചു; refusal-rule Y അനുസരിച്ച് kit നിരസിച്ചു"), attempted
misuse-ന്റെ ഒരു പബ്ലിക് record സൃഷ്ടിക്കുന്നു. ധനകാര്യ ഉദ്യോഗസ്ഥരിലുള്ള
രാഷ്ട്രീയ മർദ്ദം documented ആയ ഒരു domain-ൽ, *refused* requests-ന്റെ ഒരു
record തന്നെ ഒരു integrity signal ആണ്.

---

## ഈ kit സീൽ ചെയ്യുന്നത്

ബജറ്റ്-നിർവ്വഹണ attestation-ന്റെ നിമിഷത്തിൽ 8 വസ്തുതകൾ:

1. **Example notice** — പ്രസിദ്ധീകരണം ഒരു example ആണെന്ന് പ്രഖ്യാപിക്കുന്നു
   (യഥാർത്ഥ attestations ഇത് നീക്കം ചെയ്യുകയോ മാറ്റിസ്ഥാപിക്കുകയോ ചെയ്യുന്നു).
2. **അധികാരപരിധിയും നിയമപരമായ അടിസ്ഥാനവും** — ഏത് സർക്കാർ entity ആണ്
   ഇഷ്യു ചെയ്യുന്നത്, ഏത് statutory authority പ്രകാരം, ഏത് fiscal period-ൽ.
3. **Appropriation അല്ലെങ്കിൽ budget reference** — execute ചെയ്യപ്പെടുന്ന
   adopted ബജറ്റിലെ specific lines, ബജറ്റ് instrument-ന്റെയും applied
   amendments / transfers / reprogrammings-ന്റെയും hashes-ഉം.
4. **Contract അല്ലെങ്കിൽ disbursement manifest** — per-transaction record:
   amount, vendor legal entity name (individual PII ഇല്ല), purpose, date,
   procurement type, award basis, contract document hash.
5. **Supporting document hashes** — solicitations, evaluations, executed
   contracts, change orders, pay applications, deliverable acceptance
   forms, treasury ledger entries, controls sign-off logs-ന്റെ SHA-256.
   Hashes മാത്രം, contents അല്ല — commercial-ഉം personal PII-ഉം
   സംരക്ഷിക്കാനും re-hash verification പ്രാപ്തമാക്കാനും.
6. **Audit-ഉം oversight state-ഉം** — ഏത് inspector-general body-യ്ക്കാണ്
   അധികാരപരിധി, ഏത് supreme audit institution, ഏത് prosecutorial body-യ്ക്കാണ്
   corruption-offense അധികാരപരിധി, audit deadlines, ഏതെങ്കിലും ongoing
   review-ന്റെ നിലവിലെ അവസ്ഥ.
7. **Companion disclosures-ഉം refusal record-ഉം** — pending procurement
   protests, pending internal investigations, outstanding FOI requests,
   dissenting reviews, അറിയപ്പെടുന്ന budget-line overruns; kit സീൽ ചെയ്യാൻ
   നിരസിച്ച patterns-ന്റെ വ്യക്തമായ list.
8. **Signing principal** — ഉത്തരവാദപ്പെട്ട ധനകാര്യ ഉദ്യോഗസ്ഥൻ + റോൾ +
   statutory accountability + dual control-ന് കീഴിലുള്ള co-signatories;
   ഓരോ signatory-ഉം വ്യക്തിപരമായി എന്ത് attest ചെയ്യുന്നു, എന്ത് അല്ല.

ഓരോ വസ്തുതയും refusal-gate convention-ഓടെ അവസാനിക്കുന്നു: *"ഈ വസ്തുത X മാത്രം
assert ചെയ്യുന്നു. ഇത് Y assert ചെയ്യുന്നില്ല"* (Y "DOES NOT do" വിഭാഗത്തിലെ
ഏറ്റവും അടുത്ത failure mode ആണ്).

---

## ഈ kit എന്തിനെതിരെ പ്രതിരോധിക്കുന്നു

- **Contract amounts-ന്റെ നിശ്ശബ്ദ post-issuance പരിഷ്കരണം.** FACT 04-ലെ
  ഏതെങ്കിലും amount-ലുള്ള ഏതെങ്കിലും മാറ്റം വ്യത്യസ്ത SHA-256, വ്യത്യസ്ത
  Merkle root ഉൽപ്പാദിപ്പിക്കുന്നു, OTS verification പരാജയപ്പെടുന്നു.
- **നിശ്ശബ്ദ Vendor substitution.** ഇതിനകം ഇഷ്യു ചെയ്ത ഒരു കരാറിൽ "Vendor A"
  "Vendor B" ആയി മാറ്റിസ്ഥാപിക്കുന്നത് സീൽ ചെയ്ത bytes-ൽ നിന്ന് കണ്ടെത്താനാകും.
- **Change orders-ന്റെ Backdating.** FACT 04 ഇഷ്യു ചെയ്യൽ സമയത്ത് change-order
  date-ഉം rationale-ഉം freeze ചെയ്യുന്നു; പിന്നീടുള്ള "ഇത് എപ്പോഴും
  സമ്മതിച്ച scope ആയിരുന്നു" എന്ന ഏതെങ്കിലും claim സീൽ ചെയ്ത change-order
  record-മായി പൊരുതണം.
- **അനുകൂലമല്ലാത്ത transactions-ന്റെ നിശ്ശബ്ദ അപ്രത്യക്ഷമാകൽ.** Period-ൽ
  ഇഷ്യു ചെയ്ത എല്ലാ transactions-ഉം ഒരു Merkle root-ന് കീഴിൽ FACT 04-ലാണ്.
  Subset പ്രസിദ്ധീകരിക്കുന്നത് leaf-hash list-ൽ നിന്ന് കണ്ടെത്താനാകും.
- **Companion-disclosure suppression.** FACT 07 attestation-ന്റെ നിമിഷത്തിൽ
  pending-protest, pending-investigation, outstanding-FOI state freeze
  ചെയ്യുന്നു. പിന്നീടുള്ള "ആ protest-നെക്കുറിച്ച് ഞങ്ങൾ ഒരിക്കലും
  കേട്ടിട്ടില്ല" claim പരസ്യമായി diff-ചെയ്യാവുന്നതാണ്.
- **Audit-jurisdiction drift.** സീൽ ചെയ്ത transactions-ന് മേൽ ഏത് bodies-ന്
  oversight അധികാരപരിധി ഉണ്ടെന്ന് FACT 06 freeze ചെയ്യുന്നു. ഒരു പ്രത്യേക IG-ന്
  "അധികാരം ഇല്ലായിരുന്നു" എന്ന പിന്നീടുള്ള claim സീൽ ചെയ്ത അധികാരപരിധി
  record-മായി പൊരുതണം.
- **Refusal-record erasure.** kit സീൽ ചെയ്യാൻ നിരസിച്ചത് FACT 07 record
  ചെയ്യുന്നു; "ഞങ്ങൾ ഒരിക്കലും ഒന്നും നിരസിച്ചിട്ടില്ല" എന്ന പിന്നീടുള്ള
  ഏതെങ്കിലും claim സീൽ ചെയ്ത record-നെ വൈരുദ്ധ്യപ്പെടുത്തുന്നു.

---

## kit സഹായിക്കുമായിരുന്ന ചരിത്രകേസുകൾ

പൊതുചെലവ് രേഖകളുടെ നിശ്ശബ്ദ മുൻകാല പ്രാബല്യത്തിലുള്ള പരിഷ്കരണം ഉൾപ്പെടുന്ന
documented public-record കേസുകളിൽ kit ഉപയോഗപ്രദമായ ഒരു **forensic anchor**
ഉൽപ്പാദിപ്പിക്കുമായിരുന്നു — *ഒരു പരിഹാരമല്ല, പ്രതിരോധമല്ല, ക്രിമിനൽ
പ്രോസിക്യൂഷന് പകരമല്ല*:

- **Brazil — *Operação Lava Jato* / Petrobras lineage (2014–2021).**
  Petrobras-ഉം മറ്റ് federal infrastructure കരാറുകളും-ലെ ~3% kickbacks-ന്
  ഒരു ദശാബ്ദത്തിലേറെയായി പണം നൽകുകയും, kickback രാഷ്ട്രീയക്കാർക്കും
  cartel-ന്റെ സ്വന്തം price coordination-നും route ചെയ്യപ്പെടുകയും ചെയ്ത
  പ്രധാന നിർമ്മാണ സ്ഥാപനങ്ങളുടെ ഒരു cartel-നെ Brazilian federal prosecutors
  document ചെയ്തു. ഇഷ്യു ചെയ്ത കരാറുകൾ routine ആയി കാണപ്പെട്ടു; അഴിമതി
  ഇഷ്യു ചെയ്യലിന്റെ upstream ആയിരുന്നു. ഒരു sealing kit Lava Jato തടയില്ലായിരുന്നു
  (കരാർ സീലിലെത്തുന്നതിന് മുമ്പ് kickbacks വിലയിൽ embed ചെയ്തിരുന്നു),
  പക്ഷേ ഇഷ്യു ചെയ്യൽ സമയത്ത് കരാർ വ്യവസ്ഥകൾ anchor ചെയ്യുമായിരുന്നു —
  പിന്നീടുള്ള "ഒപ്പിട്ടപ്പോൾ ഓരോ കരാറും യഥാർത്ഥത്തിൽ എന്താണ് പറഞ്ഞത്"
  എന്ന forensic reconstruction വളരെ ചെലവുകുറഞ്ഞതാക്കുമായിരുന്നു. Lava
  Jato-യുടെ investigative ചെലവ് വലിയ ഭാഗത്ത് inconsistent archived
  records-ൽ നിന്ന് timelines reassemble ചെയ്യുന്നതിന്റെ ചെലവായിരുന്നു.

- **European Union — regional development fund disputes (ഒന്നിലധികം
  member states, 2010s–2020s).** European Court of Auditors annual
  reports European Structural and Investment Fund (ESIF) ഉം Cohesion
  Fund ചെലവുകളിലുമുള്ള material error rates ആവർത്തിച്ച് തിരിച്ചറിഞ്ഞു,
  ചില വർഷങ്ങളിൽ materiality threshold കവിഞ്ഞു. "യഥാർത്ഥത്തിൽ എന്ത് claim
  ചെയ്തു" vs "യഥാർത്ഥത്തിൽ എന്ത് deliver ചെയ്തു" എന്നതിനെക്കുറിച്ചുള്ള
  തർക്കങ്ങൾ ആവർത്തിക്കുന്നു, കാരണം submission-നും audit-നും ഇടയിൽ claim
  documentation പരിഷ്കരിക്കാം. Claim-as-submitted-ന്റെ per-issuance MYRIAM
  sealing ഓരോ claim-ന്റെയും contents submission-ൽ anchor ചെയ്യുമായിരുന്നു,
  "സമയത്ത് beneficiary claim ചെയ്തത്" "post-audit reconstruction
  concluded ചെയ്തത്" എന്നിവയിൽ നിന്ന് വേർതിരിക്കുമായിരുന്നു.

- **Iraq — Coalition Provisional Authority (CPA) disbursements,
  2003–2004.** Special Inspector General for Iraq Reconstruction (SIGIR)
  ഉം പിന്നീടുള്ള audit reports-ഉം substantially incomplete ആയി
  characterise ചെയ്ത documentation-ഓടെ CPA Development Fund for Iraq-ൽ
  നിന്ന് ഏകദേശം USD 9 ബില്യൺ cash disburse ചെയ്തു. Disbursement
  records-നെക്കുറിച്ചുള്ള തർക്കങ്ങൾ രണ്ട് ദശാബ്ദങ്ങൾക്ക് ശേഷവും തുടരുന്നു.
  Disbursement നിമിഷത്തിൽ സീൽ ചെയ്യൽ CPA നിലനിർത്താത്ത records
  സൃഷ്ടിക്കില്ലായിരുന്നു — പക്ഷേ ഏതെങ്കിലും record നിലനിന്നിരുന്നിടത്ത്
  (handwritten ledgers, dated transfer authorisations), ഒരു
  contemporaneous സീൽ ഇഷ്യു ചെയ്യൽ നിമിഷത്തിൽ ആ record-ന്റെ bytewise
  state anchor ചെയ്യുമായിരുന്നു, "സമയത്തെ record" "പിന്നീട് reconstruct
  ചെയ്ത record"-ൽ നിന്ന് വേർതിരിക്കുമായിരുന്നു.

- **Greece — sovereign debt-ഉം public-expenditure-reporting revisions-ഉം
  (2009–2010).** 2009–2010-ലെ Eurostat audits മുമ്പ് report ചെയ്ത Greek
  fiscal data-യിൽ substantial revisions document ചെയ്തു, revision-ന്റെ
  methodology തന്നെ തർക്കത്തിലായിരുന്നു. യഥാർത്ഥ പ്രസിദ്ധീകരണ നിമിഷത്തിൽ
  quarterly expenditure reports സീൽ ചെയ്യൽ യഥാർത്ഥവും revised reports-ഉം
  തമ്മിലുള്ള *delta* archive താരതമ്യത്തിലൂടെ മാത്രം reconstruct
  ചെയ്യാവുന്നതിന് പകരം പരസ്യമായി diff-ചെയ്യാവുന്നതാക്കുമായിരുന്നു. സീൽ
  underlying methodological dispute തടയില്ലായിരുന്നു, പക്ഷേ യഥാർത്ഥ
  report-ന്റെ നിമിഷത്തിൽ ഓരോ report ചെയ്ത quarter anchor ചെയ്യുമായിരുന്നു.

- **United Kingdom — pandemic procurement (2020–2022).** UK National
  Audit Office-ഉം parliamentary committee reports-ഉം 2020–2021 സമയത്ത്
  കുറഞ്ഞ മത്സരവും കുറഞ്ഞ documentation-ഉമുള്ള emergency provisions
  പ്രകാരം കരാറുകൾ അവാർഡ് ചെയ്ത procurement processes തിരിച്ചറിഞ്ഞു; ചില
  awards പിന്നീട് പരിഷ്കരിക്കുകയോ, റദ്ദാക്കുകയോ, settle ചെയ്യുകയോ ചെയ്തു.
  ഓരോ emergency-procurement award-ന്റെയും Per-issuance sealing അവാർഡ്
  നിമിഷത്തിൽ award rationale-ഉം terms-ഉം anchor ചെയ്യുമായിരുന്നു,
  പിന്നീടുള്ള പരിഷ്കരണങ്ങൾ ഒരു നിശ്ശബ്ദമായി പരിഷ്കരിച്ച record-ന് പകരം
  പരസ്യമായി കാണാവുന്ന ഒരു delta ആക്കുമായിരുന്നു.

- **South Africa — state-capture-era public-enterprise contracts
  (~2010–2018).** Zondo Commission നിരവധി state-owned enterprises (Eskom,
  Transnet, Denel) -ലെ കരാറുകൾ document ചെയ്തു, അവയുടെ documentation
  വിവിധരൂപത്തിൽ incomplete, പരിഷ്കരിച്ച, അല്ലെങ്കിൽ തർക്കത്തിലായിരുന്നു.
  ഓരോ കരാർ അവാർഡും ഇഷ്യു ചെയ്യലിൽ സീൽ ചെയ്യൽ record-ന്റെ as-awarded
  state anchor ചെയ്യുമായിരുന്നു, പിന്നീടുള്ള forensic-reconstruction
  outputs contemporaneous record-ൽ നിന്ന് വേർതിരിക്കുമായിരുന്നു.

മുകളിലുള്ള ഏതെങ്കിലും കേസുകളിലെ underlying അഴിമതി kit തടയില്ലായിരുന്നു.
പല കേസുകളിലും underlying പ്രശ്നം അഴിമതി *ഇഷ്യു ചെയ്യലിന്റെ upstream*
ആയിരുന്നു — സീൽ corrupt കരാർ ഉയർന്ന integrity-യിൽ anchor ചെയ്യുന്നു,
അത് ഒരു വ്യത്യസ്ത തരം ഉപയോഗപ്രദമാണ് (പിന്നീടുള്ള accountability-യ്ക്കുള്ള
forensic anchor) പക്ഷേ പ്രതിരോധത്തിന് സമാനമല്ല. മറ്റ് കേസുകളിൽ (CPA cash,
off-budget spending) underlying പ്രശ്നം സീൽ ചെയ്യപ്പെടുന്ന records
നിലവിലില്ലായിരുന്നു അല്ലെങ്കിൽ നിലനിർത്തിയിരുന്നില്ല — അധികാരി ഉൽപ്പാദിപ്പിക്കാത്ത
records kit-ന് സൃഷ്ടിക്കാനാകില്ല.

ഈ ചരിത്രകേസുകൾ പരസ്യമായി documented findings-ലേക്കുള്ള (കോടതി records,
parliamentary committee reports, audit-body പ്രസിദ്ധീകരണങ്ങൾ) റഫറൻസോടെ
മാത്രമേ പേരെടുക്കുകയുള്ളൂ. ഏതെങ്കിലും വ്യക്തിയെക്കുറിച്ച് claim ചെയ്യുന്നില്ല;
documented institutional findings പബ്ലിക് record-ൽ നിൽക്കുന്നു.

---

## ഈ kit എപ്പോൾ ഉപയോഗിക്കണം

- നിങ്ങളുടെ അധികാരപരിധിക്ക് ഒരു established ബജറ്റ്-നിർവ്വഹണ reporting
  process ഉണ്ട്, ഒരു immutable പബ്ലിക് anchor ചേർക്കാൻ ആഗ്രഹിക്കുന്നു.
- നിങ്ങൾ post-issuance scrutiny (FOI requests, audit, civil-society
  monitoring, journalistic investigation) പ്രതീക്ഷിക്കുന്നു, ഒരു
  tamper-evident reference point ആഗ്രഹിക്കുന്നു.
- privacy/security exclusions ബഹുമാനിച്ചുകൊണ്ട് listed fact set
  പ്രസിദ്ധീകരിക്കാൻ transparency / open-records law-ന് കീഴിൽ നിങ്ങൾക്ക്
  നിയമപരമായ അധികാരം ഉണ്ട്.
- നിങ്ങൾ ഒരു statutory audit regime (inspector general, supreme audit
  institution) -ന് കീഴിൽ പ്രവർത്തിക്കുന്നു, audit cycle എത്തുന്നതിന് മുമ്പ്
  ഓരോ quarterly close-ഉം anchor ചെയ്യാൻ ആഗ്രഹിക്കുന്നു.
- നിങ്ങൾ Open Contracting Data Standard അല്ലെങ്കിൽ IATI പ്രകാരം
  പ്രസിദ്ധീകരിക്കുന്നു, portal-based പ്രസിദ്ധീകരണത്തിന് ഒരു
  ക്രിപ്റ്റോഗ്രാഫിക് complement ആഗ്രഹിക്കുന്നു.

## ഈ kit എപ്പോൾ ഉപയോഗിക്കരുത്

- **Statutory audit, inspector-general review, prosecutorial
  investigation, അല്ലെങ്കിൽ civil-society monitoring-ന് പകരം ഉപയോഗിക്കരുത്.**
  kit *additive* ആണ്, ഒരു replacement അല്ല.
- **ഒരു legitimacy certificate ആയി ഉപയോഗിക്കരുത്.** ഒരു സീൽ ചെയ്ത ചെലവ്
  record ഒരു corruption-free certificate അല്ല. അതിനെ അങ്ങനെ പരിഗണിക്കുന്നത്
  kit-ന്റെ constraint-first ഘടന തടയാൻ നിലനിൽക്കുന്ന failure mode ആണ്.
- **Mid-period ഉപയോഗിക്കരുത്.** kit ഔപചാരിക ഇഷ്യു ചെയ്യലിന്റെ നിമിഷത്തിനാണ്
  (quarterly close, contract award, milestone disbursement). Mid-period
  seals തെറ്റിദ്ധരിപ്പിക്കുന്ന reference points സൃഷ്ടിക്കുന്നു.
- **ചെലവ് നിയമപരവും, ന്യായവും, അഴിമതിയില്ലാത്തതുമായിരുന്നു എന്ന് claim
  ചെയ്യാൻ ഉപയോഗിക്കരുത്** — kit-ന് അത് ചെയ്യാനാകില്ല.
- **Classified ചെലവുകൾ, individual employee PII, അല്ലെങ്കിൽ supplier
  commercial PII സീൽ ചെയ്യാൻ ഉപയോഗിക്കരുത്.** kit ഈ patterns നിരസിക്കുന്നു;
  അവ ശ്രമിക്കുന്നത് ഒരു refusal record സൃഷ്ടിക്കുന്നു (FACT 07).
- **Pre-issuance drafts സീൽ ചെയ്യാൻ ഉപയോഗിക്കരുത്.** Drafts ഒരു വ്യത്യസ്ത
  attestation type-ൽ ("draft for comment, not issued") സീൽ ചെയ്യാം, പക്ഷേ
  ഈ kit-ന്റെ issuance type-ൽ അല്ല.
- **FACT 07 disclosures ഒഴിവാക്കാൻ മർദ്ദത്തിൽ ഉപയോഗിക്കരുത്.** നിരസിക്കുക,
  refusal സീൽ ചെയ്യുക.
- **നിങ്ങളുടെ ധനകാര്യ അധികാരി captured ആണെങ്കിൽ ഉപയോഗിക്കരുത്.** ഒരു സീൽ
  ചെയ്ത fraudulent ചെലവ് fraud-ന്റെ ഒരു സ്ഥിരമായ പബ്ലിക് record ആണ്,
  അതിന്റെ ഒരു പ്രതിരോധമല്ല. Primitive രണ്ടു വശങ്ങളിലും cut ചെയ്യുന്നു;
  അതാണ് അതിന്റെ honesty.

---

## ഒരു യഥാർത്ഥ attestation-നായി ഈ kit എങ്ങനെ fork ചെയ്യാം

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Critical timing:** ഔപചാരിക ഇഷ്യു ചെയ്യൽ നിമിഷത്തിൽ സീൽ ചെയ്യുക — അതായത്,
ഉത്തരവാദപ്പെട്ട ധനകാര്യ പ്രിൻസിപ്പൽ quarterly close ഒപ്പിടുന്ന നിമിഷം, ഒരു
കരാർ ഔപചാരികമായി അവാർഡ് ചെയ്യപ്പെടുന്ന നിമിഷം, അല്ലെങ്കിൽ ഒരു disbursement
ഔപചാരികമായി ഇഷ്യു ചെയ്യപ്പെടുന്ന നിമിഷം. ഔപചാരിക ഇഷ്യു ചെയ്യലിന് മുമ്പുള്ള
ഒരു സീൽ ഒരു false-positive "ഇത് ഔദ്യോഗിക record ആണ്" reference സൃഷ്ടിക്കുന്നു.
ഔപചാരിക ഇഷ്യു ചെയ്യലിന് വളരെ ശേഷമുള്ള ഒരു സീൽ intervening modifications-നെതിരെ
forensically ദുർബലമാണ്.

**Cadence:** kit default-ആയി quarterly attestations-നായി രൂപകൽപ്പന
ചെയ്തിരിക്കുന്നു. Sub-quarterly cadences (monthly close, per-transaction
sealing) ഉചിതമായ scope-ഓടെ re-run ചെയ്ത് സപ്പോർട്ട് ചെയ്യപ്പെടുന്നു; ഒരൊറ്റ
ഉയർന്ന മൂല്യമുള്ള transaction-ന്റെ സീൽ ഒരു നിയമാനുസൃതമായ ഉപയോഗമാണ്.

---

## നിലവിലുള്ള public-finance infrastructure-മായുള്ള integration

kit ഇവയോട് compose ചെയ്യാൻ രൂപകൽപ്പന ചെയ്തിരിക്കുന്നു, replace അല്ല:

- **Open Contracting Data Standard (OCDS) v1.1.5.** അഞ്ച് പ്രസിദ്ധീകരണ
  points (planning, tender, award, contract, implementation) FACT 03
  (planning → appropriation), FACT 04 (tender, award, contract,
  implementation → transaction manifest), FACT 05 (supporting document
  hashes) -ലേക്ക് സ്വാഭാവികമായി map ചെയ്യുന്നു. OCDS JSON export തന്നെ
  FACT 05-ൽ (control documents) സീൽ ചെയ്യപ്പെടുന്നു. OCDS publication
  നടത്തുന്ന ഒരു അധികാരപരിധിക്ക് നിലവിലുള്ള portal-ന് മുകളിൽ ഒരു
  ക്രിപ്റ്റോഗ്രാഫിക് layer ആയി MYRIAM sealing ചേർക്കാം.

- **International Aid Transparency Initiative (IATI) standard v2.03.**
  മൊത്തമായോ ഭാഗികമായോ external aid-വഴി ധനസഹായം ലഭിക്കുന്ന ചെലവുകൾക്ക്,
  IATI XML ഒരു control document ആയി സീൽ ചെയ്യാം; സീൽ IATI Registry-യുടെ
  HTTP-based publication model-ന് ഒരു ക്രിപ്റ്റോഗ്രാഫിക് complement
  നൽകുന്നു.

- **Open Government Partnership (OGP) commitments.** OGP National
  Action Plans-ൽ പതിവായി fiscal-transparency commitments ഉൾപ്പെടുന്നു;
  MYRIAM sealing സർക്കാരിന്റെ portal-ൽ വിശ്വാസം ആവശ്യമില്ലാതെ civil
  society സ്വതന്ത്രമായി verify ചെയ്യാവുന്ന ഒരു രീതിയിൽ ഒരു
  "tamper-evident publication" commitment operationalise ചെയ്യുന്നു.

- **OECD Recommendation on Public Integrity (2017).** പബ്ലിക് ഫിനാൻസ്-ലെ
  open government data മെഷീൻ-വായിക്കാവുന്ന, സമയോചിതമായ രൂപത്തിലാക്കുന്നതിലൂടെ
  ഡാറ്റ machine-readable മാത്രമല്ല ക്രിപ്റ്റോഗ്രാഫിക്കായി anchor
  ചെയ്യപ്പെടുന്നതുമാക്കിക്കൊണ്ട് kit Recommendation 4 സപ്പോർട്ട് ചെയ്യുന്നു.

- **UN Convention against Corruption (UNCAC), പ്രത്യേകിച്ച് Articles
  9 (procurement) ഉം 13 (participation of society) ഉം.** Article 9
  transparency obligations-ഉം Article 13 civil-society oversight-ഉം
  സപ്പോർട്ട് ചെയ്യുന്ന ഒരു forensic primitive kit നൽകുന്നു.

- **Supreme Audit Institutions (SAIs) — INTOSAI framework.** INTOSAI
  മാനദണ്ഡങ്ങൾ (ISSAI) -ന് കീഴിൽ പ്രവർത്തിക്കുന്ന SAIs ഉയർന്ന integrity-ഓടെ
  സീൽ ചെയ്ത പ്രസിദ്ധീകരണങ്ങൾ തെളിവായി ഉപഭോഗം ചെയ്യാം; FACT 05-ലെ SHA-256
  hashes SAI-യുടെ e-audit tools-ന് re-compute ചെയ്യാവുന്ന അതേ hashes ആണ്.

- **Inspector-general offices.** സീൽ ചെയ്ത ചെലവുകൾക്ക് മേൽ അധികാരപരിധിയുള്ള
  Domestic IG offices-ന് (FACT 06) FACT 05-ൽ hashes സീൽ ചെയ്ത document
  bodies subpoena ചെയ്യാം; സീൽ subpoena പ്രകാരം ലഭിച്ച document bodies
  ഇഷ്യു ചെയ്യലിൽ നിലനിന്നിരുന്ന bodies-മായി bind ചെയ്യുന്നു.

- **Freedom-of-information-ഉം open-records statutes-ഉം.** സീൽ
  ഇഷ്യു ചെയ്യുന്ന അധികാരിയെ തുടരുന്ന FOI obligations-ൽ നിന്ന് ഒഴിവാക്കുന്നില്ല;
  വാസ്തവത്തിൽ, അത് selective FOI response സീൽ ചെയ്ത record-ൽ നിന്നുള്ള
  ഒരു deviation ആയി കണ്ടെത്താവുന്നതാക്കുന്നു. FACT 07 C3 attestation
  സമയത്ത് outstanding FOI requests anchor ചെയ്യുന്നു.

- **Beneficial-ownership registries (FATF Recommendation 24, EU
  AML directives, US Corporate Transparency Act).** Beneficial-ownership
  data ഈ kit പ്രകാരം സീൽ ചെയ്യപ്പെടുന്നില്ല (FACT 04 vendor identity
  registered legal-entity name-ൽ നിന്ന് മാത്രം source ചെയ്യുന്നു). Ein
  beneficial-ownership disclosure Merkle root വഴി reference ചെയ്യപ്പെടുന്ന
  ഒരു സമാന്തര പ്രസിദ്ധീകരണം ഉൽപ്പാദിപ്പിക്കാവുന്ന ഒരു വ്യത്യസ്ത sealing
  regime ആണ്.

- **Court-administered transparency (judicial expenditure
  reporting, asset-recovery proceedings).** Corruption-related കോടതി
  നടപടികളുടെ outputs ഈ kit-ന്റെ scope-ൽ അല്ല, പക്ഷേ സമാന്തര attestation
  types-ന് കീഴിൽ സീൽ ചെയ്യാം.

## ഈ kit replace ചെയ്യാത്തത്

- inspector-general bodies-ന്റെ statutory ബജറ്റ്-നിർവ്വഹണ audit
- Supreme-audit-institution review (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes, തുല്യം)
- അഴിമതി കുറ്റങ്ങളുടെ Prosecutorial investigation (ദേശീയ
  anti-corruption prosecutors, UNCAC Article 36 bodies)
- Civil-society ഉം journalistic investigative reporting ഉം
- Whistleblower channels ഉം protected-disclosure regimes ഉം
- Beneficial-ownership disclosure
- അന്താരാഷ്ട്ര peer review (OECD, IMF Fiscal Transparency
  Evaluation, EU semester, IATI registry)
- Court-administered asset-recovery നടപടികൾ

സീൽ മുകളിലുള്ള എല്ലാത്തിന്റെയും ചെലവ് കുറയ്ക്കുകയും വിശ്വാസ്യത
വർദ്ധിപ്പിക്കുകയും ചെയ്യുന്ന ഒരു forensic primitive ആണ്. അത് അവയ്ക്കൊന്നിനും
പകരമല്ല, ആകാനും കഴിയില്ല.

---

## ലൈസൻസ്

പബ്ലിക് ഡൊമെയ്ൻ (CC0). Fork ചെയ്യൂ. ഉദ്ധരണി ആവശ്യമില്ല.
