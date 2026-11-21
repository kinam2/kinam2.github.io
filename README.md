# kinam2.github.io

개인 연구 · Pure Dhamma(PD) 프로젝트 허브용 GitHub Pages 리포지터리.

### 자료실 등록

- `_posts/`에 공개 Markdown 글을 올리면 자료실에 자동 등록됩니다. 글 맨 위의 YAML에서 `title`, `topic`(또는 `주제`), `tags`와 `keywords`를 읽습니다. 주제가 없으면 `미분류`에 표시합니다.
- `library_title`로 자료실 제목만 바꿀 수 있습니다. 자료실에서만 숨기려면 `library: false`를 사용합니다. 이 설정은 글 자체를 비공개로 만들지 않습니다.
- 독립 HTML은 `_data/library.yml`에 등록합니다. Markdown 글을 이 파일에 중복 등록하지 않습니다.

### Pages CMS 사용법

[HTML 자료실 목록 편집 열기](https://app.pagescms.org/kinam2/kinam2.github.io/master/file/library) · [공개 자료실](https://cloudshand.netlify.app/library/)

Pages CMS는 독립 HTML의 **제목·주제·검색 태그·주소**를 편집합니다. HTML 본문을 바꾸는 도구는 아닙니다. 저장하면 `_data/library.yml`에 변경이 기록되고, Netlify 배포 후 공개 자료실에 반영됩니다.

#### 기존 자료 수정

1. Pages CMS에서 **HTML 자료실 목록**을 열고 수정할 항목을 찾습니다.
2. 제목이나 주제를 고치거나, 항목 안의 **검색 태그 → Add an item**을 눌러 태그를 하나씩 입력합니다. 예: `MN 118`. 태그는 자료실 돋보기에서 검색되며 목록에 표시되지는 않습니다.
3. 오른쪽 위 **Save**를 누릅니다. 배포가 끝나면 공개 자료실에서 제목, 링크 또는 태그 검색 결과를 확인합니다.

#### 새 HTML 자료 등록

1. HTML 파일을 먼저 GitHub의 `html/` 폴더에 올립니다. 기존 HTML을 같은 주소에서 교체하는 경우에는 다시 등록하지 않아도 됩니다.
2. Pages CMS에서 **목록 맨 아래의 Add an item**을 눌러 새 자료를 만듭니다. 항목 안의 같은 버튼은 태그 추가용입니다.
3. **제목·주제·HTML 주소**를 입력합니다. 주소에는 사이트 전체 주소 대신 `/html/파일이름.html`처럼 `/`부터 적습니다. 기존 주제 아래에 넣으려면 주제 표기를 기존 항목과 일치시킵니다.
4. 필요한 검색 태그를 추가하고 **Save**를 누른 뒤, 공개 자료실에서 새 링크가 열리는지 확인합니다.

공개 Markdown 글은 기존대로 `_posts/`에서 자동 등록되므로 이 목록에 따로 추가하지 않습니다.

### 단상 글 올리기

[Pages CMS](https://app.pagescms.org/kinam2/kinam2.github.io/master/file/library)에서 **단상 글 → 새 글 추가**를 선택합니다. **제목·날짜·본문**을 입력하고 **Save**를 누르면 공개 GitHub 저장소의 `_reflections/`에 저장됩니다. Netlify 배포 후 [단상 목록](https://cloudshand.netlify.app/reflections/)에 최신 날짜부터 표시됩니다. 단상은 기존 자료실 목록과 본문 검색에 포함되지 않습니다. 비공개 초고는 CMS에 저장하지 말고 Obsidian 등 개인 공간에 보관하세요.
