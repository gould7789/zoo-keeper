# Ruby On Rails - 동물원 관리 시스템
## 기술 스택 (Tech Stack)

### Backend
<img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"> <img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white">

### Frontend
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/ERB-template-green?style=for-the-badge">

### Tools & DevOps
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/VS_Code-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white">

---

## 시스템 설계 (System Architecture & Database)

이 프로젝트는 견고한 **MVC 패턴**과 **관계형 데이터베이스** 원칙을 기반으로 설계되었습니다.
사용자의 경험(UX) 흐름과 데이터의 무결성을 최우선으로 고려하였습니다.

### 1. 시스템 아키텍처 & 데이터 흐름 (Data Flow)
사용자의 행동(클릭, 입력)이 서버를 거쳐 데이터베이스에 도달하고, 다시 화면으로 렌더링되는 과정을 시각화했습니다.

<div align="center">
  <img src="https://github.com/user-attachments/assets/1067a080-95d3-491b-9848-900def32c0c2" width="800">
  <p>▲ Zoo Keeper 데이터 흐름도</p>
</div>

**주요 설계 특징**
* **직관적인 사용자 경험 (UX Flow):**
    * 기존의 단순 목록 나열 방식이 아닌, 가이드맵(Map)을 통한 공간 중심의 탐색 경험을 제공합니다.
    * `MapController`를 통해 구역(Section)을 선택하면, 해당 구역의 동물 데이터만 필터링하여 보여줍니다.
* **MVC 역할 분리 (Color Coding):**
    * **🟦 View (Blue):** 사용자가 상호작용하는 브라우저 화면 (HTML/ERB)
    * **🟧 Controller (Orange):** 라우팅 및 비즈니스 로직 처리, 데이터 필터링 수행
    * **🟩 Model & DB (Green):** 데이터 검증(Validation) 및 영구 저장 (PostgreSQL)

---

### 2. 데이터베이스 설계 (Database Schema)
시스템의 안정성과 확장성을 고려하여 **PostgreSQL**을 기반으로 설계를 진행했습니다.
주요 엔티티인 동물(`animals`)을 중심으로, 추후 확장될 사용자(`users`)와 게시글(`posts`) 관계를 정의했습니다.

<div align="center">
  <img width="500" height="500" alt="db_erd" src="https://github.com/user-attachments/assets/61d2ebf8-321f-49ba-aca6-9a43866d2902" />
  <p>▲ Zoo Keeper 데이터베이스 설계</p>
</div>

**주요 설계 특징**
* **데이터 무결성 강화 (Data Integrity):**
    * **Not Null 제약조건:** `species`(종), `quantity`(수량), `section`(구역) 등 필수 데이터에 `NOT NULL` 조건을 설정하여 불완전한 데이터 저장을 원천 차단했습니다.
    * **Default Value:** 실수 방지를 위해 `quantity`는 1로, `section`은 '미분류'로 기본값을 설정했습니다.
* **확장성을 고려한 스키마:**
    * **Users & Posts:** 현재는 관리자가 운영하지만, 추후 다수의 사육사가 일지를 작성할 수 있도록 **1:N 관계**를 미리 설계에 반영했습니다.
* **파일 저장소 (ActiveStorage):**
    * Rails의 **ActiveStorage**를 도입하여, `blobs`와 `attachments` 테이블을 통해 이미지 파일의 메타데이터와 물리적 경로를 효율적으로 관리합니다.
