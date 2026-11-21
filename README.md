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

[새 단상 바로 쓰기](https://app.pagescms.org/kinam2/kinam2.github.io/master/collection/reflections/new) · [공개 단상 목록](https://cloudshand.netlify.app/reflections/)

1. Pages CMS 왼쪽 메뉴에서 **단상 글**을 열고 오른쪽 위 **Add an entry**를 누릅니다. 위의 **새 단상 바로 쓰기** 링크로 들어가면 이 단계를 건너뛸 수 있습니다.
2. **제목**, **날짜**, **본문**을 입력합니다. 본문은 **Editor**에서 쓰거나 **Source**에서 Markdown으로 입력할 수 있습니다. 주제나 태그는 필요 없습니다.
3. 오른쪽 위 **Save**를 누릅니다. 글은 공개 GitHub 저장소의 `_reflections/`에 저장됩니다. 나중에 수정하려면 **단상 글** 목록에서 기존 글을 열어 고친 뒤 다시 **Save**를 누릅니다.
4. Netlify 배포가 끝나면 **대문 → 단상**에서 날짜와 제목이 최신순으로 표시되는지, 제목을 눌렀을 때 본문이 열리는지 확인합니다.

단상은 자료실 목록과 검색에 포함되지 않습니다. **Save**는 비공개 임시 저장이 아니므로, 공개하지 않을 초고는 Obsidian 등 개인 공간에 보관하세요.
