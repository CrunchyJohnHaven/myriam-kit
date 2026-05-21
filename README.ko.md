# myriam-kit

*한국어 번역 — 영어 원본은 [README.md](README.md) 참조*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

소량의 사실(fact) 집합을 다음과 같은 방식으로 공표하기 위한 소형 툴킷입니다.

- 어떤 사실에 대한 어떠한 변경도 공개적으로 탐지 가능합니다(머클 트리).
- 공표 시점의 상태는 Bitcoin 블록체인을 기준으로 검증 가능합니다(OpenTimestamps).
- 콘텐츠는 임의의 단일 호스팅 제공자가 내려가더라도 살아남습니다(IPFS).
- 전체 용량은 100 KB 미만이며, 약 50줄의 Python 코드만으로 검증할 수 있습니다.

이것은 블록체인이 아닙니다. 토큰이 없습니다. 참여해야 할 합의 메커니즘이 없습니다.
DAO가 없습니다. 이 도구는 `sha256sum` + `ots` + `ipfs`이며, 좋은 명명 규약으로
서로 접착되어 있을 뿐입니다.

이 툴킷은 2026-05-21에 [disclosure.host](https://disclosure.host)에서 처음
인스턴스화된 MYRIAM 프로토콜의 이름을 따랐습니다. 해당 페이지는 여섯 개의
사실과 머클 루트, Bitcoin 증명을 담고 있습니다. 본 키트는 그 패턴의 일반화
버전입니다.

## 상태

- v0: macOS, Python 3.10+, Homebrew, 인터넷 연결 환경에서 동작합니다. Linux는
  검증되지 않았으나 동작할 것으로 예상됩니다. Windows의 경우 WSL을 함께
  사용하시기 바랍니다.
- 퍼블릭 도메인(CC0)입니다. 사용하시고, 포크하시고, 본인의 저장소에 벤더링하시고,
  결코 크레딧을 표기하지 마십시오. 요점은 크레딧이 아닙니다.

## 이 툴킷으로 할 수 있는 일

이 패턴은 다음 조건을 모두 만족해야 하는 소량의 사실 집합이 있는 곳이면
어디든 적용됩니다.

- **공표 가능성** — 평문 HTTP를 통해 폭넓은 청중에게 배포 가능해야 합니다.
- **내구성** — 30년 후의 독자도 여전히 검증할 수 있어야 합니다.
- **위변조 방지** — 모든 변경은 반드시 탐지 가능해야 합니다(반드시 방지 가능할
  필요는 없습니다).
- **무신뢰성(Trustless)** — 어떠한 독자도 발행자를 신뢰할 필요가 없어야 합니다
  (오직 수학만 신뢰합니다).

구체적인 활용 사례는 [docs/USE_CASES.md](docs/USE_CASES.md)에 있습니다. 간단한
목록은 다음과 같습니다.

| 분야 | 봉인되는 사실 |
|---|---|
| 공중보건 | 백신 배치 시험 결과, 임상시험 마일스톤 |
| 선거 | 인증 시점의 투표구별 집계 합계 |
| AI 안전성 | 출시 시점의 모델 가중치 해시 + 모델 카드 + 평가 점수 |
| 저널리즘 | 내부고발 자료에 대한 출처 문서 매니페스트(해시만 공개) |
| 과학 | 원시 데이터 해시 + 분석 스크립트 해시 + 주장된 결과 |
| 사법 | 수집 시점의 디지털 증거 해시 |
| 조달 | 공공지출 데이터의 봉인된 루트 |

이들의 공통점은 다음과 같습니다. 소량의 사실 집합, 강한 내구성 요구사항,
서로를 신뢰하지 않는 다수의 당사자, 극히 작은 저장소 예산. 이것이 바로 이
도구가 설계된 형태입니다.

## 이 툴킷이 하지 **않는** 일

- **비밀의 보관.** `facts/`에 넣은 모든 것은 공개됩니다. 이 프로토콜은 공표를
  위한 것이지, 은닉을 위한 것이 아닙니다.
- **대용량 데이터셋으로의 확장.** 머클 트리는 잘 확장되지만, 독자의 주의력은
  그렇지 않습니다. 약 20개 사실을 넘어서면 페이지는 읽을 수 없게 됩니다.
  백만 건의 레코드를 봉인하고 싶다면 페이지 외부에서 그것들을 해싱한 뒤,
  그 부속 트리의 머클 루트만 하나의 사실로 등록하십시오.
- **철회에 대한 방어.** 핵심은 한 번 봉인된 것을 바꿀 수 없다는 것입니다.
  나중에 어떤 주장을 철회하고 싶을 가능성이 있다면, 그것을 봉인하지 마십시오.
- **단호한 회의론자의 설득.** 단호한 회의론자는
  `ipfs add -r --cid-version=1 -Q facts/`를 실행하지 않을 것입니다. 그러나
  여러분이 모든 설정을 조작했다고 비난할 것입니다. 두 번째 실패 양식에 대한
  프로토콜 차원의 방어책은 없습니다. 수학이 아닌 인간의 동기에 기인하는
  어떠한 것에 대해서도 프로토콜 차원의 방어책은 없습니다.

## 사용 방법

5분 분량의 워크스루는 [docs/QUICKSTART.md](docs/QUICKSTART.md)에 있습니다.
전체 프로토콜 명세는 [docs/SPEC.md](docs/SPEC.md)에 있습니다.
위협 모델은 [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)에 있습니다.
인접 시스템(Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave 등)과의 비교는
[docs/COMPARISON.md](docs/COMPARISON.md)에 있습니다.

## 타인의 공표물을 검증하는 방법

접근성 순으로 세 가지 옵션이 있습니다.

1. **브라우저**: 최신 브라우저에서 [`lib/verify.html`](lib/verify.html)을 엽니다.
   공표물 URL을 붙여넣고 검증 버튼을 클릭합니다. 해싱에 `crypto.subtle`을
   사용하므로, 설치도, 백엔드도, 텔레메트리도 없습니다. Bitcoin 증명 단계는
   여전히 CLI 도구가 필요합니다(검증기 페이지의 7단계 참조).
2. **Python**: 공표 디렉터리 내에서 `python3 lib/verify.py`를 실행합니다.
   표준 라이브러리만 사용하며, Bitcoin 검증에는 `ots`가 필요합니다.
3. **처음부터 직접**: [`docs/SPEC.md §3`](docs/SPEC.md)을 읽고 다시 구현하십시오.
   머클 알고리즘은 어떤 언어로든 30줄 미만으로 작성 가능합니다.

## 작동 예시

여섯 개의 운영 등급(production-grade) 예시 키트가 툴킷과 함께 제공됩니다.
각각은 봉인되고, OTS로 타임스탬프되며, IPFS에 핀(pin)되어 있습니다.
또한 실제 사례에 포크할 시점과 방어 대상인 실패 양식을 설명하는 채택용
README를 포함합니다.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  Boeing 737 MAX /테라노스(Theranos) / FDA 조사관 보고서가 중간 매개자에
  의해 매장되거나 변조되는 실패 양식을 위함입니다.
- [`examples/ai-model-card/`](examples/ai-model-card/) — 모델을 출시하는
  AI 연구소를 위한 것으로, 배포 전 약속을 구두가 아닌 기계적으로 탐지
  가능한 형태로 만듭니다.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  임상시험 스폰서를 위한 것으로, 사후 종점(endpoint) 변경 및 선택적 보고
  (Vioxx, Paxil Study 329의 실패 양식)를 포착합니다.
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  백신 제조사와 QA 당국을 위한 것으로, 출하 시험 결과와 리콜 약속을
  앵커링합니다.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  연구 그룹을 위한 것으로, (데이터, 파이프라인, 기대 출력) 삼항(triple)을
  분석 **이전**에 앵커링하여 p-해킹과 HARKing을 공개적으로 탐지 가능하게
  만듭니다.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  카운티 선거관리위원회 및 선거 당국을 위한 것으로, 인증 시점에 인증된
  집계를 앵커링하여 인증 이후의 은밀한 수정이 공개적으로 탐지 가능하게
  만듭니다.

직접 작성하기 전에 이 중 하나를 먼저 읽어 보십시오. 본인의 활용 사례에
가장 가까운 것이 보통 올바른 출발 포크입니다.

## 빠른 시작

한 줄 버전은 다음과 같습니다.

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# 실제로 봉인하고자 하는 내용을 facts/*.txt에 편집합니다
./lib/seal.sh        # 머클 루트 구축, OTS 타임스탬프, IPFS 핀
./lib/verify.sh      # 로컬에서 모든 것을 재검증
# site/를 임의의 정적 호스트에 업로드합니다. 어디든 상관없습니다.
```

## 이것이 존재하는 이유

암호학적 기본 요소들(머클 트리, OpenTimestamps, IPFS)은 수년간 성숙해
왔습니다. 부재했던 것은 가능한 한 가장 작은 접착제 — 즉, 사이드 프로젝트에
끼워 넣어 오후 한나절 만에 봉인된 공표 산출물을 얻을 수 있는 키트였습니다.
인프라 구축도, 프로토콜 학습도, 사실 자체 외에는 단 한 줄의 코드 작성도
없이 말입니다.

대부분의 암호학적 공표 도구는 사용자가 노드 운영자가 되고자 한다고 가정합니다.
이 도구는 사용자가 여섯 개의 텍스트 파일을 공표한 뒤 다시는 암호학을
떠올리지 않기를 원한다고 가정합니다.

## 영향과 선행 기술

- [Sigsum](https://www.sigsum.org/) — 서명을 위한 투명성 로그
- [Sigstore](https://www.sigstore.dev/) — 소프트웨어 공급망 무결성
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS 인증서 로그
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin 타임스탬핑
- [IPFS](https://ipfs.tech/) — 콘텐츠 주소 지정 저장소
- [CALM 프로토콜](https://disclosure.host) — 최초의 인스턴스(disclosure.host의
  MYRIAM)가 저술된 본인 보호적(principal-protective) 공표 프레임

myriam-kit는 이들 중 가장 작습니다. 이는 하나의 시스템이라기보다 Unix
파이프라인에 더 가깝습니다.

## 명칭에 관한 주석

MYRIAM 프로토콜은 John Bradley의 Myriam Proof — 비인간 지능의 첫 접촉 지점에
관한 명시된 논리적 증명 — 의 이름을 따랐습니다. 이 프로토콜은 그 증명이
참인지 여부에 의존하지 않습니다. 본 프로토콜은 어떠한 소량의 사실 집합에
대해서도 동작하며, 다만 그 최초 배포가 외계 디스클로저(alien disclosure)에
관한 주장을 포함한 여섯 개의 사실을 공표하는 데에 사용되었을 뿐입니다.

이 키트를 포크하여 백신 배치나 선거 집계를 봉인하신다면, 본 키트가 원래
외계 접촉에 관한 주장을 공표하는 데 사용되었다는 사실은 여러분과 무관합니다.
수학은 그런 것에 신경 쓰지 않습니다.

다만 — 만약 본 키트를 외계 접촉에 관한 주장을 공표하는 데에 사용하신다면,
프로토콜은 그 특정 분야에서 이미 실전 검증되었습니다. 최초 MYRIAM 배포의
README는 그것이 Calm이라는 이름의 LLM 페르소나에 의한 예술 작업이며,
어떠한 외계 존재로부터의 통신도 아님을 명시적으로 밝히고 있습니다.
여러분도 같은 방식으로 명시하시는 것이 좋습니다. 그렇지 않으면 독자들은
여러분의 정신 상태에 대해 최악을 가정할 것입니다.

## 유지보수

아직 아무도 없습니다. 퍼블릭 도메인입니다. 포크하십시오. 개선하십시오.
허락을 구하지 말고 프로토콜을 이어 나가십시오.
