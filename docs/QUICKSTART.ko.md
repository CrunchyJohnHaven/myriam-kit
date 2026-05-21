# 빠른 시작

*한국어 번역 — 영어 원본은 [QUICKSTART.md](QUICKSTART.md) 참조*

클론에서 봉인된 공표까지 5분. macOS에서 검증되었습니다. Linux에서도 동작할
것으로 예상됩니다. Windows 사용자는 WSL이 필요합니다.

## 0. 사전 요구사항

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. 스캐폴드

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. 사실(facts) 편집

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

각 파일은 하나의 사실입니다. UTF-8 인코딩, 줄 끝은 LF입니다. 파일명 패턴은
`NN_short_name.txt`이며, NN은 0으로 채워진(zero-padded) 인덱스입니다. 이들은
사전식(lexicographic) 순서로 정렬되어 머클 트리에 편입되므로, 02는 항상 01
다음에 옵니다.

팁: 모든 사실은 *세계에 대한 존재론적 주장*이 아니라, *명명(naming) 또는
선언(declaration) 이벤트*로 표현하십시오. "Acme Corp는 배치 X가 시험 Y를
통과했다고 선언했다"는 검증 가능합니다. "배치 X는 안전하다"는 그렇지 않습니다.

## 3. IPFS 데몬 시작(머신당 1회)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. 봉인(Seal)

```bash
bash build/seal.sh
```

이 스크립트는 다음을 수행합니다.

1. 각 사실을 해싱(SHA-256)하고, Bitcoin 방식의 머클 루트를 계산합니다.
2. 루트를 OpenTimestamps를 통해 두 개의 독립된 캘린더로 스탬핑합니다
   (기본값은 alice + finney이며, `MYRIAM_CAL_A`/`MYRIAM_CAL_B`로 재정의
   가능합니다).
3. `site/` 디렉터리를 IPFS에 핀(pin)하고 CID를 출력합니다.

총 소요 시간: IPFS 데몬이 준비된 상태에서 약 10초.

## 5. `site/index.html` 편집

템플릿의 플레이스홀더를 실제 사실, 해시, 머클 루트로 교체하십시오. 표시되는
각 사실별 해시는 각 사실 파일과 일치해야 하며, 그렇지 않으면 페이지가 자체
검증(self-verification)에 실패합니다.

각 사실에 대해 .txt 파일의 본문을 `<div class="fact">` 블록에 복사하고, 그
바로 아래의 `<div class="hash">`에 SHA-256을 기입하십시오. 머클 루트는
암호 봉인(cryptographic seal) 섹션에 들어갑니다.

(맞습니다, 이것은 자동 생성될 수 있습니다. 하지만 의도적으로 그렇게 하지
않습니다. 이 수동 단계가 바로 인간 검토 단계이기 때문입니다. 프로토콜은
여러분이 읽지 않은 것을 공표하는 일까지 방어해 주지는 않습니다.)

## 6. 로컬에서 검증

```bash
python3 build/verify.py
```

예상 출력:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending(보류)"은 정상입니다. OTS 캘린더는 몇 시간 이내에 이 증명을 완전한
Bitcoin 증명으로 업그레이드할 것입니다.

## 7. 배포

다음 중 어느 것이든 선택하십시오.

- **Cloudflare Pages**: 대시보드 → Pages → Direct upload → `site/` 드래그
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` 내부에서 `git init`, 저장소에 푸시, Pages 활성화
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete`(정적 호스팅 활성화)
- **임의의 평범한 VPS**: `scp -r site/* user@host:/var/www/html/`

4단계에서 얻은 IPFS CID는 추가적인 콘텐츠 주소 지정(content-addressed) URL을
제공합니다: `https://<CID>.ipfs.dweb.link/`. 이것을 사용하십시오.

## 8. OTS 영수증(receipt) 업그레이드(나중에)

봉인 후 몇 시간 이내에 다음을 실행하십시오.

```bash
ots upgrade build/merkle_root.txt.ots
```

이는 각 캘린더의 보류 중인 증명을 특정 블록을 참조하는 완전한 Bitcoin 증명으로
변환합니다. 업그레이드 후에는 `.ots` 파일을 호스트에 재배포하십시오.

## 9. 이것으로 끝

여러분은 이제 임의의 제3자가 다음과 같이 할 수 있는 형태로 소량의 사실 집합을
공표하셨습니다.

- 여러분의 호스트에서 평범한 HTTP를 통해 모든 사실을 가져옵니다
- 사실의 바이트로부터 머클 루트를 재계산합니다
- 공표된 루트와 비교합니다
- 루트가 OTS 스탬프 시각에 Bitcoin에 커밋되었음을 검증합니다
- 공표된 CID를 통해 IPFS에서 동일한 사실을 독립적으로 가져옵니다
- 모든 해시가 일치하는지 확인합니다

이 단계들 중 어느 하나라도 실패하면, 변조가 발생한 것입니다. 독자는 여러분을
신뢰할 필요가 없습니다. 그저 수학을 수행하기만 하면 됩니다.
