요구 사항
- 기존의 javascript 기반으로 만든 카카오톡을 backend를 쓰도록 확장합시다.
- 기존에는 한페이지 내에서 자바스크립트를 통해서 대화를 했다면 이제는 두개의 웹페이지를 띄운 다음 둘 간의 대화가 이루어지도록 백엔드를 거쳐 채팅이 오가야 합니다.
- 외적으로(UI) 바뀌는 것은 한페이지에 두개의 채팅창이 아니라 하나의 채팅창이 있으며 채팅창 위에 기존에 없던 아이디 입력창이 있습니다.
- 처음 페이지를 입력 후 자신의 유저 이름을 입력하면 유저 이름이 백엔드로 전달되고, 백엔드는 그 유저의 대화를 웹페이지에 전달하고, 웹페이지는 다시 받은 채팅을 유저에게 렌더링 해줍니다.
- 그리고 다른 웹페이지에 상대방도 동일한 방식으로 로그인(비슷한거?)를 하면 대화를 치면 이미 로그인한 상대방의 페이지에도 백엔드를 통해서 대화가 전달됩니다.
- 중요한 유의사항은 대화가 DB에 저장되어 있어서 서버가 꺼졌다가 켜져도 데이터가 남아있어야합니다. 이때 DB는 수업시간에 사용한 Sqlite3 사용하도록 합시다.
- 이미지 전송 필요 없음
- 제출문은 index.html, backend code(main.py), style, js 등이 담긴 프로젝트 폴더를 그대로 압축해서 '2020123456_김돌돌' 형식으로 제출하시면 됩니다
- 지각 제출은 받지 않습니다.