## 3. 레파지토리 제출 

- **`[주의]` 레파지토리 제출**은 해당 레파지토리의 ownership을 **학과 계정**으로 넘기는 것이므로 되돌릴 수 없습니다.
- **레파지토리 제출** 전, 더 이상 수정 사항이 없는지 다시 한번 확인하세요.
- github 레파지토리에서 Settings > General > Danger zone > Transfer 클릭
  <img src="https://github.com/user-attachments/assets/cb2361d4-e07e-4b5d-9116-aa80dddd8a8b" alt="소유주 변경 경로" width="500" />
  
- [ Specify an organization or username ]에 'PNUCSE'를 입력하고 확인 메세지를 입력하세요.
  <img src="https://github.com/user-attachments/assets/7c63955d-dcfe-4ac3-bdb6-7d2620575f3a" alt="소유주 변경" width="400" />

---




## 4. README.md 가이드 라인
- README 파일 작성시에 아래의 5가지 항목의 내용은 필수적으로 포함해야 합니다.
- 아래의 5가지 항목이외에 프로젝트의 이해를 돕기 위한 내용을 추가해도 됩니다.
- SAMPLE_README.md 이 단순한 형태의 예제이니 참고하세요.

### 1. 프로젝트 소개
#### 1.1. 배경 및 필요성
 웹어셈블리 (이하 Wasm)는 최신 웹 브라우저에서 실행할 수 있는 새로운 유형의 어셈블리 언어이다.[1] Wasm은 C, C++, Rust 다양한 언어를 컴파일하여 생성될 수 있으며, 다양한 런타임과 브라우저에서 실행된다. 다양한 언어로 작성한 코드를 번거로운 절차 없이도 한 번에 실행할 수 있고, 웹에 특화된 프로그래밍 언어 없이도 웹용 프로그램을 작성할 수 있는 편리성 때문에 Wasm을 사용하는 애플리케이션이 점차 많아지고 있다. 이러한 흐름에 따라 chrome, safari, edge 등 웹 브라우저에서도 점차 Wasm을 지원한다.
 사용자와의 실시간 소통을 필요로 하는 웹용으로 개발되었기 때문에, Wasm에 있어서 성능은 중요한 요소이다. Wasm 코드에 대한 효율적인 실행을 위해서, 웹브라우저의 Wasm 런타임은 최근에 Just-in-Time (JIT) 컴파일 기능을 지원하고 있다. JIT 컴파일러는 Wasm 코드에 대한 실행 요청이 처음 발생했을 때 Wasm 코드를 수행 중인 기기에 해당하는 기계어로 변환하고, 이 기계어를 수행한다. 이후 동일한 Wasm 코드에 대한 실행 요청이 들어오면 추가적인 컴파일 과정 없이 생성해둔 기계어 코드를 바로 수행하는 방식으로 동작하여 기존의 Interpreter 대비 빠른 수행을 보장한다.

#### 1.2. 목표 및 주요 내용
 본 연구에서는 하드웨어 기반의 메모리 보호 기술을 이용한 효과적이고도 안전한 JIT 컴파일된 코드 보호 기법을 제안한다. 우리는 Intel 사의 MPK를 이용하되, 코드스페이스에 할당되는 보호 키를 다양화하여 세밀하고 강력한 보호를 제공한다. 또한 빠르고 안전한 보호 키 할당 정책을 이용하여 메모리 권한 관리의 최소 크기인 4kB 단위로 보호를 제공한다.

### 2. 상세설계
#### 2.1. 시스템 구성도
![image](https://github.com/user-attachments/assets/1dfdb772-c269-4e30-973e-8e280d4160bd)

#### 2.1. 사용 기술
* wasm-micro-runtime: WAMR-2.1.2-37-g326eb5cd
* glibc: 2.35 (Ubuntu GLIBC 2.35-0ubuntu3.8)
* CoreMark: 1.0
* PolyBenchC: 4.2.1

### 3. 설치 및 사용 방법
* 레포지토리 클론
  ```
  git clone https://github.com/your-username/your-wamr-repository.git
  cd your-wamr-repository
  ```
* 대상 운영 체제에 맞는 디렉토리로 이동
  ```
  cd wasm-micro-runtime/product-mini/platforms/YOUR_OS_DIRECTORY
  ```
* 프로젝트 빌드
  ```
  sudo cmake [OPTIONS]
  sudo make
  ```
  `[OPTIONS]`를 필요한 빌드 옵션으로 변경하세요.
* WASM 애플리케이션 실행
  ```
  sudo ./iwasm YOUR_WASM_FILE.wasm
  ```

### 4. 소개 및 시연 영상
> 프로젝트에 대한 소개와 시연 영상을 넣으세요.

### 5. 팀 소개
| 이름     | 학과            | 학번        | 연락처            | 역할 분담                                    |
|----------|-----------------|-------------|-------------------|----------------------------------------------|
| 정윤서   | 정보컴퓨터공학부 | 202155603   | 216yoon@naver.com |                                              |




### 5.8. 유튜브 영상 추가
```markdown
[![영상 이름](유튜브 영상 썸네일 URL)](유튜브 영상 URL)
[![부산대학교 정보컴퓨터공학부 소개](http://img.youtube.com/vi/zh_gQ_lmLqE/0.jpg)](https://www.youtube.com/watch?v=zh_gQ_lmLqE)    
```
[![부산대학교 정보컴퓨터공학부 소개](http://img.youtube.com/vi/zh_gQ_lmLqE/0.jpg)](https://www.youtube.com/watch?v=zh_gQ_lmLqE)    

- 이때 유튜브 영상 썸네일 URL은 유투브 영상 URL로부터 다음과 같이 얻을 수 있습니다.

- `Youtube URL`: https://www.youtube.com/watch?v={동영상 ID}
- `Youtube Thumbnail URL`: http://img.youtube.com/vi/{동영상 ID}/0.jpg 
- 예를 들어, https://www.youtube.com/watch?v=zh_gQ_lmLqE 라고 하면 썸네일의 주소는 http://img.youtube.com/vi/zh_gQ_lmLqE/0.jpg 이다.

